require "byebug"

def first_anagram?(str1, str2)
  #O(n!)
  anagrams = str1.chars.permutation 
  
  #n
  return true if anagrams.include?(str2.chars)
  false
end

# p first_anagram?("gizmo", "sally")

def second_anagram?(str1, str2)
  return unless str1.length == str2.length
  
  str1_arr = str1.chars
  str2_arr = str2.chars
  #n*(m+m) = n * 2m == O(n^2)
  
  str1_arr.each_with_index do |char, idx|
    idx2 = str2_arr.index(char)
    str2_arr.delete_at(idx2) unless idx2.nil?
  end
  
  #c
  return true if str2_arr.empty?
  false
end

# p second_anagram?("gizmo", "sally")
# p second_anagram?("gizmo", "mogzi")
# p second_anagram?("gizmo", "sally")

def third_anagram?(str1,str2)
  #WORST CASE time complexity 2n + 2n^2 == O(n^2)
  #Average case time complexity 2n + 2nlogn == O(nlogn)
  str1.chars.sort == str2.chars.sort
end

# p third_anagram?("gizmo", "mogzi")
# p third_anagram?("gizmo", "sally")



def fourth_anagram?(str1,str2)
  hash1 = Hash.new(0)
  hash2 = Hash.new(0)
  #time complexity 2(n + n) + m = 4n + m == O(n)
  str1.chars.each {|ch| hash1[ch] += 1 }
  str2.chars.each {|ch| hash2[ch] += 1 }
  
  hash2 == hash1
end
p fourth_anagram?("gizmo", "mogzi")
p fourth_anagram?("gizmo", "sally")




def fourth_anagram_one_hash?(str1,str2)
  hash1 = Hash.new(0)
  #time complexity
  str1.chars.each {|ch| hash1[ch] += 1 }
  str2.chars.each {|ch| hash1[ch] -= 1}
  
  hash1.all?{|k,v| v == 0}
end

p fourth_anagram_one_hash?("gizmo", "mogzi")
p fourth_anagram_one_hash?("gizmo", "sally")
