def find_e(s)
  return nil if s.nil?
  return '' if s == ''
  result = s.downcase.count('e')
  result == 0 ? "There is no \"e\"." : "#{result}"
end

p find_e("actual") == "There is no \"e\"."
p find_e("") ==  ""
p find_e("English") == "1"
p find_e("English exercise") == "4"
p find_e(nil) == nil