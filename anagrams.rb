require "byebug"

def first_anagram?(str1, str2)
  anagrams = str1.chars.permutation
  
  return true if anagrams.include?(str2.chars)
  false
end

# p first_anagram?("gizmo", "sally")

def second_anagram?(str1, str2)
  str1_arr = str1.chars
  str2_arr = str2.chars
  
  str1_arr.each_with_index do |char, idx|
    idx2 = str2_arr.index(char)
    str2_arr.delete_at(idx2) unless idx2.nil?
  end
  puts str2_arr.length
  return true if str2_arr.empty?
  false
end

# p second_anagram?("gizmo", "sally")
p second_anagram?("gizmo", "mogzi")
p second_anagram?("gizmo", "sally")