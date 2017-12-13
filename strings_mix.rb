=begin
Given two strings s1 and s2, we want to visualize how different the two strings are. We will only take into account the lowercase letters (a to z). First let us count the frequency of each lowercase letters in s1 and s2.

s1 = "A aaaa bb c"

s2 = "& aaa bbb c d"

s1 has 4 'a', 2 'b', 1 'c'

s2 has 3 'a', 3 'b', 1 'c', 1 'd'

So the maximum for 'a' in s1 and s2 is 4 from s1; the maximum for 'b' is 3 from s2. In the following we will not consider letters when the maximum of their occurrences is less than or equal to 1.

We can resume the differences between s1 and s2 in the following string: "1:aaaa/2:bbb" where 1 in 1:aaaa stands for string s1 and aaaa because the maximum for a is 4. In the same manner 2:bbb stands for string s2 and bbb because the maximum for b is 3.

The task is to produce a string in which each lowercase letters of s1 or s2 appears as many times as its maximum if this maximum is strictly greater than 1; these letters will be prefixed by the number of the string where they appear with their maximum value and :. If the maximum is in s1 as well as in s2 the prefix is =:.

In the result, substrings (a substring is for example 2:nnnnn or 1:hhh; it contains the prefix) will be in decreasing order of their length and when they have the same length sorted in ascending lexicographic order (letters and digits - more precisely sorted by codepoint); the different groups will be separated by '/'. See examples and "Example Tests".

Hopefully other examples can make this clearer.

s1 = "my&friend&Paul has heavy hats! &"
s2 = "my friend John has many many friends &"
mix(s1, s2) --> "2:nnnnn/1:aaaa/1:hhh/2:mmm/2:yyy/2:dd/2:ff/2:ii/2:rr/=:ee/=:ss"

s1 = "mmmmm m nnnnn y&friend&Paul has heavy hats! &"
s2 = "my frie n d Joh n has ma n y ma n y frie n ds n&"
mix(s1, s2) --> "1:mmmmmm/=:nnnnnn/1:aaaa/1:hhh/2:yyy/2:dd/2:ff/2:ii/2:rr/=:ee/=:ss"

s1="Are the kids at home? aaaaa fffff"
s2="Yes they are here! aaaaa fffff"
mix(s1, s2) --> "=:aaaaaa/2:eeeee/=:fffff/1:tt/2:rr/=:hh"
=end

def mix(s1, s2)
  s1 = cleaning_string(s1)
  s2 = cleaning_string(s2)
  merge = merging_datas(counter(s1), counter(s2))
  temp_result = filtering_results(merge)
  temp_result = sorting_results_by_size(temp_result)
  temp_result = recompose_by_size(temp_result)
  final_reorder(temp_result)
end

def cleaning_string(string)
  string.chars.reduce('') { |result, char| char.match(/[a-z]/) ? result << char : result }
end

def counter(string)
  ('a'..'z').to_a.reduce({}) { |result, letter| result[letter] = string.count(letter); result}
end

def merging_datas(h1, h2)
  h1.merge(h2) do |key, val1, val2|
   if val1 == val2
     "3:" + ("#{key}" * val1)
   elsif val1 > val2
     "1:" + ("#{key}" * val1)
   else
     "2:" + ("#{key}" * val2)
   end
  end
end

def filtering_results(h)
  h.values
   .map { |value| value.split(":") }
   .reduce([]) do |result, value|
     if value.size == 2 && value[1].length > 1
       result << value
     end
     result
   end
end

def sorting_results_by_size(results)
  results.sort_by { |value| -value[1].size }
end

def recompose_by_size(sorted_results)
  size = sorted_results[0][1].size
  result = []
  current_result = []
  sorted_results.each do |value|
    if value[1].size == size
      current_result << value
    else
      size = value[1].size
      result << current_result
      current_result = []
      current_result << value
    end
  end
  result << current_result
  result
end

def final_reorder(result)
  result.map { |t| t.sort_by { |v| v[0].to_i}}.flat_map { |a| a.map {|x| x[0] = '=' if x[0] == "3"; x.join(":")}}.join('/')
end
