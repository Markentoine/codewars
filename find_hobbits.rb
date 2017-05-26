=begin
You are a lonely hobbit,
and you've been given a manifest of all the residents in this side of the country.
The manifest is an array of hashes, that have the form: {name: 'string', race: 'string', home: 'string'}

You want to find all of the other hobbits!
Your task is to return an array from a given manifest
that contains all of the potential halflings in the list.
From your experience you know that hobbits don't always follow the rules,
and some may have entered their race under their home and vice versa.
You also know that some hobbits will refer to themselves as halflings,
and that popular homes for hobbits include the shire, south farthing, and hobbiton.

TLDR; For a given array of hashes of the form
{name: 'string', race: 'string', home: 'string'},
return an array of all the objects
that have the words halfling,hobbit,shire,farthing, or hobbiton anywhere within the race or home field.
=end

=begin
I : array of hashes (:name, :race, :home)
O : array of hashes selected from the argument
Algo : select hashes where : 
          :race or : home is halfling,hobbit,shire,farthing, or hobbiton
=end

manifest = [
  {name:'Aragorn', race:'Human', home:'Kingdom of Men'},
  {name:'Bilbo', race:'Hobbit', home:'The Shire'},
  {name:'Tom Bombadil', race:nil, home:'The Forest'}]
  
def find_hobbits_in(manifest)
  matches = [ /halfling/i , /hobbit/i, /shire/i, /farthing/i, /hobbiton/i ]
  manifest.select do |hash| 
    matches.map do |regex|
      !!hash[:race].to_s.match(regex) || !!hash[:home].to_s.match(regex) 
    end.include?(true)
  end
end

# other solutions

def find_hobbits_in(manifest)
  keywords = %w{halfling hobbit shire farthing hobbiton}
  r = /#{keywords.join('|')}/i
  manifest.select do |resident|
    [:race,:home].any?{ |field| "#{resident[field]}" =~ r }
  end
end
#--------------------
REGEX = /halfling|hobbit|shire|farthing|hobbiton/i

def find_hobbits_in(manifest)
  manifest.select { |hsh| hsh.values_at(:race, :home).join[REGEX] }
end
#----------------------
def find_hobbits_in(manifest)
  r = /h(alfling|obbit(on)?)|shire|farthing/i
  manifest.select{|o| o[:race] =~ r || o[:home] =~ r }
end
  
