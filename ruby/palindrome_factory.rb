# a string of lowercased letters
# return the letter if one letter
# a string is a possible palindrome if there is an even count of letters
# and if it is the case, the string must have the same number of each letters
# 'aabb' => 4 letters / 2 a / 2 b

def possible_palindrome?(word)
  nb_each_letters(word).one?(&:odd?) ||
  nb_each_letters(word).all?(&:even?)
end


def nb_each_letters(word)
  letters = word.chars.uniq
  letters.map { |letter| word.count(letter) }
end

def sort_letters_by_count(word)
  word.chars.each_with_object({}) do |letter, store|
      unless store.keys.include?(letter)
        store[letter] = word.count(letter)
      end
    end.to_a
end

def retrieve_odd_element(result)
  idx_odd_element = result.find_index { |tuple| tuple[1].odd? }
  result.delete_at(idx_odd_element)
end

def prepare_palindrome_odd(sorted_result, odd_element)
  sorted_result.sort_by! { |tuple| tuple[0] }
  intermediate_string = sorted_result.map { |tuple| tuple[0] * (tuple[1] / 2) }.flatten.join
  odd_element[0] + intermediate_string +
  (odd_element[0] * (odd_element[1] - 2)) +
  intermediate_string.reverse + odd_element[0]
end

def prepare_palindrome(sorted_result)
  mid_palindrome = sorted_result.map { |tuple| tuple[0] * (tuple[1] / 2) }.flatten.join
  mid_palindrome + mid_palindrome.reverse
end

def rearrange_word(word)
  sorted_result = sort_letters_by_count(word)
  if sorted_result.any? { |tuple| tuple[1].odd? }
    odd_element = retrieve_odd_element(sorted_result)
    prepare_palindrome_odd(sorted_result, odd_element)
  else
    prepare_palindrome(sorted_result)
  end
end

def palindrome_factory(word)
  return false unless possible_palindrome?
  return word if word.length == 1
  rearrange_word(word)
end


p rearrange_word('accacacbb')
p rearrange_word('ababghhggg')
