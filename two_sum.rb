def bad_two_sum?(arr, target)
  # TC: n^2, space: O(1)
  (0...arr.length-1).each do |idx|
    (idx+1...arr.length).each do |jdx|
      return true if arr[idx] + arr[jdx] == target
    end
  end
  
  false
end

arr = [0, 1, 5, 7]
bad_two_sum?(arr, 6)
bad_two_sum?(arr, 10)


def good_two_sum?(arr, target)
  arr.each do |el|
    x = target - el
    return true if arr.bsearch { |el1| el1 == x}
  end
  false
end

p good_two_sum?(arr, 10)