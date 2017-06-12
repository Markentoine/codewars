def peaceful_yard(yard, min_distance)
	@yard = yard
	nb_cats_in_yard = yard.join.count('LMR')
  if nb_cats_in_yard < 2
  	return true 
  elsif calculate_distances_between_cats.all? { |distance| distance < min_distance }
    return true
  end
  false
end

def find_coordinates_of_cats
	@cats_here= @yard.join.gsub('-', '').chars
	@yard.map!(&:chars)
	cats_coordinates = @cats_here.map { |cat| @yard.each_with_index.flat_map { |row, index|  [index, row.find_index(cat)] if row.find_index(cat) } }
	cats_coordinates.map(&:compact)
end

def calculate_distances_between_cats
	find_coordinates_of_cats.combination(2).map { |comb| Math.sqrt(((comb[0][0] - comb[1][0]).abs ** 2) + ((comb[0][1] - comb[1][1]).abs ** 2)) }
end

peaceful_yard(["-----------L", "--R---------", "------------", "------------", "------------", "--M---------"], 4)