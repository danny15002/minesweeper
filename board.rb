require_relative 'tile'

class Board

  attr_reader :grid

  def initialize(grid = Array.new(9) {Array.new(9)})
    @grid = grid

  end

  def populate_grid
    @grid.each_with_index do |row, i|
      row.each_index do |col|
        row[col] = Tile.new(self, [i,col])
      end
    end
  end

  def seed_bombs
    bomb_count = 0

    until bomb_count == 10
      row = rand(@grid.length-1)
      col = rand(@grid[0].length-1)
      if !@grid[row][col].bombed
        @grid[row][col].bombed = true
        bomb_count += 1
      end
    end
  end

  def render
    @grid.each do |row|
      row.each_index do |col|
        print "#{row[col].state} "
      end
      puts ""
    end
  end

  def make_move(pos)
    row = pos[0] - 1
    col = pos[1] - 1

    @grid[row][col].reveal
  end
end

board = Board.new
board.populate_grid
board.render
board.seed_bombs
board.make_move([3,3])
system 'clear'
board.render
