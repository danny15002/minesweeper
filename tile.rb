class Tile

  attr_accessor :bombed
  
  def initialize(board)
    @bombed = false
    @flagged = false
    @revealed = false
    @state = "*"
    @board = board
  end

  def reaveal
  end

  def neighbors
  end

  def neighbor_bomb_count
  end

  def inspect

  end

end
