=begin
Find the number with the most digits.

If two numbers in the argument array have the same number of digits, return the first one in the array.
=end

def find_longest(arr)
  arr.reduce(0) { |longest, n| n.to_s.length > longest.to_s.length ? n : longest }
end

# other solutions

def find_longest(arr)
  arr.max_by { |n| num.to_s.length }
end