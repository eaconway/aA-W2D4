def my_min(array)
  array.each do |el1|
    return el1 if array.all?{|el2| el2 >= el1}
  end
end

my_min([ 0, 3, 5, 4, -5, 10, 1, 90 ]) #TC: n^2

def my_min_one(array)
  lowest = 0
  
  (0...array.length).each do |idx|
    lowest = array[idx] if lowest > array[idx]
  end
  
  lowest
end

my_min_one([ 0, 3, 5, 4, -5, 10, 1, 90 ]) #TC: n

def largest_contiguous_sum(list)
  subs = []
  
  (0...list.length).each do |idx|
    (idx...list.length).each do |jdx|
      subs << list[idx..jdx]
    end
  end
  max = 0
 #subs.length
  subs.each do |arr|
    sub_sum = arr.sum
    max = sub_sum if max < sub_sum
  end
  max
end

#largest_contiguous_sum([ 0,-6, 3, 5])
p largest_contiguous_sum([2, 3, -6, 7, -6, 7])

def largest_contiguous_sum_o_n(list)
  # list.reduce(0) {|acc, el| acc += el if el > 0 ; acc}
  current_sum = 0
  sum = 0
  
  list.each do |el|
    current_sum += el
    if current_sum < 0
      current_sum = 0
    else 
      sum = current_sum if current_sum > sum
    end
  end
  sum
end

#largest_contiguous_sum_o_n([ 0, 3, 5,-6])
p largest_contiguous_sum_o_n([2, 3, -6, 7, -6, 7])