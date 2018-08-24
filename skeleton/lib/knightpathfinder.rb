require_relative "00_tree_node"

class KnightPathFinder
  attr_reader :root_node, :visited_pos
  MOVES = [[1,2],[1,-2],[2,1],[2,-1],[-1,-2],[-1,2],[-2,1],[-2,-1]]
  
  def self.valid_moves(pos)
    x, y = pos
    moves = []
    
    MOVES.each do |el|
      pos = [x+el[0],y+el[1]]
      moves << pos if KnightPathFinder.is_valid_pos?(pos)
    end
    moves
  end

  def self.is_valid_pos?(pos)
    pos.all? { |el| (0..7).include?(el) }
  end  
  
  def initialize(pos)
    @root_node = PolyTreeNode.new(pos)
    @visited_pos = [pos]
  end
  
  def new_move_positions(pos)
    valid_positions = KnightPathFinder.valid_moves(pos).reject { |move| @visited_pos.include?(move) }
    @visited_pos.concat(valid_positions)
    valid_positions
  end
  
  def find_path(ending_pos)
    build_move_tree
    @target = ending_pos
    found_node = @root_node.bfs(@target)
    trace_path_back(found_node) if found_node
  end
  
  def trace_path_back(node)
    return [node.value] if node.parent == nil
    trace_path_back(node.parent) << node.value
  end

  private
  def build_move_tree
    queue = [@root_node]
    
    until queue.empty?
      node = queue.shift
      
      new_move_positions(node.value).each do |pos|
        child_node = PolyTreeNode.new(pos,node)
        child_node.parent = node
        queue.push(child_node)
      end
      
    end
  end
  
end