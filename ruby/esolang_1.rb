=begin
The Task

Time to write your first Esolang interpreter :D

Your task is to implement a MiniStringFuck interpreter myFirstInterpreter()/my_first_interpreter()/Interpreter()/ 
which accepts exactly 1 required argument code/$code which is the MiniStringFuck program to be executed. 
The output of the program should then be returned by your interpreter as a string.

For Elixir you have to implement MiniStringFuck.execute/1.

For Java you'll implement the MyFirstInterpreter class which accepts 1 String in it's constructor 
and returns the output from the interpret method.

Since this is the first time you are about to write an interpreter for an Esolang, here are a few quick tips:

If you are afraid that your interpreter will be confused by non-command characters appearing 
in the MiniStringFuck program, you can try to remove all non-command characters 
from the code input before letting your interpreter interpret it
The memory cell in MiniStringFuck only ever contains a single integer value - 
think of how it can be modelled in your interpreter
If you are stuck as to how to interpret the string as a program, 
try thinking of strings as an array of characters. 
Try looping through the "program" like you would an array
Writing an interpreter for an Esolang can sometimes be quite confusing! 
It never hurts to add a few comments in your interpreter as you implement it to remind yourself of 
what is happening within the interpreter at every stage
NOTE: If you would not like to name your interpreter as myFirstInterpreter()/my_first_interpreter(), 
you can optionally rename it to either miniStringFuck()/mini_string_fuck() or interpreter() instead - 
the test cases will handle the rest for you. 
Not available in Java, Go, Swift, TypeScript, Haskell and Elixir

Good luck :D
=end

def my_first_interpreter(code)
  code = code.gsub(/[^.+]/, '') # clean code
  cell = [0]
  result = []
  return '' if code == '' || code.nil?
  code.each_char do |command| 
  	if command == '+'
  		cell[0] = 1 + (cell[0] % 256)
  	else 
  		if cell[0] < 256 
  		  result.push(cell[0].chr)
  		elsif cell[0] == 256
  	    result.push(0.chr)
  	  end
  	end
  end
  result.empty? ? '' : result.join
end

#other solutions
def my_first_interpreter(code, n = (0..255).cycle)
  code.delete('^+.').chars.map { |char| char == '.' ? n.peek.chr : n.next && '' }.join
end