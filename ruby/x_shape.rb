=begin
This will probably be a little serie :)

X-Shape

You will get an odd Integer n (>= 3) and your task is to draw a X. Each line is seperated with '\n'.

Use the following characters:

■ □

For Ruby and Crystal:

whitespace and o

e.g.:


                                     ■□□□■
            ■□■                      □■□■□
  x(3) =>   □■□              x(5)=>  □□■□□
            ■□■                      □■□■□
                                     ■□□□■
=end

def x(n)
  result = []
  front = []
  result.push(" " * (n / 2) + "o" + " " * (n / 2) +  "\n")
  (n / 2).times do |x|
    front.push(" " * x + 'o' + " " * ((n - 2) - (x * 2)) + 'o' + " " * x +"\n")
  end
  back = front.reverse
  result = front + result + back
  result.join.strip
end

puts x(5)
puts x(9)