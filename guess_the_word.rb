=begin
Consider a game, wherein the player has to guess a target word. All the player knows is the length of the target word.

To help them in their goal, the game will accept guesses, and return the number of letters that are in the correct position.

Write a method that, given the correct word and the player's guess, returns this number.

For example, here's a possible thought process for someone trying to guess the word "dog":

count_correct_characters("dog", "car"); #0 (No letters are in the correct position)
count_correct_characters("dog", "god"); #1 ("o")
count_correct_characters("dog", "cog"); #2 ("o" and "g")
count_correct_characters("dog", "cod"); #1 ("o")
count_correct_characters("dog", "bog"); #2 ("o" and "g")
count_correct_characters("dog", "dog"); #3 (Correct!)
The caller should ensure that the guessed word is always the same length as the correct word, but since it could cause problems if this were not the case, you need to check for this eventuality:

#Raise an error if the two parameters are of different lengths.
You may assume, however, that the two parameters will always be in the same case.

=end

def count_correct_characters(correct, guess)
  return 'Error : number of characters' if guess.length != correct.length
  correct.chars.each_with_index.reduce(0) { |count, (char, index)| char == guess[index] ? count + 1 : count } 
end

# other solution

def count_correct_characters(correct, guess)
  correct.size == guess.size ? correct.chars.zip(guess.chars).count { |a, b| a == b } : raise
end