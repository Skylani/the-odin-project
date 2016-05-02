
class Mastermind
  TURNS = 12

  def initialize
    @code = Code.new
  end

  def play
    win = false

    TURNS.times do
      print ': '

      # player guess
      @guess = gets.chomp
      @guess = @guess.split
      @guess.map! { |e| e.to_sym }

      # check guess
      if @code.array == @guess
        puts 'Code breaked! You win!'
        win = true
        break
      else
        calculate_keys
        feedback
      end
    end

    unless win
      puts 'Out of turns! Game over!'
      puts "Code: #{@code.array}"
    end
  end


  def feedback
    puts "colored keys = #{@colored_keys}  white keys = #{@white_keys}"
    puts
  end

  def calculate_keys
    @colored_keys = 0
    @white_keys = 0
    temp_code = @code.array
    mark_guess = Array.new(Code::LENGTH) { false } # mark done with current guess
    mark_code = Array.new(Code::LENGTH) { false }  # mark done with current code

    # count colored keys
    Code::LENGTH.times do |i|
      if @guess[i] == temp_code[i]
        @colored_keys += 1
        mark_code[i] = true
        mark_guess[i] = true
      end
    end

    # count white keys
    Code::LENGTH.times do |i|
      if !mark_guess[i]
        Code::LENGTH.times do |j|
          if !mark_code[j] && @guess[i] == temp_code[j]
            @white_keys += 1
            mark_code[j] = true
            break
          end
        end
      end
    end

  end

end

class Code
  attr_reader :array
  LENGTH = 4

  def initialize
    @array = []
    LENGTH.times { @array << Color.random }
  end
end


class Color
  @@all = [:b, :g, :o, :r, :w, :y]
  @@count = @@all.size

  def self.random
    @@all[rand(@@count)]
  end
end


game = Mastermind.new
game.play