class Ttt
  attr_accessor :p1, :p2

  def initialize
    @p1 = []
    @p2 = []
    drawGrid
  end

  def drawGrid
    puts
    for i in 1..9
      if i % 3 == 0
        puts " #{i} "
        puts "---+---+---" if i != 9
      else
        print " #{i} |"
      end
    end
    puts
  end

  def win?

  end

end


loop do
  # new game
  game = Ttt.new
  win = false
  current_player = 1

  while !win
    # wait for player input
    print "Player #{current_player}: "

    # get player input
    input = gets.chomp
    input = input.to_i
    current_player == 1 ? game.p1 << input : game.p2 << input

    # update board
    game.drawGrid

    # win?
    if game.win?
      win = true
      puts "Player #{current_player} win!"
      break
    else
      current_player == 1 ? current_player = 2 : current_player = 1
    end

  end
end