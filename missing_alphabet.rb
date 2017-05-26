# codewars 6 kyu
# 
# Description:
# 
# Task
# 
# Given string s, which contains only letters from a to z in lowercase.
# 
# A set of alphabet is given by abcdefghijklmnopqrstuvwxyz.
# 
# 2 sets of alphabets mean 2 or more alphabets.
# 
# Your task is to find the missing letter(s). 
# You may need to output them by the order a-z.

# It is possible that there is more than one missing letter from more than one set of alphabet.
# 
# If the string contains all of the letters in the alphabet, return an empty string ""
# 
# Example
# 
# For s='abcdefghijklmnopqrstuvwxy'
# 
# The result should be 'z'
# 
# For s='aabbccddeeffgghhiijjkkllmmnnooppqqrrssttuuvvwwxxyy'
# 
# The result should be 'zz'
# 
# For s='abbccddeeffgghhiijjkkllmmnnooppqqrrssttuuvvwwxxy'

# 
# The result should be 'ayzz'
# 
# For s='codewars'
# 
# The result should be 'bfghijklmnpqtuvxyz'
# 
# Input/Output
# 
# [input] string s
# 
# Given string(s) contains one or more set of alphabets in lowercase.
# [output] a string
# 
# Find the letters contained in each alphabet but not in the string(s). 
# Output them by the order a-z. 
# If missing alphabet is repeated, please repeat them like "bbccdd", not "bcdbcd"
=begin
  algo : 
    how many sets? count max letter
    for each letter from alphabet use MAP: count in string and return letter * missing times
    join array
    
=end

def missing_letters(s)
  num_sets = s.chars.group_by(&:itself).values.sort_by(&:size).last.size
  alphabet = ('a'..'z').to_a
  alphabet.map do |letter|
    if s.count(letter) == num_sets
      ""
    else
      letter * (num_sets - s.count(letter))
    end
  end.join
end

p missing_letters('aabbccddeeffgghhiijjkkllmmnnooppqqrrssttuuvvwwxxyy') == 'zz'
p missing_letters('codewars') == 'bfghijklmnpqtuvxyz'
p missing_letters('abbccddeeffgghhiijjkkllmmnnooppqqrrssttuuvvwwxxy') == 'ayzz'

# other solutions

def missing_alphabets(str)
  max = 0
  str.chars.uniq.each do |char|
    count = str.count(char)
    max = count if count > max
  end
  ('a'..'z').reduce('') { |result, char| result + (char * (max - str.count(char))) }
end