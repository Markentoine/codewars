=begin
A series or sequence of numbers is usually the product of a function and can either be infinite or finite.

In this kata we will only consider finite series and you are required to return
a code according to the type of sequence:

Code	Type	Example
0
unordered
[3,5,8,1,14,3]
1
strictly increasing
[3,5,8,9,14,23]
2
not decreasing
[3,5,8,8,14,14]
3
strictly decreasing
[14,9,8,5,3,1]
4
not increasing
[14,14,8,8,5,3]
5
constant
[8,8,8,8,8,8]
You can expect all the inputs to be non-empty and completely numerical arrays/lists
- no need to validate the data; do not go for sloppy code, as rather large inputs might be tested.

Try to achieve a good solution that runs in linear time; also, do it functionally, 
meaning you need to build a pure function or, in even poorer words, do NOT modify the initial input!
=end

def sequence_classifier(arr)
  return 5 if arr.uniq.size == 1
  return 1 if (0..arr.size - 2).all? { |n| arr[n] < arr[n + 1] }
  return 2 if (0..arr.size - 2).all? { |n| arr[n] <= arr[n + 1] }
  return 3 if (0..arr.size - 2).all? { |n| arr[n] > arr[n + 1] }
  return 4 if (0..arr.size - 2).all? { |n| arr[n] >= arr[n + 1] }
  return 0
end

p sequence_classifier([8, 8, 8, 8, 8])
p sequence_classifier([3,5,8,1,14,3])
p sequence_classifier([3,5,8,9,14,23])
p sequence_classifier([3,5,8,8,14,14])
p sequence_classifier([14,9,8,5,3,1])
p sequence_classifier([14,14,8,8,5,3])

def sequence_classifier(arr)
  classification_map = { '<': 1, '>': 3, '==': 5, '<=': 2, '>=': 4 }
  classification_map.each_pair { |k, v| return v if arr.each_cons(2).all? { |i, j| i.send(k, j) } }
  0
end