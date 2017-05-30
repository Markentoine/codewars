KEY = { 'g'=>'a', 'd'=>'e', 'r'=>'y', 'p'=>'o', 'l'=>'u', 'k'=>'i' }


def encode(str)
  encoded = str.downcase.gsub(/[gaderypoluki]/) do |match| 
  if KEY.keys.include?(match)
  	KEY[match]
  elsif KEY.values.include?(match)
    KEY.invert[match]
  end
  end
  str.chars.each_with_index { |char, idx| encoded[idx] = encoded[idx].upcase if char.upcase == char }
  encoded
end

def decode(str)
 encode(str)
end

p encode('ABCD')
p encode('GBCE')
p decode('agedyropulik')

#other solutions

def encode(str)
  str.tr('gaderypolukiGADERYPOLUKI', 'agedyropulikAGEDYROPULIK')
end