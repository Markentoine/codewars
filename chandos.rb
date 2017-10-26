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
  result = []
  i = 1
  loop do
    temp_result = [[1]]
    construct_suite(2, i, temp_result)
    if temp_result.size > n
      result = temp_result
      break
    end
    i += 1
  end
  result.take(n).last.reduce(0) { |sum, power| sum += (5 ** power); sum }
end

def construct_suite(x, n, result)
  return if x == n + 1
  temp = result.zip(([x] * result.size)).map(&:flatten)
  temp.unshift([x])
  temp.each { |v| result << v }
  construct_suite((x + 1), n, result)
  result
end

p construct_suite(2, 4, [[1]])
p nth_chandos_number(6)

#other solution
def nth_chandos_number(n)
(n.to_s(2)+"0").to_i(5)
end
