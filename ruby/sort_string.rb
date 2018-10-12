=begin
Task

Your task is to sort the characters in a string according to the following rules:

- Rule1: English alphabets are arranged from A to Z, case insensitive.
  ie. "Type" --> "epTy"
- Rule2: If the uppercase and lowercase of an English alphabet exist
  at the same time, they are arranged in the order of oringal input.
  ie. "BabA" --> "aABb"
- Rule3: non English alphabet remain in their original position.
  ie. "By?e" --> "Be?y"
Input/Output

[input] string s

A non empty string contains any characters(English alphabets or non English alphabets).

[output] a string

A sorted string according to the rules above.

Example

For s = "cba", the output should be "abc".

For s = "Cba", the output should be "abC".

For s = "cCBbAa", the output should be "AaBbcC".

For s = "c b a", the output should be "a b c".

For s = "-c--b--a-", the output should be "-a--b--c-".

For s = "Codewars", the output should be "aCdeorsw".
=end

def sort_strings(str)
	non_alpha_str = str.chars.map do |char|
		char.match(/[A-Za-z]/) ? '' : char
	end
	ordered_letters = []
	str.gsub(/[^A-Za-z]/, '').chars.each_with_index { |letter, idx| ordered_letters << [letter, idx] }
	ordered_letters = ordered_letters.sort_by { |e| e[0].downcase }.map { |pair| pair[0] }
  non_alpha_str.map { |e| e == '' ? ordered_letters.shift : e }.join
end


#other solutions

def sort_string(s)
  chars = s.scan(/[A-Za-z]/).sort_by{|char| char.downcase}
  s.chars.map { |char| char =~ /[A-Za-z]/? chars.shift : char }.join
end

def sort_string(str)
  alpha, non_alpha = str.chars.map.with_index.partition { |char, _| char =~ /[a-z]/i }
  sorted_alpha = alpha.sort_by { |char, _| char.downcase }.map(&:first)
  non_alpha.each { |char, idx| sorted_alpha.insert(idx, char) }
  sorted_alpha.join
end

