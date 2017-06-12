def black_or_white_key(n)
  nb = 88.downto(1).to_a
  piano = (nb.to_a).zip([0,0,1,0,1,0,1,0,0,1,0,1] * (nb.size)).reverse
  piano.fetch((n - 1) % 88 ).fetch(1) == 0 ? 'white' : 'black'
end
# donner n la touche n du piano et retourner si la touche est noire ou blanche.