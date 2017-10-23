=begin
In this kata, you will write a function that returns the positions and the values of the "peaks" (or local maxima) of a numeric array.

For example, the array arr = [0, 1, 2, 5, 1, 0] has a peak at position 3 with a value of 5 (since arr[3] equals 5).

The output will be returned as an object with two properties: pos and peaks.

Both of these properties should be arrays. If there is no peak in the given array, then the output should be {pos: [], peaks: []}.

Example: pickPeaks([3, 2, 3, 6, 4, 1, 2, 3, 2, 1, 2, 3]) should return {pos: [3, 7], peaks: [6, 3]} (or equivalent in other languages)

All input arrays will be valid integer arrays (although it could still be empty), so you won't need to validate the input.

The first and last elements of the array will not be considered as peaks (in the context of a mathematical function, we don't know what is after and before and therefore, we don't know if it is a peak or not).

Also, beware of plateaus !!! [1, 2, 2, 2, 1] has a peak while [1, 2, 2, 2, 3] does not. In case of a plateau-peak, please only return the position and value of the beginning of the plateau. For example: pickPeaks([1, 2, 2, 2, 1]) returns {pos: [1], peaks: [2]} (or equivalent in other languages)
=end
def pick_peaks(arr)
  return {"pos"=>[], "peaks"=>[]} if arr.empty?
  relief = build_relief(arr)
  relief = guess_peaks(relief)
  relief = hunt_down_low_plateau(relief)
  p results = peaks_indexes(flatten_relief(relief))
  peaks_values = arr.values_at(*results)
  format_solution(results, peaks_values)
end

def build_relief(arr)
  max = arr.max
  min = arr.min
  max.downto(min).reduce([]) do |relief, current_max|
    relief.push(arr.map { |value| value <= current_max ? '.' : '0' })
    relief
  end.reverse
end

def guess_peaks(relief)
  relief.map.with_index do |line, line_index|
    line.map.with_index do |value, value_index|
      if line_index == relief.size - 1
        value == '0' ? '1' : '.'
      elsif value == '.'
        '.'
      else
        if low_plateau?(relief, value, line_index, value_index)
          'L'
        elsif peak_plateau?(relief, value, line_index, value_index)
          'P'
        elsif plateau?(relief, value, line_index, value_index)
          '-'
        elsif absolute_peak?(relief, value, line_index, value_index)
          '1'
        else
          '.'
        end
      end
    end
  end
end

def plateau?(relief, value, line_index, value_index)
  value_upper_environment(relief, line_index, value_index) == ['.', '.', '.', '0', '0']
end

def peak_plateau?(relief, value, line_index, value_index)
  value_upper_environment(relief, line_index, value_index) == ['.', '.', '.', '.', '0'] ||
  value_upper_environment(relief, line_index, value_index) == ['.', '.', '.', '0', '.']
end
def absolute_peak?(relief, value, line_index, value_index)
  value_upper_environment(relief, line_index, value_index) == ['.', '.', '.', '.', '.']
end

def low_plateau?(relief, value, line_index, value_index)
  value_upper_environment(relief, line_index, value_index).values_at(0, 1, 2, 4) == ['.', '.', '0', '0'] || value_upper_environment(relief, line_index, value_index).values_at(0, 1, 2, 3) == ['.', '0', '.', '0']
end

def hunt_down_low_plateau(relief)
  relief = relief.map do |line|
    if line.join.match(/P(?=(-*L))/)
      line.join.gsub(/P(?=(-*L))/, 'L').chars
    elsif line.join.match(/P(?=(-*P))/)
      line.join.gsub(/P(?=(-*P))/, '1').chars
    else
      line
    end
  end
end

def value_upper_environment(relief, line_index, value_index)
  if value_index == 0
    [ '.', relief[line_index + 1][value_index], relief[line_index + 1][value_index + 1] ]
  elsif value_index == (relief[0].size) - 1
    [ relief[line_index + 1][value_index - 1], relief[line_index + 1][value_index], '.' ]
  else
  [ relief[line_index + 1][value_index], relief[line_index + 1][value_index + 1], relief[line_index + 1][value_index - 1] , relief[line_index][value_index - 1], relief[line_index][value_index + 1] ]
  end
end

def flatten_relief(relief)
  relief.transpose.map { |column| column.include?('1') ? '1' : '.' }
end

def peaks_indexes(line)
  line.each_with_index.reduce([]) do |solution, (value, index)|
    if index == 0
      solution
    elsif value == '1'
     solution << index
    else
     solution
    end
  end
end

def format_solution(peaks_index, peaks_values)
  { "pos"=> peaks_index, "peaks"=> peaks_values }
end

p pick_peaks([3,2,3,6,4,1,2,3,2,1,2,2,2,1])
p pick_peaks([2,1,3,1,2,2,2,2,1])
p pick_peaks([2,1,3,1,2,2,2,2])
p pick_peaks([2, 1, 3, 2, 2, 2, 2, 5, 6])
relief = build_relief([2, 1, 3, 2, 2, 2, 2, 5, 6])
relief.each { |line| p line.join(' ') }
puts
relief = guess_peaks(relief).each { |line| p line.join(' ') }
puts
relief = hunt_down_low_plateau(relief).each { |line| p line.join(' ')}
#i= peaks_indexes(flatten_relief(relief))
#p discard_plateaus(i)

p pick_peaks([1, 2, 5, 4, 3, 2, 3, 6, 4, 1, 2, 3, 3, 4, 5, 3, 2, 1, 2, 3, 5, 5, 4, 3])
relief = build_relief([1, 2, 5, 4, 3, 2, 3, 6, 4, 1, 2, 3, 3, 3, 4, 5, 3, 2, 1, 2, 3, 5, 5, 4, 3])
relief.each { |line| p line.join(' ') }
puts
relief = guess_peaks(relief).each { |line| p line.join(' ') }
puts
relief = hunt_down_low_plateau(relief).each { |line| p line.join(' ')}
p pick_peaks( [14, 19, 12, 20, 3, -1, 11, 18, 3, 6, 14, -5, -2, 16, 12, 6, 4, 15, 17, 2])
relief = build_relief([14, 19, 12, 20, 3, -1, 11, 18, 3, 6, 14, -5, -2, 16, 12, 6, 4, 15, 17, 2])
relief.each { |line| p line.join(' ') }
puts
relief = guess_peaks(relief).each { |line| p line.join(' ') }
puts
relief = hunt_down_low_plateau(relief).each { |line| p line.join(' ')}
p results = peaks_indexes(flatten_relief(relief))
p pick_peaks([13, 0, 5, 4, 11, 2, 2, 9, 13, -5, -1, 0, -3, 3, 13, 15, -2, -4, 9, 0, 13, 10, -5])
relief = build_relief([13, 0, 5, 4, 11, 2, 2, 9, 13, -5, -1, 0, -3, 3, 13, 15, -2, -4, 9, 0, 13, 10, -5])
relief.each { |line| p line.join(' ') }
puts
relief = guess_peaks(relief).each { |line| p line.join(' ') }
puts
relief = hunt_down_low_plateau(relief).each { |line| p line.join(' ')}
p results = peaks_indexes(flatten_relief(relief))
