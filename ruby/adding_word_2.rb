UNITS = %w(zero one two three four five six seven eight nine).zip(0..9).to_h
TEENS = %w(ten eleven twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen).zip(10..19).to_h
TENS = %w(ten twenty thirty forty fifty sixty seventy eighty ninety).zip([10, 20, 30, 40, 50, 60, 70, 80, 90]).to_h
BEYOND = {'hundred'=> 100}
CONVERT = UNITS.merge(TEENS).merge(TENS).merge(BEYOND)

class Arith
attr_reader :nb_to_add

  def initialize(nb_to_add)
    @nb_to_add = nb_to_add
  end
  
  def add(nb)
   result = convert_word_to_number(nb) + convert_word_to_number(nb_to_add)
   return 'one thousand' if result == 1000
   convert_nb_to_word(result)
  end
  
  def convert_word_to_number(words)
  	numbers = words.split(' ').map { |word| CONVERT.keys.include?(word) ? CONVERT.fetch(word) : nil }.compact
  	if numbers.include?(100)
  	  numbers.first(2).reduce(:*) + ( numbers[2..-1].reduce(:+).nil? ? 0 : numbers[2..-1].reduce(:+) )
    else
    	numbers.reduce(:+)
  	end
  end
  
  def convert_in_digits(nb)
  	digits = nb.to_s.chars.map(&:to_i).reverse
  end
  
  def calculate_power_of_ten(nb)
  	convert_in_digits(nb).each_with_index.map { |d, idx| d * (10 ** idx)}.reverse
  end
  
  def convert_nb_to_word(nb)
  	power_ten = calculate_power_of_ten(nb)
  	if nb < 100
  		if nb < 20 && nb > 10 
  			TEENS.invert.fetch(nb)
  		elsif nb < 10 
  		  UNITS.invert.fetch(nb)
  		else 
  		  power_ten.pop if power_ten.last == 0
  		  power_ten.map { |p| CONVERT.invert.fetch(p) }.join(' ')
  		end 
  	else 
  		digits = convert_in_digits(nb)
  		if digits[1] == 1 
  		  teen = power_ten.last(2).reduce(:+)
  		  final = TEENS.invert.fetch(teen)
  		elsif digits[1] == 0 
  		  final = digits[0] == 0 ? '' : UNITS.invert.fetch(digits[0])
  		else 
  			power_ten.shift
  			power_ten.pop if power_ten.last == 0
  		  final = power_ten.map { |p| CONVERT.invert.fetch(p) }.join(' ')
  		end
  		hundreds = "#{UNITS.invert.fetch(digits[2])} " + "hundred"
  		nb % 100 == 0 ? hundreds : hundreds + " and " + final
  	end 
  end
end

p Arith.new('seven').add('one hundred and three')