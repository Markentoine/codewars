=begin
This is now a little serie :)

Funny Dots

You will get two Integer n (width) and m (height) and your task is to draw following pattern. 
Each line is seperated with '\n'.

Both integers are equal or greater than 1. No need to check for invalid parameters.

e.g.:


                                          +---+---+---+
            +---+                         | o | o | o |
dot(1,1) => | o |          dot(3,2) =>    +---+---+---+            
            +---+                         | o | o | o |
                                          +---+---+---+
=end
def dot(n,m)
  result = ''
  line = "+---"
  inside ="| o "
  m.times do
    result += (line * n) + "+" + "\n"
    result += inside * n + "|\n"
  end
      result += (line * n) + "+" + "\n"

  result
end

p dot(3, 2)
puts dot(6, 3)
puts dot(9, 5)