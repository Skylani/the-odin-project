require 'date'
require 'yaml'

class Hangman
  TURNS = 5

  def initialize
    words = generate_words
    @letter_bank = []
    @guesses_left = TURNS
    @chosen_char = ""
    @secret_word = words[rand words.length]
    @show_char = Array.new(@secret_word.length) { |i| false }
  end

  def play
    loop do
      show_word
      puts "Letter bank: #{print_letter_bank}"
      puts "Guesses left: #{@guesses_left}\n\n"

      if win?
        puts "You won!"
        break
      elsif @guesses_left == 0
        puts "Game over! Answer is \"#{@secret_word}\""
        break
      end

      print "Guess: "
      @chosen_char = gets.chomp.downcase

      # save game if user type 'save'
      if @chosen_char == 'save'
        save
        break
      end

      update_result
    end
  end

  def update_result
    correct_guess = false
    i = 0
    @secret_word.each_char do |c|
      if c.downcase == @chosen_char
        @show_char[i] = true
        correct_guess = true
      end
      i += 1
    end

    unless correct_guess
      @guesses_left -= 1
      @letter_bank << @chosen_char unless @chosen_char == ""
    end
  end

  def generate_words
    words = File.readlines "5desk.txt"
    words.map! { |e| e.strip }
    words.select! { |v| v.length > 4 && v.length < 13 }
  end

  def show_word
    i = 0
    @secret_word.each_char do |c|
      if @show_char[i]
        print "#{c} "
      else
        print "_ "
      end
      i += 1
    end
    puts ""
  end

  def win?
    @show_char.all? { |e| e == true }
  end

  def print_letter_bank
    @letter_bank.join(", ")
  end
end


def save
  yaml = YAML::dump(self)
  Dir.mkdir("save_games") unless Dir.exists? "save_games"
  filename = "save_games/#{DateTime.now.to_s}.sav"
  save_file = File.new(filename, 'w')
  save_file.write(yaml)
end

def load
  # get all game files
  game_files = Dir.entries("save_games").select { |f| f.include?(".sav") }
  game_files.each_with_index do |filename, index|
    puts "[#{index}] #{filename}"
  end

  # load requested game file
  print ": "
  index = gets.chomp
  game_file = "save_games/#{game_files[index.to_i]}"
  yaml = File.open(game_file).read
  YAML::load(yaml)
end

puts "[N]ew Game   [L]oad Game"
input = ""
loop do
  print ": "
  input = gets.chomp.downcase
  break if input == 'n' || input == 'l'
  puts "Invalid input! Type 'n' or 'l'"
end

game = input == 'l' ? load : Hangman.new
game.play
