require "csv"
require "sunlight/congress"
require "erb"
require "date"

Sunlight::Congress.api_key = "e179a6973728c4dd3fb1204283aaccb5"

def clean_zipcode(zipcode)
  zipcode.to_s.rjust(5, "0")[0..4]
end

def clean_phone_number(phone)
  phone = phone.to_s.scan(/\d/).join

  if phone.length == 11 && phone[0] == '1'
    phone = phone[1..10]
  elsif phone.length < 10 || phone.length > 10
    phone = '0'*10
  end
  phone
end

def legislators_by_zipcode(zipcode)
  Sunlight::Congress::Legislator.by_zipcode(zipcode)
end

def save_thank_you_letters(id, form_letter)
  Dir.mkdir("output") unless Dir.exists? "output"

  filename = "output/thanks_#{id}.html"

  File.open(filename, 'w') do |file|
    file.puts form_letter
  end
end

def clean_date(regtime)
  regtime.gsub(/\/(\d\d) /, '/20\1 ')
end

def peak(hash)
  hash.max_by{ |k, v| v}[0]
end

puts "EventManager Initialized!"

contents = CSV.open "event_attendees.csv", headers: true, header_converters: :symbol
template_letter = File.read "form_letter.erb"
erb_template = ERB.new template_letter
regtime_hash = Hash.new(0)
regday_hash = Hash.new(0)

contents.each do |row|
  id = row[0]
  name = row[:first_name]

  regtime = DateTime.strptime(clean_date(row[1]), '%m/%d/%Y %H:%M')
  regtime_hash[regtime.hour] += 1
  regday_hash[regtime.wday] += 1

  zipcode = clean_zipcode(row[:zipcode])
  phone = clean_phone_number(row[:homephone])

  legislators = legislators_by_zipcode(zipcode)

  form_letter = erb_template.result(binding)
  save_thank_you_letters(id, form_letter)
end

puts "Peak registration hour: #{peak(regtime_hash)}"
puts "Peak registration day: #{peak(regday_hash)}"