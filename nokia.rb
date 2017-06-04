def unlock(str)
  str.chars.map(&:downcase).map do |char|
   case 
   when char.ord < 100 then 2
   when char.ord < 103 then 3
   when char.ord < 106 then 4
   when char.ord < 109 then 5
   when char.ord < 112 then 6
   when char.ord < 116 then 7
   when char.ord < 119 then 8
   when char.ord < 123 then 9
  end
  end.join
end
p unlock('Nokia')
p unlock("Valut")

#others

def unlock(str)
  str = str.downcase
  str=str.gsub(/[abc]/,"2")
  str=str.gsub(/[def]/,"3")
  str=str.gsub(/[ghi]/,"4")
  str=str.gsub(/[jkl]/,"5")
  str=str.gsub(/[mno]/,"6")
  str=str.gsub(/[pqrs]/,"7")
  str=str.gsub(/[tuv]/,"8")
  str=str.gsub(/[wxyz]/,"9")
end

def unlock(str)
  str.downcase.tr("abcdefghijklmnopqrstuvwxyz","22233344455566677778889999")
end

