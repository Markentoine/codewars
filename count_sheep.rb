def lost_sheep(friday,saturday,total)
  total - (friday.reduce(0) { |sum, n| sum = sum + n } + saturday.reduce(0) { |sum, n| sum = sum + n })
end


#other solution
def lost_sheep(*days, total)
  total - days.flatten.reduce(0, :+) #je ne connaissais pas cette syntaxe
end