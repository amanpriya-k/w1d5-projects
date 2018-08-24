require "byebug"
class PolyTreeNode
  attr_accessor :value, :parent, :children
  
  def initialize(val, parent = nil, children = [])
    @value = val
    @parent = parent 
    @children = children
  end
  
  def parent=(par)
    @parent.children.delete(self) if !(@parent == par) && @parent
    @parent = par
    @parent.children << self if !@parent.nil? && !@parent.children.include?(self)
  end
  
  def inspect
    return "Node: val: #{value} Children: #{children.map{|el| el.value}}"
  end
  
  def add_child(child_node)
    child_node.parent=self
  end
  
  def remove_child(child_node)
    raise Error unless self.children.include?(child_node)
    child_node.parent=nil
  end
  
  def dfs(target_value)
    return self if self.value == target_value
    self.children.each do |child|
      result = child.dfs(target_value)
      return result if result
    end
    nil
  end
  
  def bfs(target_value)
    queue = [self]
    until queue.empty?
      node = queue.shift
      return node if node.value == target_value
      node.children.each { |child| queue << child }
    end
    nil 
    
  end 
  
end