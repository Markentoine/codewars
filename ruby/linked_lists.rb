l = ->(a,b) { a<=>b }

def linked_sort(a_to_sort, a_linked, sorting = ->(a, b) { a.to_s<=>b.to_s })
  linked_arrays = linking_lists(a_to_sort, a_linked)
  a_to_sort = a_to_sort.sort!(&sorting)
  result = processing(a_to_sort, linked_arrays)
  a_linked.map!.with_index { |_, idx| result[idx] }
  a_to_sort
end

def linking_lists(a_to_sort, a_linked)
  a_to_sort.zip(a_linked).to_a
end

def processing(list_sorted, linked_arrays)
  list_sorted.map do |item|
      idx = linked_arrays.find_index { |pair| pair.include?(item) && item == pair[0] }
      result = linked_arrays.delete_at(idx)
      result[1]
    end
end

first = [ 1, 6, 5 , 0]
second = ['house', 'car','pen','jeans']
p linked_sort(first, second)
p first
p second

