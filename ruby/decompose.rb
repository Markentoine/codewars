def decompose(n)
  current_num = Rational(n)
  return [] if current_num.zero? || n.match(/[^0-9\/\.]/)
  return [current_num.to_i.to_s] if current_num.to_i == Rational(n)

  result = []
  if current_num > 1
    result << "1"
    current_num = Rational(current_num - 1)
  end
  counter = 2
  step = 0
  loop do 
    diff = current_num - Rational("1/#{counter}")
    if diff >= 0 && counter < 500_000
      result << "1/#{counter.to_s}"
      current_num = diff
    elsif diff < 0 && counter >= 500_000 && counter < 100_000_000
      counter += 500_000
      step = 500_000
    elsif diff < 0 && counter >= 100_000_000 && counter < 1_000_000_000
      counter += 5_000_000
      step = 5_000_000
    elsif diff < 0 && counter >= 1_000_000_000
      counter += 100_000_000
      step = 100_000_000
    elsif diff >=0 && step >= 500_000
      bingo = ((counter - step)..counter).bsearch { |n| current_num - Rational("1/#{n}") >= 0 } 
      result << "1/#{bingo.to_s}"
      current_num -= Rational("1/#{bingo}")
      numerator, denominator = Rational(current_num).to_s.split('/').map(&:to_i)
      counter = (denominator / numerator).to_i unless numerator.zero?
    end
    break if current_num.zero?
    counter += 1
  end
  result
end


p decompose("3000/4187")
#p decompose("40/60")

