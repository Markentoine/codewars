=begin
Task

Your task is to create a Funnel data structure. It consists of three basic methods: fill(), drip() and toString()(to_s in Ruby). Its maximum capacity is 15 data.

Data should be arranged in an inverted triangle, like this:

 \1 2 3 4 5/
   \7 8 9 0/
    \4 5 6/
     \2 3/
      \1/
The method toString(to_s in Ruby) should return a multi-line string to display current funnel data arrangement:

 var funnel = new Funnel()
 console.log(funnel.toString())
  \         /
   \       /
    \     /
     \   /
      \ /
 funnel = Funnel.new
 print funnel.to_s
  \         /
   \       /
    \     /
     \   /
      \ /
The method fill() should accept one or more arguments to fill in the funnel:

 funnel = Funnel.new
 funnel.fill(1)
 print funnel.to_s
  \         /
   \       /
    \     /
     \   /
      \1/
 funnel.fill(2)
 print funnel.to_s
  \         /
   \       /
    \     /
     \2  /
      \1/
 funnel.fill(3)
 print funnel.to_s
  \         /
   \       /
    \     /
     \2 3/
      \1/
 funnel.fill(4,5)
 print funnel.to_s
  \         /
   \       /
    \4 5  /
     \2 3/
      \1/
 funnel.fill(6,7,8,9)
 print funnel.to_s
  \         /
   \7 8 9  /
    \4 5 6/
     \2 3/
      \1/
 var funnel = new Funnel()
 funnel.fill(1)
 console.log(funnel.toString())
  \         /
   \       /
    \     /
     \   /
      \1/
 funnel.fill(2)
 console.log(funnel.toString())
  \         /
   \       /
    \     /
     \2  /
      \1/
 funnel.fill(3)
 console.log(funnel.toString())
  \         /
   \       /
    \     /
     \2 3/
      \1/
 funnel.fill(4,5)
 console.log(funnel.toString())
  \         /
   \       /
    \4 5  /
     \2 3/
      \1/
 funnel.fill(6,7,8,9)
 console.log(funnel.toString())
  \         /
   \7 8 9  /
    \4 5 6/
     \2 3/
      \1/
In each row, fill() always fill data from left to right.

The method drip() should drip the bottom value out of funnel and returns this value:

 (continue the example above)
 v = funnel.drip()
 puts v
 1
 print funnel.to_s
  \         /
   \  8 9  /
    \7 5 6/
     \4 3/
      \2/
 (continue the example above)
 var v = funnel.drip()
 console.log(v)
 1
 console.log(funnel.toString())
  \         /
   \  8 9  /
    \7 5 6/
     \4 3/
      \2/
As you can see, the bottom 1 was dripping out. The number above it will fill it's place. The rules to fill are: Select one of the two numbers above it, which bear the "weight" of relatively large. In other words, there are more numbers on this number. Is this a bit hard to understand? Please see the following:

 In the example above, before the execution of drip(), funnel is:
  \         /
   \7 8 9  /
    \4 5 6/
     \2 3/
      \1/
 After drip(), 1 will be dripped out.
 We should choose a number between 2 and 3 to fill the place of 1.
 2 has 5 numbers on it(4,5,7,8,9). 3 has 4 numbers on it(5,6,8,9)
 So we choose 2 to fill the place of 1
 And now, the place of 2 is empty.
 We also need choose a number between 4 and 5 to fill the place of 2.
 4 has 2 numbers on it(7,8). 5 has 2 numbers on it too(8,9)
 There are same "weight" on 4 and 5,
 In this case, we choose the number on the left
 So we choose 4 to fill the place of 2
 And then choose 7 to fill the place of 4
Let us continue do drip():

 funnel.drip
 print funnel.to_s
  \         /
   \    9  /
    \7 8 6/
     \5 3/
      \4/

 funnel.drip
 print funnel.to_s
  \         /
   \       /
    \7 9 6/
     \8 3/
      \5/

 funnel.drip
 print funnel.to_s
  \         /
   \       /
    \  9 6/
     \7 3/
      \8/

 funnel.drip
 print funnel.to_s
  \         /
   \       /
    \    6/
     \7 9/
      \3/

 funnel.drip
 print funnel.to_s
  \         /
   \       /
    \     /
     \7 6/
      \9/

 funnel.drip
 print funnel.to_s
  \         /
   \       /
    \     /
     \  6/
      \7/

 funnel.drip
 print funnel.to_s
  \         /
   \       /
    \     /
     \   /
      \6/

 funnel.drip
 print funnel.to_s
  \         /
   \       /
    \     /
     \   /
      \ /
 funnel.drip()
 console.log(funnel.toString())
  \         /
   \    9  /
    \7 8 6/
     \5 3/
      \4/

 funnel.drip()
 console.log(funnel.toString())
  \         /
   \       /
    \7 9 6/
     \8 3/
      \5/

 funnel.drip()
 console.log(funnel.toString())
  \         /
   \       /
    \  9 6/
     \7 3/
      \8/

 funnel.drip()
 console.log(funnel.toString())
  \         /
   \       /
    \    6/
     \7 9/
      \3/

 funnel.drip()
 console.log(funnel.toString())
  \         /
   \       /
    \     /
     \7 6/
      \9/

 funnel.drip()
 console.log(funnel.toString())
  \         /
   \       /
    \     /
     \  6/
      \7/

 funnel.drip()
 console.log(funnel.toString())
  \         /
   \       /
    \     /
     \   /
      \6/

 funnel.drip()
 console.log(funnel.toString())
  \         /
   \       /
    \     /
     \   /
      \ /
When the funnel is empty, drip() will return null(nil in Ruby)

 v= funnel.drip
 puts v
 nil
 print funnel.to_s
  \         /
   \       /
    \     /
     \   /
      \ /
 var v= funnel.drip()
 console.log(v)
 null
 console.log(funnel.toString())
  \         /
   \       /
    \     /
     \   /
      \ /
Another edge case is: When funnel is full, fill() will not changes the funnel.


=end



class Funnel
  attr_reader :funnel, :size

  EMPTY_FUNNEL = [["\\", :eleven, ' ' , :twelve, ' ', :thirteen, ' ', :fourteen, ' ', :fifteen, "/"], [' ', "\\", :seven, ' ', :eight, ' ', :nine, ' ', :ten,"/"], [' ', ' ',"\\", :four, ' ', :five, ' ', :six, "/"], [' ', ' ', ' ', "\\", :two, ' ', :three, "/"], [' ', ' ', ' ', ' ', "\\", :one, "/"]]

  POSITIONS_TO_DISPLAY = { one: ' ', two: ' ', three: ' ', four: ' ', five: ' ', six: ' ', seven: ' ', eight: ' ', nine: ' ', ten: ' ', eleven: ' ', twelve: ' ', thirteen: ' ', fourteen: ' ', fifteen: ' ' }

  CONVERSION = { one: 1, two: 2, three: 3, four: 4, five: 5, six: 6, seven: 7, eight: 8, nine: 9, ten: 10, eleven: 11, twelve: 12, thirteen: 13, fourteen: 14, fifteen: 15 }

  def initialize
    @size = 15
    @positions = POSITIONS_TO_DISPLAY.clone
  end

  # Filling the funnel

  def fill(*args)
    @positions.each do |key, value|
      if value == ' ' || value.nil?
        @positions[key] = args.shift
      end
    end
  end

  def fill_funnel(positions_to_display)
    @funnel = EMPTY_FUNNEL.clone
    @funnel.map! { |line| line.map do |value|
      if positions_to_display.keys.include?(value)
        positions_to_display[value].nil? ? ' ' : positions_to_display[value]
      else
        value
      end
    end
    }
  end

  def filling_level
    @positions.find_index { |_, value| value == ' ' }
  end

  # Display the funnel

  def to_s
    fill_funnel(@positions)
    @funnel.reduce("") { |result, line| result += line.join + "\n"; result}.join
  end

  # Dripping

  def drip
    dripping_piece = @positions[:one]
    dripping(1)
    dripping_piece
  end

  def dripping(n)
    return if n.nil? || n == " "
    if define_weight(n) == 0
      @positions[CONVERSION.invert[n]] = ' '
      return
    end
    subfunnel = building_subfunnel(n)
    dripped = if define_weight(subfunnel[1][0]) >= define_weight(subfunnel[1][1])
                subfunnel[1][0]
              else
                subfunnel[1][1]
              end
    @positions[CONVERSION.invert[n]] = @positions[CONVERSION.invert[dripped]]
    dripping(dripped)
  end

  def define_weight(position)
    load = building_subfunnel(CONVERSION.invert[position]).flatten.map { |position| CONVERSION.invert[position] }
    estimate_weight(load) - 1
  end

  def estimate_weight(load)
    load.reduce(0) { |result, value| result += 1 if @positions[value] != ' '; result }
  end

  #creation of subfunnels

  def building_subfunnel(base)
    base = CONVERSION[base] if base.class == Symbol
    rank = find_rank(base)
    base_position = find_position_in_funnel(base, rank)
    @subfunnel = [[base]]
    count = 2
    @funnel_max.each_with_index.reduce(@subfunnel) do |subfunnel, (line, index)|
      if index > rank
        subfunnel << line[base_position, count]
        count += 1
      end
      subfunnel
    end
  end

  def find_position_in_funnel(base, rank)
    @funnel_max[rank].find_index { |position| position == base }
  end

  def find_rank(base)
    build_funnel_max
    @funnel_max.find_index { |rank| rank.include?(base) }
  end

  def build_funnel_max
    all_positions = (1..@size).to_a
    level = 1
    @funnel_max = []
    loop do
      @funnel_max << all_positions.take(level)
      all_positions -= @funnel_max.flatten
      level += 1
      break if all_positions.empty?
    end
  end

end

funnel = Funnel.new
funnel.fill 1, 2, 3
funnel.to_s
p funnel.funnel.map(&:join).each { |line| puts line }
funnel.drip
funnel.to_s
p funnel.funnel.map(&:join).each { |line| puts line }
funnel.fill 4, 5, 6, 7, 8, 9, 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H'
funnel.to_s
p funnel.funnel.map(&:join).each { |line| puts line }



