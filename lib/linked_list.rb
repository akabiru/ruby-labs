class Node
  attr_accessor :data, :next_node

  def initialize(data)
    @data = data
  end
end

class LinkedList
  attr_accessor :head, :tail

  def initialize(name=nil)
    if name.nil?
      @head = name
    else
      @head = @tail = Node.new(name)
    end
  end

  def empty?
    @head.nil?
  end

  def my_itr
    cursor = @head
    while cursor != nil
      yield cursor
      cursor = cursor.next_node
    end
  end

  def append(name)
    if empty?
      @head = @tail = Node.new(name)
    else
      new_node = Node.new(name)
      @tail.next_node = new_node
      @tail = new_node
    end
    self
  end

  def prepend(name)
    if empty?
      @head = @tail =  Node.new(name)
    else
      new_node = Node.new(name)
      new_node.next_node = @head
      @head = new_node
    end
    self
  end

  def count
    cursor = @head
    count = 0
    while cursor != nil
      count += 1
      cursor = cursor.next_node
    end
    count
  end

  def insert(value, name)
    list_len = self.count
    counter = 0
    cursor = @head
    before_cursor = cursor
    
    if value.between?(1, list_len)
      while cursor != nil && counter < list_len
        if counter == value
          new_node = Node.new(name)
          new_node.next_node = cursor
          before_cursor.next_node = new_node
          return self
        end
        counter += 1
        before_cursor = cursor
        cursor = cursor.next_node
      end
    else
      self.append(name)
    end
  end

  def pop
    cursor = @head
    while cursor != nil
      if cursor.next_node
        before_last = cursor
      end
      cursor = cursor.next_node
    end
    node_to_return = before_last.next_node
    before_last.next_node = nil
    @tail = before_last
    node_to_return
  end

  def find_by_value(name)
    my_itr { |cursor| return cursor if cursor.data == name }
  end

  def include?(name)
    value = find_by_value(name)
    value.nil? ? false : true
  end

  def remove_by_value(name)
    cursor = @head
    before_last = cursor
    while cursor != nil
      if cursor.data == name
        before_last.next_node = cursor.next_node
        break
      end
      before_last = cursor
      cursor = cursor.next_node
    end
  end

  def draw_list
    cursor = @head
    drawing = ''
    while cursor != nil
      if cursor.next_node
        drawing << "#{cursor.data} -> "
      else
        drawing << "#{cursor.data}"
      end
      cursor = cursor.next_node
    end
    drawing
  end
end