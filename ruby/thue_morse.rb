=begin
Task

Given a sequence of 0s and 1s, determine if it is a prefix of Thue-Morse sequence.

The infinite Thue-Morse sequence is obtained by first taking a sequence containing a single 0 and then repeatedly concatenating the current sequence with its binary complement.

A binary complement of a sequence X is a sequence Y of the same length such that the sum of elements X_i and Y_i on the same positions is equal to 1 for each i.

Thus the first few iterations to obtain Thue-Morse sequence are:

0
0 1
0 1 1 0
0 1 1 0 1 0 0 1
...
Examples

For seq=[0, 1, 1, 0, 1], the result should be true.

For seq=[0, 1, 0, 0], the result should be false.
=end

def is_thue_morse(seq)
  n = seq.size
  start = [0]
  interm = [0]
  while start.size < n do
    start.each { |n| n == 0 ? interm << 1 : interm << 0 }
    start = interm.clone
  end
  seq.join == start.take(n).join
end

#other solution

def is_thue_morse(seq)
  s = seq.join("")
  n = "0"
  while(n.size<s.size)
    n += n.gsub /./ do |x| (1-x.to_i).to_s end
  end
  return n.index(s) == 0
end

def is_thue_morse(seq)
  thue_morse = [0]
  while thue_morse.size < seq.size do
    thue_morse += thue_morse.map { |x| (x - 1).abs }
  end
  seq == thue_morse[0...seq.size]
end