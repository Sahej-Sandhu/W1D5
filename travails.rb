require_relative "skeleton/lib/00_tree_node.rb"

class KnightPathFinder
  RELATIVE_CORDS = [
    [-1,-2],
    [1,-2],
    [2,-1],
    [2,1],
    [1,2],
    [-1,2],
    [-2,1],
    [-2,-1]
  ]
  def initialize
    @visited_positions = []
  end

  def valid_moves(pos)
    x,y = pos
    new_moves = []
    RELATIVE_CORDS.each do |cord|
      new_moves << [x+cord[0], y+cord[1]]
    end
    new_moves
  end

  def new_move_positions(pos)
    new_moves = valid_moves(pos)
    new_moves.reject do |move|
      @visited_positions.include?(move)
    end
    @visited_positions.concat(new_moves)
    new_moves
  end

end
