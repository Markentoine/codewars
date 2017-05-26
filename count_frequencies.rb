def hash_method(words)
  Hash[words.group_by{ |e| e }.map{ |k,v| [k,v.length] }]
end # rapide pour les tableaux les plus grands.

def inject_method(words)
  words.inject(Hash.new(0)) { |a, e| a[e] += 1 ; a }
end # rapide pour les petits tableaux