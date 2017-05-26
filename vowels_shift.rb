def vowel_shift(text,n)
  
  if text=="" || text==nil
    return text
    
  end
  
  vowels=text.chars.map {|letter| letter if /[aeiouAEIOU]/.match(letter)!=nil}
  vowels.compact!
  vowels.rotate!(n)
  number_vowels=vowels.count
  
  if number_vowels==0 || n==0 || (number_vowels>0 && n%number_vowels==0)
    return text
    
  end
 
  text_to_shift=text.chars
  text_to_shift.each_with_index do |letter,index|
    if /[aeiouAEIOU]/.match(letter)!=nil
      text_to_shift[index]=vowels.shift
    end
  end
  return text_to_shift.join
end
  


vowel_shift("this is a test", 2)
vowel_shift("", 0)
vowel_shift(nil, 0)
vowel_shift("tyhgrbv",2)