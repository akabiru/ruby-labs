module Enumerable
  def my_each
    i = 0
    while i < self.length
      yield self[i]
      i += 1
    end
  end

  def my_each_with_index
    i = 0
    while i < self.length
      yield(self[i], i)
      i += 1
    end
  end
  
  def my_itr
    self.my_each do |item|
      yield item
    end
  end

  def my_select
    result = []
    my_itr { |item| result << item if yield item  }
    result
  end
  
  def my_all?	  
    my_itr { |item| return false unless yield item }	  
    true
  end

  def my_none?
    my_itr { |item| return false if yield item }
    true
  end
  
  def my_count(option=nil)
    count = 0
    if option
      my_itr { |item| count += 1 if item == option }
      count
    elsif block_given?
      my_itr { |item| count += 1 if yield item }
      count
    else
      self.length
    end
  end

  def my_map
    new_arr = []
    my_itr { |item| new_arr << yield(item) }
    new_arr
  end

  def my_inject(initial=nil)
    result = initial.nil? ? self.first : initial
    my_itr { |item| result = yield(result, item) }
    result
  end

  def my_map_with_proc(&procedure)
    new_arr = []
    my_itr { |item| new_arr << procedure.call(item) }
    new_arr
  end

  def my_map_with_proc_block(procedure)
    new_arr = []
    if block_given?
      my_itr do |item|
        new_item = procedure.call(item)
        new_arr << yield(new_item)
      end
    else
      my_itr { |item| new_arr << procedure.call(item) }
    end
    new_arr
  end

end
