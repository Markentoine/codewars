=begin
Task

The sequence of Chando is an infinite sequence of all Chando's numbers in ascending order.

A number is called Chando's if it is an integer that can be represented as a sum of different positive integer powers of 5.

The first Chando's numbers is 5 (5^1). And the following nth Chando's numbers are:

 25  (5^2)
 30  (5^1 + 5^2)
 125 (5^3)
 130 (5^1 + 5^3)
 150 (5^2 + 5^3)
 ...
 ...
Your task is to find the Chando's nth number for a given n.

Input/Output

[input] integer n

1 <= n <= 7000
[output] an integer

nth Chando's number
=end

def nth_chandos_number(n)
  return 5 if n == 1
  counter = 1
  max = 1
  current = 0
  intermediate = 0
  powers = [1]
  chando = 25
  loop do
    if powers.size == max
      max += 1
      current = 0
      intermediate = 0
      powers = [max]
    elsif current <= max - 1
      current += 1
      powers = [current, max]
    else
      powers = [max] if intermediate == 0
      intermediate += 1
      powers.unshift(intermediate)
    end
    p powers
    chando = powers.map { |p| 5**p }.reduce(:+)
    counter += 1
    break if counter == n
  end
  chando
end

p nth_chandos_number(9)

