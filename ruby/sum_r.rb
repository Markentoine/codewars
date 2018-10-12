def sum_r(x)
  x.empty? ? 0 : x.first + sum_r(x.drop(1))
end

def sum_r(x)
	return 0 if x.empty?
	return x[0] if x.size == 1
	first = x[0]
	first + sum_r(x.drop(1))
end

# somme récursive des éléments d'un tableau