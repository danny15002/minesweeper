require_relative 'board'

class Game

  def initialize
    @board = Board.new
  end

  def play

    lose = true

    until !lose
      puts "Select a square with a row and column (ex. 1,1)"
      user_input = gets.chomp
      pos = parse(user_input)
      lose = @board.make_move(pos) #make_move will return false when we lose
      @board.render
      puts "You lose." if !lose
      Kernel.abort("You Win!") if win?
    end
  end

  def parse(string)
    string.split(",").map { |x| Integer(x) }
  end


  def win? # we win when all the non-bomb squares are revealed
    flat_board = @board.grid.flatten
    revealed_count = 0

    flat_board.each do |tile|
      revealed_count += 1 if tile.revealed
    end

    return true if (revealed_count + @board.bomb_count) == flat_board.length

  end

end


game = Game.new
game.play
