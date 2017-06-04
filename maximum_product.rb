=begin
Task

Given an integer array arr. Your task is to remove one element, maximize the product of elements.

The result is the element which should be removed. If more than one valid results exist, return the smallest one.

Input/Output

[input] integer array arr

non-empty unsorted integer array. It contains positive integer, negative integer or zero.

3 ≤ arr.length ≤ 15

-10 ≤ arr[i] ≤ 10

[output] an integer

The element that should be removed.

Example

For arr = [1, 2, 3], the output should be 1.

For arr = [-1, 2, -3], the output should be 2.

For arr = [-1, -2, -3], the output should be -1.

For arr = [-1, -2, -3, -4], the output should be -4.
=end

def maximum_product(arr)
  max_product = arr.drop(1).reduce(:*)
  element_to_remove = arr[0]
  arr.each_with_index do |n, idx|  
    if idx > 0 && idx < arr.size - 1 && (arr[0..idx - 1].reduce(:*) * arr[idx + 1..-1].reduce(:*)) >= max_product
      if arr[0..idx - 1].reduce(:*) * arr[idx + 1..-1].reduce(:*) > max_product
      max_product = (arr[0..idx - 1].reduce(:*) * arr[idx + 1..-1].reduce(:*))
      element_to_remove = n
      elsif arr[0..idx - 1].reduce(:*) * arr[idx + 1..-1].reduce(:*) == max_product
        element_to_remove =  n < element_to_remove ? n : element_to_remove
      end
    elsif idx == arr.size - 1 && arr[0..-2].reduce(:*) >= max_product
      if arr[0..-2].reduce(:*) > max_product
        max_product = arr[0..-2].reduce(:*)
        element_to_remove = n
      elsif arr[0..-2].reduce(:*) == max_product
        element_to_remove =  n < element_to_remove ? n : element_to_remove
      end
    end
  end
  element_to_remove
end

p maximum_product([-1, -2, -3, -4])
p maximum_product([-1, -2, -3])
p maximum_product([-1, 2, -3])
p maximum_product([0, -1, -2, -3])