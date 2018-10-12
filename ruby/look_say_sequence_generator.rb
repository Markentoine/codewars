def look_and_say_sequence(first_element, n)
	return first_element if n == 1
  result = first_element
  count = 1
  look_behind = ''
  loop do
    break if count == n
    intermediate_result = []
    intermediate_counter = 0
    result.chars.each_with_index do |char, idx|
      if idx == 0 and result.length == 1
    		intermediate_result << '1'
    		intermediate_result << char
      elsif idx == 0 
      	intermediate_counter += 1
      elsif char == look_behind && idx != result.size - 1
        intermediate_counter += 1
      elsif char == look_behind && idx == result.size - 1
        intermediate_counter += 1
        intermediate_result << intermediate_counter.to_s 
        intermediate_result << look_behind
      elsif char != look_behind && idx == result.length - 1
        intermediate_result << '1' 
        intermediate_result << look_behind
        intermediate_result << '1'
        intermediate_result << char
      elsif char != look_behind
        intermediate_result << intermediate_counter.to_s 
        intermediate_result << look_behind
        intermediate_counter = 1
      end
      look_behind = char
    end
    p intermediate_result
    result = intermediate_result.join 
    p result
    count += 1
  end
  result
end

def look_and_say_sequence(first_element, n)
  return first_element if n == 1
  
end

# other solutions

def look_and_say_sequence(s,n)
  
  n==1 ? s : look_and_say_sequence(s.scan(/(.)(\1*)/).map {|e| e.join.size.to_s + e[0]}.join, n-1)

end

def nextnum(numstr)
  res = ""
  count = 1
  numstr.chars.each_with_index do |n,i|
    if numstr[i] == numstr[i+1]
      count += 1
    elsif
      res << "#{count}#{numstr[i]}"
      count = 1
    end
  end
  res
end


def look_and_say_sequence(first_element, n)
  if n == 0
    return ""
  end
  
  result = first_element
  (n-1).times {result = nextnum(result)}
  result
end