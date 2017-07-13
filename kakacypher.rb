# def kacokadekame(word)
#   result = 'ka'
#   word.chars.each_with_index do |char, idx|
#   	if char.match(/[^aeiouyAEIOUY]/)
#   		result << char
#   	elsif idx == word.length - 1
#   	   result << char
# 	  elsif char.match(/[aeiouyAEIOUY]/) && idx <= word.length - 2 && word[idx + 1].match(/[aeiouyAEIOUY]/)
#   	   result << char
#   	elsif idx == 0 && word[idx + 1].match(/[aeiouyAEIOUY]/)
#   	   result << char
#   	else 
#   		result << char << 'ka'
#   	end
#   end
#  result
# end

# other solutions

def kacokadekame(word)
  'ka' + word.gsub(/([aeiouy])(?=[^aeiouy])/i, '\1ka')
end


  p kacokadekame("aa")# == "kaaa" 
  p kacokadekame("z")# == "kaz"   
  p kacokadekame("ka")# == ("kaka")   
  p kacokadekame("Abbaa")# == ("kaAkabbaa")
  p kacokadekame("maintenance")# == ("kamaikantekanakance")
  p kacokadekame("Woodie")# == ("kaWookadie")
  p kacokadekame('nzbtxseyuscrvmjbhcvvyoqzon') 