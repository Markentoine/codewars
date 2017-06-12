def key(n)
  nb_keys = 88.downto(1).to_a
  piano = (nb_keys.to_a).zip(["C", "B", "A#", "A", "G#", "G", "F#", "F", "E", "D#", "D", "C#"]  * (nb_keys.size)).reverse
  piano.fetch((n - 1) % 88 ).fetch(1)
end