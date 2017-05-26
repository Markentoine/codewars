require 'benchmark'

def luxhouse_short(houses)
  houses.map.with_index{ |h, i| (t = houses[i + 1..-1].max) && t >= h ? t + 1 - h : 0 }
end

def luxhouse_long(houses)
  houses.map.with_index do |house, idx|
  	if idx == houses.size - 1
  		0
    elsif house < houses.drop(idx + 1).max
      (houses.drop(idx + 1).max - house + 1)
    elsif house >= houses.drop(idx + 1).max
    	house
    end
  end
end

Benchmark.bmbm do |bm|
	bm.report 'long'do
		10000.times do
		luxhouse_long([1, 2, 3, 1, 2])
	end
	end
	
	bm.report 'short' do
		10000.times do
		luxhouse_short([1, 2, 3, 1, 2])
	end
	end
end


