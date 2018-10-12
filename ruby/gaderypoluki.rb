#KEY = { 'g'=>'a', 'd'=>'e', 'r'=>'y', 'p'=>'o', 'l'=>'u', 'k'=>'i' }
#
#
#def encode(str)
#  encoded = str.downcase.gsub(/[gaderypoluki]/) do |match| 
#  if KEY.keys.include?(match)
#  	KEY[match]
#  elsif KEY.values.include?(match)
#    KEY.invert[match]
#  end
#  end
#  str.chars.each_with_index { |char, idx| encoded[idx] = encoded[idx].upcase if char.upcase == char }
#  encoded
#end
#
#def decode(str)
# encode(str)
#end
#
#p encode('ABCD')
#p encode('GBCE')
#p decode('agedyropulik')
#
##other solutions
#
#def encode(str)
#  str.tr('gaderypolukiGADERYPOLUKI', 'agedyropulikAGEDYROPULIK')
#end

# version 2
def key_convert(key)
  pairs = []
  key.chars.each_cons(2) { |pair| pairs << pair.reverse }
  match_pairs = []
  pairs.each_with_index { |pair, idx|  match_pairs << pair if idx.even?  }
  match_pairs.map(&:join).join
end

def ncode(str, key)
  str.tr(key_convert(key), key)
end

def decode(str, key)
  
end
p key_convert("agedyropulik")
p ncode("ABCD", "agedyropulik")

#others
def encode(str, key)
  yek = key.split(/([a-z]{2})/i).map(&:reverse).join
  str.tr("#{key.upcase}#{key}","#{yek.upcase}#{yek}")
end

def encode(str, key)
  key = key.each_char.each_slice(2).map{|(a,b)| [[a,b],[b,a]]}.flatten(1).to_h;
  str.gsub(/./){|c|
      x = key[c.downcase];
      x ? (c.ord>=97 ?  x : x.upcase) : c;
  }
end

def encode(str, key)
  key += key.upcase
  code = key.gsub(/(..)/){ $1.reverse }
  str.tr(key, code)
end

alias decode encode

def encode(str, key)
  a, b = key.gsub(/(.)(.)/, '\1\2\2\1').scan(/../).map(&:chars)
            .transpose.map { |s| s.join + s.join.upcase }
  str.tr(a, b)
end

alias decode encode