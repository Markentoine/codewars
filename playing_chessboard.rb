=begin
Description:

With a friend we used to play the following game on a chessboard (8, rows, 8 columns).
On the first row at the bottom we put numbers:

1/2, 2/3, 3/4, 4/5, 5/6, 6/7, 7/8, 8/9

On row 2 (2nd row from the bottom) we have:

1/3, 2/4, 3/5, 4/6, 5/7, 6/8, 7/9, 8/10

On row 3:

1/4, 2/5, 3/6, 4/7, 5/8, 6/9, 7/10, 8/11

until last row:

1/9, 2/10, 3/11, 4/12, 5/13, 6/14, 7/15, 8/16

When all numbers are on the chessboard each in turn we toss a coin.
The one who get "head" wins and the other gives him, in dollars, the sum of the numbers on the chessboard.
We play for fun, the dollars come from a monopoly game!

How much can I (or my friend) win or loses for each game
if the chessboard has n rows and n columns?

Add all of the fractional values on an n by n sized board and give the answer as a simplified fraction.

Ruby, Python, JS, Coffee, Clojure, PHP, Elixir, Crystal, Typescript, Go:

The function called 'game' with parameter n (integer >= 0) returns
as result an irreducible fraction written as an array of integers: [numerator, denominator]
. If the denominator is 1 return [numerator].

I : n ( n * n size of the chess board)
O : an array with two values [numerator, denominator] irreductible fraction, result of the sum of all the numbers on the board.
DS : array of n nested arrays, one by row
Algo : 
  => double loop n times with an index variable (begin at 2 and increment)
  => with map method on an array (1..8).to_a (returns an array with the value obtained trough the block)
  => then an iteration to sum the fraction ( denominator = ppcm) by rows 
  => new array with the results
  => sum again
  => display result (if denominator == 1 then just numerator )
=end
 # solution with no math
def game(n)
  return [0] if n == 0
  increment = 2
  result =[]
  total =[]
  loop do
    total << (1..n).each_with_index.reduce(0) { |sum, (num, idx)| sum + Rational(num, (increment + idx)) }
    break if increment == n + 1
    increment += 1
  end
  total = total.reduce(:+)
  num = total.numerator
  deno =  total.denominator
  result = deno > 1 ? [num, deno] : [num]
end

#with math
def game(n)
  total = Rational( (n ** 2), 2)
  num, deno = total.numerator, total.denominator
  deno > 1 ? [num, deno] : [num]
end