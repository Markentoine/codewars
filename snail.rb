def snail(array)
  return [] if array == [[]]
  make_selection(array)
end

def transpose_array(array)
  array.transpose.reverse
end

def interwoven(array, switch)
  zip1 = array.zip(switch.call(array, :backward))
  zip1 = simplify(zip1)
  zip2 = transpose_array(array).zip(switch.call(transpose_array(array), :backward))
  zip2 = simplify(zip2)
  simplify(zip1.zip(zip2)).first((array.size * 2 ) - 1)
end

def simplify(arr)
  arr.reduce([]) { |result, arr| result << arr[0]; result << arr[1]; result }
end

def make_selection(array)
  switch = ->(array, direction) do
    if direction == :forward
      array
    elsif direction == :backward
      array.reverse.map(&:reverse)
    end
  end
  cut = ->(array, extremity) { extremity == :head ? array.map { |arr| arr[1..-1] } : array.map { |arr| arr[0..-2] } }
  change_extremity = ->(extremity) { extremity == :head ? :queue : :head }
  inter = interwoven(array, switch)
  n = inter.size
  extremity = :head
  result = []
  loop do
    if n == inter.size
      result << inter.shift
    else
      inter = cut.call(inter, extremity)
      2.times do
        result << inter.shift
      end
      extremity = change_extremity.call(extremity)
    end
    break if inter == []
  end
  result.flatten
end

array = [[1,  2,  3,  4,  5],
         [6,  7,  8,  9,  10],
         [11, 12, 13, 14, 15],
         [16, 17, 18, 19, 20],
         [21, 22, 23, 24, 25]]

p snail(array)
