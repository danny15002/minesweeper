require_relative 'tile'

class Board

  def initialize(grid = Array.new(9) {Array.new(9)})
    @grid = grid

  end

  def populate_grid
    @grid.each do |row|
      row.each do |col|
        grid[row][col] = Tile.new(self)
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
end
