def vowel_shift(text, n)
  return nil if text.nil? 
  vowels = text.scan(/[aeiou]/i).rotate(-n)
  text.gsub(/[aeiou]/i) { vowels.shift }
end