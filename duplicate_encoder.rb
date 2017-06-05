=begin
Duplicate Encoder

3582288% of 1,6611,472 of 12,322obnounce
Ruby
TRAINNEXT KATA
Details
Solutions
Forks (6)
Discourse (116)
Add to Collection|Share this kata:
The goal of this exercise is to convert a string to a new string 
where each character in the new string is '(' if that character appears only once in the original string, 
or ')' if that character appears more than once in the original string. Ignore capitalization when determining if a character is a duplicate.

Examples:

"din" => "((("

"recede" => "()()()"

"Success" => ")())())"

"(( @" => "))(("
=end

def duplicate_encode(word)
  word.downcase.chars.map { |char| word.downcase.count(char) > 1 ? ')' : '(' }.join
end

p duplicate_encode("din") == "((("
p duplicate_encode("recede") == "()()()"
p duplicate_encode("Success") == ")())())"
p duplicate_encode("(( @") == "))(("
