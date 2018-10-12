def sect_sort(arr, *args)
  if args.size == 2
    start, length = *args
  else
    start = args[0]
    length = 0 
  end
  if length == 0 || start + length > arr.size
    return arr[0, start] + arr[start..-1].sort
  elsif start + length < arr.size
    return arr[0, start] + arr[start, length].sort + arr[(start + length)..-1]
  end
end

