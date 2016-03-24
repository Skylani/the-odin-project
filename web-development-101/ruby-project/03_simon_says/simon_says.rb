def echo string
  string
end

def shout string
  string.upcase
end

def repeat string, number = 2
  final_string = string
  (number-1).times do
    final_string = final_string + ' ' + string
  end
  final_string
end

def start_of_word string, number
  string.slice(0, number)
end

def first_word string
  string.split.first
end

def titleize string
  string_array = string.split
  string_array[0] = string_array[0].capitalize
  result = string_array[0]

  if string_array.length > 1
    for i in 1..string_array.length-1
       unless (string_array[i] == 'the' or string_array[i] == 'and' or string_array[i] == 'over')
         string_array[i] = string_array[i].capitalize
       end
    end
    result = string_array.join(' ')
  end
  result
end