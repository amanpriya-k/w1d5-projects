class KnightPathFinder
  attr_accessor :root_pos, :visited_pos
  
  def self.valid_moves(pos)
    x, y = pos
    moves = []
    moves << [x+2, y+1] if KnightPathFinder.is_valid_pos?([x+2, y+1])
    moves << [x+2, y-1] if KnightPathFinder.is_valid_pos?([x+2, y-1])
    moves << [x+1, y+2] if KnightPathFinder.is_valid_pos?([x+1, y+2])
    moves << [x+1, y-2] if KnightPathFinder.is_valid_pos?([x+1, y-2])
    moves << [x-2, y+1] if KnightPathFinder.is_valid_pos?([x-2, y+1])
    moves << [x-2, y-1] if KnightPathFinder.is_valid_pos?([x-2, y-1])
    moves << [x-1, y+2] if KnightPathFinder.is_valid_pos?([x-1, y+2])
    moves << [x-1, y-2] if KnightPathFinder.is_valid_pos?([x-1, y-2])
    moves
  end

  def self.is_valid_pos?(pos)
    pos.all? { |el| (0..7).include?(el) }
  end  
  
  def initialize(pos)
    @root_pos = pos
    @visited_pos = [pos]
  end
  
  def new_move_positions(pos)
    valid_positions = KnightPathFinder.valid_moves(pos).reject { |move| @visited_pos.include?(move) }
    @visited_pos.concat(valid_positions)
    valid_positions
  end

  
end