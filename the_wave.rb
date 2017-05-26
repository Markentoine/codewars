=begin
Task

 	In this simple Kata your task is to create a function that turns a string into a Mexican Wave. 
 	You will be passed a string and you must return that string in an array 
 	where an uppercase letter is a person standing up.
 	
Rules

 	1.  The input string will always be lower case but maybe empty.

2.  If the character in the string is whitespace then pass over it as if it was an empty seat.
Example

wave("hello") => ["Hello", "hEllo", "heLlo", "helLo", "hellO"]

algo : 
 - the result is an array of nth elements with one letter capitalized for a string of nth letters
 - result is an array : use MAP, iterate through letters, ignoring spaces, return 
=end

def wave(str)
  str.chars.map.with_index do |char, idx|
    if char == ' '
      nil
    else
      copy = str.chars.dup
      copy[idx].upcase!
      copy.join
    end
  end.compact
end

p wave('hello')
p wave('two words')