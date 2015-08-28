class Tile

  attr_accessor :bombed, :revealed, :state

  def initialize(board, coordinates)
    @bombed = false
    @flagged = false
    @revealed = false
    @state = "*"
    @board = board
    @row = coordinates[0]
    @col = coordinates[1]
  end

  def reveal
    @revealed = true
    if @bombed
      @state = "B"
      return false
    else
      @state = " "
    end

    neighbors
    @neighbors.each do |neighbor| #neighbor is tile object
      neighbor.reveal unless (neighbor_bomb_count > 0)
    end

  end

  def neighbors
    @neighbors = []
    -1.upto(1) do |i|
      -1.upto(1) do |j|
        check_row = @row + i
        check_col = @col + j
        check_tile = @board.grid[check_row][check_col]
        puts check_tile
        if check_row > 0 && check_col > 0
          @neighbors << check_tile unless check_tile.revealed #neighboring tiles get placed into @neighbors
        end
      end
    end

  end

  def neighbor_bomb_count
    bomb_count = 0
    @neighbors.each {|neigh_tile| bomb_count += 1 if neigh_tile.bombed}
    bomb_count
  end

  def inspect

  end


end
