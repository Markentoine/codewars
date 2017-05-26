# Description:

# In the morning all the doors in the school are closed. 
# The school is quite big: there are N doors. 
# Then pupils start coming. 
# It might be hard to believe, but all of them want to study! 
# Also, there are exactly N children studying in this school, and they come one by one.

# When these strange children pass by some doors they change their status (i.e. Open -> Closed, Closed -> Open). 
# Each student has their number, 
# and each i-th student alters the status of every i-th door. 
# For example: when the first child comes to the schools, 
# he changes every first door (he opens all of them). 
# The second one changes the status of every second door (he closes some doors: the 2nd, the 4th and so on). 
# Finally, when the last one – the n-th – comes to the school, 
# he changes the status of each n-th door (there's only one such door, though).

# You need to count how many doors are left opened after all the students have come.

# Example:

# Input:

# n – the number of doors and students, n ∈ N, n ∈ [1, 100000]
# Output:

# o – the number of opened doors, o ∈ N
# doors(5) #=> 2

# I/Output
# input : number of doors
# output : number of doors left opened

# Algo : 
# _doors = [] size N, all values set to false (closed doors)
# _iterate through the doors array with map! to change the value of the doors after each pupil enters the school.
#   => n-th doors are set to the opposite value (true / false)
# _count the true values and return this number

def doors(n)
  doors = Array.new(n, false)
  (1..n).each do  |pupil|
    ((pupil - 1)...n).step(pupil) do |idx|
      if (idx + 1) % pupil == 0 
        doors[idx] = !doors[idx] 
      end
    end

  end
  doors.count { |door| door }
end

p doors(10000)