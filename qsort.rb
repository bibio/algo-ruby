module QSort
  def quicksort(s=0,n=self.size)
    if n - s < 2
      return
    end

    pivot_idx = s+(n-s)/2

    left = s
    right = n - 1

    while left < right

      # left
      i = 0
      while i < n and self[i] < self[pivot_idx]
	i += 1
      end
      # right
      j = n - 1 
      while j >= 0 and self[j] > self[pivot_idx]
	j -= 1
      end

      if i < j  
	tmp = self[j]
	self[j] = self[i]
	self[i] = tmp
      end
      left += 1
      right -= 1
    end
    quicksort(0, left)
    quicksort(left, n - left);
  end

  def quicksort2
    return self if self.size < 2
    h = self.size / 2
    left,right = (self[0...h] + self[h+1...self.size]).partition { |i| i < self[h] }
    left.quicksort2 + [self[h]] + right.quicksort2
  end
end

class Array
  include QSort
end

