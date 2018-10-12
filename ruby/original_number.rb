=begin
Task

John has an important number, and he doesn't want others to see it.

He decided to encrypt the number, using the following steps:

His number is always a non strict increasing sequence
ie. "123"

He converted each digit into English words.
ie. "123"--> "ONETWOTHREE"

And then, rearrange the letters randomly.
ie. "ONETWOTHREE" --> "TTONWOHREEE"
John felt that his number were safe in doing so. In fact, such encryption can be easily decrypted :(

Given the encrypted string s, your task is to decrypt it, return the original number in string format.

Note, You can assume that the input string s is always valid; It contains only uppercase Letters; The decrypted numbers are arranged in ascending order; The leading zeros are allowed.

Example

For s = "ONE", the output should be 1.

For s = "EON", the output should be 1 too.

For s = "ONETWO", the output should be 12.

For s = "OONETW", the output should be 12 too.

For s = "ONETWOTHREE", the output should be 123.

For s = "TTONWOHREEE", the output should be 123 too.
=end


def original_number(s)
  #first tour
  nb_four = s.count('U')
  nb_six = s.count('X')
  nb_eight = s.count('G')
  nb_two = s.count('W')
  nb_zero = s.count('Z')
  #reduction
  nb_four.times { s.sub!('F', '').sub!('O', '').sub!('U', '').sub!('R', '') }
  nb_six.times { s.sub!('S', '').sub!('I', '').sub!('X', '') }
  nb_eight.times { s.sub!('E', '').sub!('I', '').sub!('G', '').sub!('H').sub!('T', '') }
  nb_two.times { s.sub!('T', '').sub!('W', '').sub!('O', '') }
  nb_zero.times { s.sub!('Z', '').sub!('E', '').sub!('R', '').sub!('O', '') }
  #second tour
  nb_five = s.count('F')
  nb_five.times { s.sub!('F', '').sub!('I', '').sub!('V', '').sub!('E', '') }
  nb_three = s.count('T')
  nb_seven = s.count('S')
  nb_nine = s.count('I')
  nb_one = s.count('O')
  
  p s, nb_zero, nb_one, nb_two, nb_three, nb_four, nb_five, nb_six, nb_seven, nb_eight, nb_nine

  
  #puts "#{nb_zero * '0'}" + "#{nb_one * '1'}" + "#{nb_two * '2'}" + "#{nb_three * '3'}"
end

original_number("ONE")
original_number("OEN")
original_number("ONETWO")
original_number("OONETW")
original_number("TTONWOHREEE")
original_number("FOURFIVESIX")