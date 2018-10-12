def find_deleted_number(arr1, arr2)
   if (arr1 - arr2).empty?
   	0
   else
   	(arr1 - arr2)[0]
   end
end 

def find_deleted_number(arr, mixed_arr)
  (arr - mixed_arr).pop || 0
end

def find_deleted_number(arr, mixed_arr)
  (arr - mixed_arr).first || 0
end

p find_deleted_number([1,2,3,4,5], [3,4,1,5])
p find_deleted_number([1,2,3,4,5,6,7,8,9], [1,9,7,4,6,2,3,8])
p find_deleted_number([1,2,3,4,5,6,7,8,9], [5,7,6,9,4,8,1,2,3])