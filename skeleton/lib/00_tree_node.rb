require "byebug"
class PolyTreeNode
  attr_reader :children
  def initialize(value)
    @value = value
    @children = []
  end

  def parent
    @parent
  end

  def children
    @children
  end

  def value
    @value
  end

  def inspect
    if @children.empty?
      @value.inspect
    else
      @children.inspect
    end
  end

  def add_child(child)
    child.parent = self unless @children.include?(child)
  end

  def remove_child(child)
    if @children.include?(child)
      @children.delete(child)
      child.parent = nil
    else
       raise "this is not my child"
    end
  end

  def parent= (new_parent)
    old_parent = @parent
    return if new_parent == old_parent
    old_parent.children.delete(self) unless old_parent.nil?
    new_parent.children << self unless new_parent.nil?
    @parent = new_parent
  end

  def dfs(target_value)
    return self if self.value == target_value
    @children.each do |child|
      found = child.dfs(target_value)
      return found unless found.nil?
    end
    nil
  end

  def bfs(target_value)
    queue = [self]
    until queue.empty?
       node = queue.shift
       return node if node.value == target_value
       queue.concat(node.children)
    end
    nil
  end
end
