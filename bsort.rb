module BubbleSort
  # 通常のソート
  def bubblesort(array)
    array.size.times do |t|
      (1...(array.size-t)).each do |j|
	if array[j] < array[j-1]
	  tmp = array[j]
	  array[j] = array[j-1]
	  array[j-1] = tmp
	end
      end
    end
    array
  end
end
