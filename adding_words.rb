class Arith
  attr_reader :num1_str
  CONVERT = (%w(zero one two three four five six seven eight nine ten eleven twelve thirteen fourteen fifthteen sixteen seventeen eighteen nineteen twenty)).zip((0..20).to_a).to_h
  
  def initialize(num1_str)
  	p CONVERT
    @num1_str = CONVERT.fetch(num1_str)
  end
  
  def add(num2_str)
    sum = num1_str + CONVERT.fetch(num2_str)
    CONVERT.to_a.map(&:reverse).to_h.fetch(sum)
  end
end


#other solutions
class Arith
  WORD_TO_NUM = { zero: 0, one: 1, two: 2, three: 3, four: 4, five: 5, six: 6, seven: 7, eight: 8, nine: 9, ten: 10, eleven: 11, twelve: 12, thirteen: 13, fourteen: 14, fifteen: 15, sixteen: 16, seventeen: 17, eighteen: 18, nineteen: 19, twenty: 20 }

  def initialize(word)
    @num = WORD_TO_NUM[word.to_sym]
  end

  def add(word)
    sum = @num + WORD_TO_NUM[word.to_sym]
    WORD_TO_NUM.invert[sum].to_s
  end
end