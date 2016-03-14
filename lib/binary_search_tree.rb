class Node
  attr_accessor :value, :left, :right, :parent

  def initialize(value)
    @value = value
  end

  def insert(value)
    if value == @value
      return false
    elsif value < @value
      if @left.nil?
        new_node = Node.new(value)
        new_node.parent = self
        @left = new_node
        return true
      else
        @left.insert(value)
      end
    elsif value > @value
      if @right.nil?
        new_node = Node.new(value)
        new_node.parent = self
        @right = new_node
        return true
      else
        @right.insert(value)
      end
    end		
  end

  def to_s
    string = '('
    string << "#{@left.value} <= " if @left
    string << "(#{@value})"
    string << " => #{@right.value}) => " if @right
    string << "#{@parent.value}" if @parent
    string
  end
end

class Tree
  attr_accessor :root

  def initialize(arr)
    make_tree(arr)
  end

  def make_tree(arr)
    mid = (arr.size - 1) / 2
    @root = Node.new(arr[mid])
    arr.each do |item|
      @root.insert(item)
    end
  end

  def breadth_first_search(item)
    queue = [@root]
    while !queue.empty?
      current_node = queue.shift
      return current_node if current_node.value == item
      queue.unshift(current_node.left) unless current_node.left.nil?
      queue.unshift(current_node.right) unless current_node.right.nil?
    end
    return nil
  end

  def depth_first_search(item)
    stack = [@root]
    while !stack.empty?
      current_node = stack.pop
      return current_node if current_node.value == item
      stack << current_node.left unless current_node.left.nil?
      stack << current_node.right unless current_node.right.nil?
    end
    return nil
  end

  def dfs_rec(item, node=@root)
    return nil if node.nil?
    return node if node.value == item
    left_node = dfs_rec(item, node.left)
    right_node = dfs_rec(item, node.right)
  end
end