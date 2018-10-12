=begin
7 kyu

Task

Given a rectangular matrix and integers a and b,
consider the union of the ath row and the bth (both 0-based) column of the matrix.
Return sum of all elements of that union.
Example

For

matrix = [[1, 1, 1, 1], 
        [2, 2, 2, 2], 
        [3, 3, 3, 3]]
a = 1 and b = 3
the output should be 12.

Here (2 + 2 + 2 + 2) + (1 + 3) = 12.
Input/Output

[input] 2D integer array matrix

2-dimensional array of integers representing a rectangular matrix.

Constraints:
1 ≤ matrix.length ≤ 5, 1 ≤ matrix[0].length ≤ 5, 1 ≤ matrix[i][j] ≤ 100.
[input] integer a

A non-negative integer less than the number of matrix rows.

Constraints: 0 ≤ a < matrix.length.
[input] integer b

A non-negative integer less than the number of matrix columns.

Constraints: 0 ≤ b < matrix[i].length.
[output] an integer
=end

def crossing_sum(matrix, row, column)
  matrix[row].reduce(:+) + (0..matrix.size - 1).map { |n| matrix[n][column] }.reduce(:+) - matrix[row][column]
end

def crossing_sum(matrix, row, column)
  (matrix[row] + matrix.transpose[column]).reduce(:+) - matrix[row][column]
end

p crossing_sum([[1,1,1,1],[2,2,2,2],[3,3,3,3]],1,3) #== 12
p crossing_sum([[1,1],[3,3],[1,1],[2,2]],3,0)       #== 9
p crossing_sum([[100]],0,0)                         #== 100
p crossing_sum([[1,2,3,4,5]],0,0)                   #== 15
p crossing_sum([[1],[2],[3],[4],[5]],0,0)           #== 15

