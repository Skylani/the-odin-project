class Ttt
  attr_accessor :p1, :p2

  def initialize
    @p1 = []
    @p2 = []
    drawGrid
  end

  def drawGrid
    puts

    # print grid
    if !@p1.empty?
      for i in 1..9
        # determine move of current space
        if @p1.include?(i)
          move = 'x'
        elsif @p2.include?(i)
          move = 'o'
        else
          move = ' '
        end

        if i % 3 != 0
          print " #{move} |"
        else
          puts " #{move} "
          puts "---+---+---" if i != 9
        end
      end

    # print initial grid w/ coordinate
    else
      for i in 1..9
        if i % 3 != 0
          print " #{i} |"
        else
          puts " #{i} "
          puts "---+---+---" if i != 9
        end
      end
    end
    puts
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

end


loop do
  # new game
  puts 'New game!'
  game = Ttt.new
  current_player = 1
  input = 0

  loop do

    # get player input
    loop do
      print "Player #{current_player}: "

      input = gets.chomp
      input = input.to_i

      if game.p1.include?(input) || game.p2.include?(input) || input < 1 || input > 9
        puts 'Invalid input! Try again.'
      else
        break
      end
    end

    # save input
    current_player == 1 ? game.p1 << input : game.p2 << input

    # update board
    game.drawGrid

    # win?
    if game.win?(current_player == 1 ? game.p1 : game.p2)
      puts "Result: Player #{current_player} win!"
      break
    # draw?
    elsif game.no_more_moves?
      puts 'Result: draw'
      break
    else
      current_player == 1 ? current_player = 2 : current_player = 1
    end

  end

  puts 'Play again? [y/n]'
  input = gets.chomp
  break if input == 'n'
end