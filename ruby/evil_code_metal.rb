=begin
Task

EvilCode is a game similar to Codewars. You have to solve programming tasks as quickly as possible. However, unlike Codewars, EvilCode awards you with a medal, depending on the time you took to solve the task.

To get a medal, your time must be (strictly) inferior to the time corresponding to the medal. You can be awarded "Gold", "Silver" or "Bronze" medal, or "None" medal at all. Only one medal (the best achieved) is awarded.

You are given the time achieved for the task and the time corresponding to each medal. Your task is to return the awarded medal.

Each time is given in the format HH:MM:SS.

Input/Output

[input] string userTime

The time the user achieved.

[input] string gold

The time corresponding to the gold medal.

[input] string silver

The time corresponding to the silver medal.

[input] string bronze

The time corresponding to the bronze medal.

It is guaranteed that gold < silver < bronze.

[output] a string

The medal awarded, one of for options: "Gold", "Silver", "Bronze" or "None".

Example

For

userTime = "00:30:00", gold = "00:15:00",
silver = "00:45:00" and bronze = "01:15:00"
the output should be "Silver"

For

userTime = "01:15:00", gold = "00:15:00",
silver = "00:45:00" and bronze = "01:15:00"
the output should be "None"
=end

def evil_code_medal(user_time, gold, silver, bronze)
  conversion = [gold, silver, bronze, user_time].map { |var| var.scan(/\d+/) }.map { |arr| arr.map(&:to_i) }
  gold, silver, bronze, user_time =  conversion.map { |arr| arr[0] * 3600 + arr[1] * 60 + arr[2] }
  find = {"Gold": gold, "Silver": silver, "Bronze": bronze, "None": (bronze + 1) }.find { |medal, time| user_time < time }
  find.nil? ? "None" : find[0].to_s
end

#other solutions

def evil_code_medal(user_time, gold, silver, bronze)
  user_time < gold ? 'Gold' : user_time < silver ? 'Silver' : user_time < bronze ? 'Bronze' : 'None';
end