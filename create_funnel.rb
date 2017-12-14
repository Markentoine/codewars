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
  # coding and coding...
  def initialize
    @funnel = [["\\", ' ', ' ' , ' ', ' ', ' ', ' ', ' ', ' ', ' ', "/"], [' ', "\\", ' ', ' ', ' ', ' ', ' ', ' ', ' ',"/"], [' ', ' ',"\\", ' ', ' ', ' ', ' ', ' ', "/"], [' ', ' ', ' ', "\\", ' ', ' ', ' ', "/"], [' ', ' ', ' ', ' ', "\\", ' ', "/"]]
  end

  def fill *args
  end

  def drip
  end

  def to_s
    @funnel.map(&:join).each { |line| puts line }
  end
end

funnel = Funnel.new
funnel.to_s

