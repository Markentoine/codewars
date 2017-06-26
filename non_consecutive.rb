def first_non_consecutive(arr)
  comp = [arr.first]
  (arr.size - 1).times do |n|
    comp << comp[n] + 1
    return  arr.take(n + 2).last if comp != arr.first(n + 2)
  end
  nil
end

p first_non_consecutive([1, 2, 3, 4, 5, 7, 8, 9])

p first_non_consecutive([1,2,3,4,6,7,8])
p first_non_consecutive([1,2,3,4,5,6,7,8]) == nil
p first_non_consecutive([4,6,7,8,9,11]) == 6
p first_non_consecutive([4,5,6,7,8,9,11]) == 11
p first_non_consecutive([31,32]) == nil
p first_non_consecutive([-3,-2,0,1]) == 0
p first_non_consecutive([-5,-4,-3,-1]) == -1

# other solution
def first_non_consecutive(arr)
  arr.each_cons(2) { |a, b| return b if b - a > 1 } 
end