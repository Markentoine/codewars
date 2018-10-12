def covfefe(tweet)
  tweet =~ /coverage/ ? tweet.gsub('coverage', 'covfefe') : tweet + ' covfefe'
end

#other solutions 

def covfefe(tweet)
  tweet.include?("coverage") ? tweet.gsub("coverage","covfefe") : tweet +" covfefe"
end

def covfefe(tweet)
  tweet =~ /coverage/ ? tweet.gsub('coverage', 'covfefe') : tweet + ' covfefe'
end

