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
    result = {}
    result[:count] = 0
    result[:length] = self.length

    while start <= finish do
      mid = (finish - start) / 2
      if self[mid] == num
        result[:index] = mid
        return result
      elsif self[finish] == num
        result[:index] = finish
        return result
      elsif self[start] == num
        result[:index] = start
        return result 
      elsif self[mid] < num
        start = mid + 1
        finish -= 1
        start += 1
      elsif self[mid] > num
        finish = mid - 1
        start += 1
      end
      result[:count] += 1
    end
    result[:index] = -1
    return result
  end
end

tenToOneThousand = [].toOneThousand
result  = tenToOneThousand.search(880)
p result
