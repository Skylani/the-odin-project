class Hangman
  TURNS = 5

  def initialize
    @words = generate_words
    @letter_bank = []
    @guesses_left = TURNS + 1
    @chosen_char = ""
  end

  def play
    @secret_word = @words[rand @words.length]
    @show_char = Array.new(@secret_word.length) { |i| false }

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

      # prompt for guess
      print ": "
      @chosen_char = gets.chomp.downcase
    end
  end

  def generate_words
    words = File.readlines "5desk.txt"
    words.map! { |e| e.strip }
    words.select! { |v| v.length > 4 && v.length < 13 }
  end

  def show_word
    correct_guess = false
    i = 0
    @secret_word.each_char do |c|
      if @show_char[i]
        print "#{c} "
      else
        if c.downcase == @chosen_char
          print "#{c} "

          @show_char[i] = true
          correct_guess = true
        else
          print "_ "

        end
      end
      i += 1
    end
    puts ""

    unless correct_guess
      @guesses_left -= 1
      @letter_bank << @chosen_char unless @chosen_char == ""
    end
  end

  def win?
    @show_char.all? { |e| e == true }
  end

  def print_letter_bank
    @letter_bank.join(", ")
  end

end

game = Hangman.new
game.play
