=begin
Description:

Remove odd number continuous exclamation marks and question marks, until no continuous exclamation marks and question marks exist. Please note: One exclamation mark or question mark is not a continuous exclamation marks or question marks. The string only contains ! and ?.
Examples

remove("") === ""
remove("!") === "!"
remove("!!") === "!!"
remove("!!!") === ""
remove("!??") === "!??"
remove("!???") === "!"
remove("!!!??") === "??"
remove("!!!???") === ""
remove("!??") === "!??"
remove("!???!!") === ""
("!???!!" --> "!!!" --> "")
remove("!????!!!?") === "!"
("!????!!!?" --> "!?????" --> "!")
=end

def remove(s)
	loop do
	  excl_marks = s.scan(/(!+)/).flatten.select { |group| group.count('!').odd? && group.count('!') > 1 }
	  excl_marks.each { |str| s.gsub!(str, '') }
	  quest_marks = s.scan(/(\?+)/).flatten.select { |group| group.count('?').odd? && group.count('?') > 1 }
	  quest_marks.each { |str| s.gsub!(str, '') }
	  break if excl_marks.empty? && quest_marks.empty?
  end
  s
end

p remove("!????!!!?")
p remove("!!!???")
p remove("!??")
 
 
 # other solutions
 def remove(s) lambda{|n| s==n ? s : remove(n)}.(s.gsub(/\?+|!+/){|l| (l.size>1 && l.size%2==1) ? "" : l}) end