def encode(message, key)
  ascii = message.chars.map { |char| char.ord - 96 }
  digits = []
  key.to_s.chars.cycle(message.length /  key.to_s.length) do |char| 
    digits << char
   end
  key.to_s[0, message.length % key.to_s.length].chars.each { |digit| digits << digit }

  ascii.zip(digits).map { |pair| pair[0].to_i + pair[1].to_i }
end

p encode('scout', 1939)
p encode("masterpiece", 1939)

def encode(msg, key)
  msg.codepoints.zip(key.to_s.chars * msg.size).map { |ord, n| ord - 96 + n.to_i }
end