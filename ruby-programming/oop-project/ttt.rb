class Grid

  def initialize
    puts
    for i in 1..9
      if i % 3 != 0
        print " #{i} |"
      else
        puts " #{i} "
        puts "---+---+---" if i != 9
      end
    end
    puts
  end

  def draw(p1, p2)
    puts
    for i in 1..9
      # determine move of current space
      if p1.include?(i)
        move = 'x'
      elsif p2.include?(i)
        move = 'o'
      else
        move = ' '
      end

      # print cell
      if i % 3 != 0
        print " #{move} |"
      else
        puts " #{move} "
        puts "---+---+---" if i != 9
      end
    end
    puts
  end

end

class Ttt
  def initialize
    @p1 = []
    @p2 = []
  end

  def win?(player)
    win_list = [[1, 2, 3], [4, 5, 6], [7, 8, 9],
                [1, 4, 7], [2, 5, 8], [3, 6, 9],
                [1, 5, 9], [3, 5, 7]]

    win_list.each do |set|
      win = true
      set.each do |x|
        if !player.include?(x)
          win = false
          break
        end
      end
      return true if win
    end
    false
  end

  def no_more_moves?
    @p1.size + @p2.size == 9
  end

  def play
    @grid = Grid.new
    current_player = 1
    input = 0

    loop do
      # get player input
      loop do
        print "Player #{current_player}: "

        input = gets.chomp
        input = input.to_i

        if @p1.include?(input) || @p2.include?(input) || input < 1 || input > 9
          puts 'Invalid input! Try again.'
        else
          break
        end
      end

      # save input
      current_player == 1 ? @p1 << input : @p2 << input

      # update board
      @grid.draw(@p1, @p2)

      # win?
      if win?(current_player == 1 ? @p1 : @p2)
        puts "Result: Player #{current_player} win!"
        break
      # draw?
      elsif no_more_moves?
        puts 'Result: draw'
        break
      else
        current_player == 1 ? current_player = 2 : current_player = 1
      end

    end

  end

end

loop do
  # new game
  puts 'New game!'
  game = Ttt.new
  game.play

  puts 'Play again? [y/n]'
  input = gets.chomp
  break if input == 'n'
end