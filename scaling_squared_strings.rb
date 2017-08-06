def scale(strng, k, n)
    substr = strng.split(/\n/)
    substr.map! { |sub| sub.chars.map { |char| char * k }.join }
    substr.map! { |w| result = []; n.times { result.push(w) }; result }.flatten.map { |word| word + "\n"}.join.chomp
end

a = "abcd\nefgh\nijkl\nmnop"
r = "aabbccdd\naabbccdd\naabbccdd\neeffgghh\neeffgghh\neeffgghh\niijjkkll\niijjkkll\niijjkkll\nmmnnoopp\nmmnnoopp\nmmnnoopp"
p scale(a, 2, 3)