require 'jumpstart_auth'
require 'bitly'

class MicroBlogger
  attr_reader :client
  MAX_MSG_LENGTH = 140

  def initialize
    puts "Initializing MicroBlogger"
    @client = JumpstartAuth.twitter
  end

  def run
    puts "Welcom to the JSL Twitter Client!"
    command = ""
    while command != "q"
      printf "enter command: "
      input = gets.chomp
      parts = input.split(" ")
      command = parts[0]

      case command
        when 'q' then puts "Goodbye!"
        when 't' then tweet parts[1..-1].join(" ")
        when 'dm' then dm(parts[1], parts[2..-1].join(" "))
        when 'spam' then spam_my_followers(parts[1..-1].join(" "))
        when 'elt' then everyones_last_tweet
        when 's' then shorten(parts[1])
        when 'turl' then tweet(parts[1..-2].join(" ") + " " + shorten(parts[-1]))
        else
          puts "Sorry, I don't know how to #{command}"
      end
    end
  end

  def tweet(message)
    # check msg length
    if message.length <= MAX_MSG_LENGTH
      @client.update(message)
    else
      puts "Error: Message is longer than 140 characters!"
    end
  end

  # send a direct message to a follower
  def dm(target, message)
    puts "Trying to send #{target} this direct message:"
    puts message

    screen_names = @client.followers.collect { |follower| @client.user(follower).screen_name }

    if screen_names.include?(target)
      message = "d @#{target} #{message}"
      tweet(message)
    else
      puts "Error: You can only DM people who follow you!"
    end
  end

  # get an array of all followers' names
  def followers_list
    screen_names = []
    @client.followers.each do |follower|
      screen_names << @client.user(follower).screen_name
    end
    screen_names
  end

  # send a direct message to all followers
  def spam_my_followers(message)
    followers_list.each do |follower|
      dm(follower, message)
    end
  end

  # show latest tweet of each friend
  def everyones_last_tweet
    friends_name = @client.friends.collect { |friend| @client.user(friend).screen_name }
    friends_name = friends_name.sort_by { |friend_name| friend_name.downcase }
    friends_name.each do |friend_name|
      # find each friend's last message
      message = @client.user(friend_name).status.text
      timestamp = @client.user(friend_name).status.created_at

      # print each friend's screen name
      puts "#{friend_name} said this on #{timestamp.strftime("%A, %b %d")}..."

      # print each friend's last message
      puts message

      puts "" # separate people
    end
  end

  # shorten url
  def shorten(original_url)
    # Shortening Code
    Bitly.use_api_version_3
    bitly = Bitly.new('hungryacademy', 'R_430e9f62250186d2612cca76eee2dbc6')

    puts "Shortening this URL: #{original_url}"
    url = bitly.shorten(original_url).short_url
    puts "shorten url: #{url}"
    url
  end

end

blogger = MicroBlogger.new
blogger.run
