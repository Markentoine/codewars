=begin
How many bees are in the beehive?

bees can be facing UP, DOWN, LEFT, or RIGHT
bees can share parts of other bees
Examples

Ex1

bee.bee     
.e..e..
.b..eeb
Answer: 5

Ex2
bee.bee     
e.e.e.e
eeb.eeb
Answer: 8
=end

def how_many_bees(hive)
  return 0 if  hive.nil? 
  return 0 if  hive.empty?
  return 0 if hive[0].size < 3
  return 0 if hive == [[" ", " ", " ", " ", " ", " "], [" ", " ", " ", " ", " ", " "], [" ", " ", " ", " ", " ", " "]]
  lines = hive + hive.transpose
  lines = lines.map(&:join).map { |str| str.gsub('.', ' ') }.map { |str| str.split(' ') }.flatten
  result = (lines.map { |str| str.scan(/(bee)/).size } + lines.map { |str| str.scan(/(eeb)/).size }).reduce(:+)
  result >= 0 ? result : 0 
end

    hive = ["...beebee".split(''),
            "b.ee.bee.".split(''),
            ".ebbee.e.".split('')]
p how_many_bees(hive)