def select_elements_in_diagonals(a, n)
    first = (0..((n * n) - 1)).step(n + 1).map do |e|
        a[e]
    end
    second = ((n - 1)..((n * n) - (n - 1))).step(n - 1).map do |e|
        a[e]
    end
    return first, second
end

def difference_of_diagonals(arr, n)
  first_diag, second_diag = select_elements_in_diagonals(arr, n)
  p first_diag
  p second_diag
  (first_diag.reduce(:+) - second_diag.reduce(:+)).abs
end

arr = [1, 3, -3, 5, 6, 8, 10, -12, 9, 3, -1, 5, 7, 130, 67, 2]

p difference_of_diagonals(arr, 4)