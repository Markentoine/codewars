def show_sequence(n)
  return "#{n}<0" if n < 0
  result = (0..n).reduce(:+)
  puts "#{(0..n).map { |num| "#{num}+" }.join.chop} = #{result}"
end

class SequenceSum
  def self.show_sequence(n)
    case n <=> 0
    when -1 then "#{n}<0"
    when 0  then "#{n}=0"
    else         "#{(0..n).to_a.join('+')} = #{(0..n).reduce(:+)}"
    end 
  end
end

class SequenceSum
  def self.show_sequence(n)
    n < 0 ? "#{n}<0" : [*(0..n)].join('+') << "#{ n.zero? ? '=0' : " = #{(n + 1) * n / 2}" }"
  end
end