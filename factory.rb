=begin
# You are working in a word factory and your boss wants to know how much profit the
# factory is making. Words cost you 1 dollar per lowercase consonant and 2 dollars
# per lowercase vowel. The cost of uppercase letters is double the cost of lowercase
# letters. The factory sells words for 150% of the production price, except if the word
# has a "Q" or "Z" in it, in which case the factory sells the word for 175% of the
# production price. Write a method to determine the profit your factory makes on
# any given word.

# Example:
# p word_profit("Launch")
# ['a', 'u'], ['L', 'n', 'c', 'h']
#   # => 4.5
# p word_profit("SCHOOL")
#   # => 8.0
# p word_profit("ZCHOOL")
#   # => 12.0
=end

#requirements :

#return the profit
#before set the production price
#how to set the production price ?
# -> separate lowercase / uppercase letters
# -> separate consonant/ vowel letters
# -> check if the word has a "Q" or "Z"

# separate vowels from consonant letters
# count consonant /count vowel
# count lowercase / uppercase
# check if Q / Z then apply the % (150 or 175)

# input is one word
# output a rational number

def separate_letters(word)
   word.chars.partition do |char|
     char.match(/[aeiou]/i)
   end
end

def count_upper_lower(letters)
  nb_uppercased_letters = letters.join.count("A-Z")
  nb_downcased_letters = letters.size - nb_uppercased_letters
  [nb_uppercased_letters, nb_downcased_letters]
end

def check_for_q_or_z(word)
  word.match(/[qz]/i)
end

def compute_production_price(word)
  vowels, consonants = separate_letters(word) # ['a', 'u'], ['L', 'n', 'c', 'h']
  all_count = [vowels, consonants].map do |letters| # [[0, 2], [1, 3]]
    upp_lett, down_lett = count_upper_lower(letters)
    [upp_lett, down_lett]
  end
  all_count.map.with_index do |count, idx|
    if idx == 0
      count[0] * 4 + count[1] * 2
    else
      count[0] * 2 + count[1]
    end
  end.reduce(:+)
end

def word_profit(word)
  prod_price = compute_production_price(word)
  sell_price = if check_for_q_or_z(word)
              prod_price * 1.75
           else
             prod_price * 1.5
           end
  sell_price - prod_price
end

p separate_letters('Launch')
p count_upper_lower(['L', 'n', 'c', 'h'])

p compute_production_price('Launch')
p word_profit('Launch')



