=begin
def unflatten(flat_array)
    flat_array.each_with_index
              .reduce([]) do |unflat, (number, index)|
                p unflat.flatten.length
                if index == 0 || unflat.flatten.length + 1
                  if (number < 3)
                    unflat.push(number)
                  elsif (number > 2)
                    unflat.push(flat_array[index, number])
                  end
                  unflat
                end
              unflat
              end
end
=end



def unflatten(arr)
  unflat = []

  def unflatting(arr, unflat_array)
    return if (!arr || arr.empty?)
    arr.each_with_index do |n, idx|
      if (n < 3)
         unflat_array << n
      elsif (n > 2) 
        unflat_array << arr[idx, n]
        unflatting(arr[idx + n..-1], unflat_array)
        break
      end
    end
  end

  unflatting(arr, unflat)
  unflat
end

p unflatten([1,4,5,2,1,2,4,5,2,6,2,3,3])