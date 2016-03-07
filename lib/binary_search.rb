class Array
  def toTwenty
    (1..20).to_a
  end

  def toForty
    2.step(40, 2).to_a
  end

  def toOneThousand
    10.step(1000, 10).to_a
  end

  def search(num)
    start = 0
    finish = self.length - 1

    while start <= finish
      mid = (finish + start) / 2
      
      if self[mid] == num
        self[mid]
      elsif self[start] == num
        self[start]
      elsif self[finish] == num
        self[finish]
      elsif self[mid] < num
        finish = mid - 1
      else
        start = mid + 1
      end
    end
  end		 	 
end