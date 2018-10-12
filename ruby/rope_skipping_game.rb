=begin
Simple Fun #301: Rope Skipping Game

4097% of 186 of 41myjinxin2015
Ruby
TRAINNEXT KATA
Details
Solutions
Forks (2)
Discourse (12)
Add to Collection|Share this kata:
Task

Some children are playing rope skipping game. 
Children skip the rope at roughly the same speed: once per second. 
If the child fails during the jump, he needs to tidy up the rope and continue. 
This will take 3 seconds.

You are given an array failedCount, where each element is the jump count at the failed. ie. [12,23,45] means the child failed 3 times in the game process. 
The 1st mistake occurred when he jumped 12 times; The 2nd mistake occurred when he jumped 23 times; The 3rd mistake occurred when he jumped 45 times.

Your task is to calculate how many times the child jumped in 60 seconds.

Note: Each child persisted at least 60 jumps, which meant it could have been over 60 seconds, but the child continued to skip rope.

Input/Output

[input] integer array failedCount

0 ≤ failedCount.length ≤ 60

1 ≤ failedCount[i] ≤ 60

[output] an integer

how many times the child jumped in 60 seconds.

Example

For failedCount = [], the output should be 60.

There is no mistake in the game process. So the child jumped 60 times in 60 seconds.

For failedCount = [12, 23, 45], the output should be 51.
=end

def tiaosheng(failed_counter)
  return 60 if failed_counter == []
  seconds = 0
  jumps = 0
  counter = 0
  seconds_lost = 0
  loop do 
    seconds_lost = counter * 3
    break if counter > failed_counter.size - 1
    seconds = failed_counter[counter] + seconds_lost
    break if seconds > 60
    jumps = failed_counter[counter]
    counter += 1
  end
  (jumps + (counter * 3 )) < 60 ? jumps = jumps + (60 - (jumps + (counter * 3 ))) : jumps
end

p tiaosheng([]) == 60
p tiaosheng([12, 23, 45])# == 51
p tiaosheng([17]) == 57
p tiaosheng([10, 20, 30, 40]) == 48
p tiaosheng([10, 20, 30, 40, 58]) == 48
p tiaosheng([10, 20, 30, 40, 47, 60]) == 47
p tiaosheng([1,2,3,4,5,6,7,8,9,10]) == 30

#other solutions

def tiaosheng(fcnt)
  return 60 if fcnt.empty?
  ret, i = fcnt.each_with_index.take_while{ |e, i| e + i * 3 <= 60 }[-1]
  tmp = (60 - (i + 1) * 3 - ret)
  ret + (tmp <= 0 || (tmp == 1 && fcnt.include?(60)) ? 0 : tmp)
end