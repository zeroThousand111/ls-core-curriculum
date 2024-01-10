require 'pry'
require 'pry-byebug'

# def neutralize(sentence)
#   words = sentence.split(' ')
#   words.each do |word|
#     binding.pry
#     words.delete(word) if negative?(word)
#   end

#   words.join(' ')
# end

# the issue is that when there are two consecutive negative words, deleting the first causes the #each method to skip the second, because it has moved on to an element of a higher index number.  Actually the whole approach is wrong.

def negative?(word)
  [ 'dull',
    'boring',
    'annoying',
    'chaotic'
  ].include?(word)
end

# solution 1 - select a new string from the sentence

def neutralize(sentence)
  words = sentence.split(' ')
  words.select do |word|
    !negative?(word)
  end.join(' ')
end


# solution 2 - Build a new string from the original sentence without negative words

# def neutralize(sentence)
#   new_words = []
#   words = sentence.split(' ')
#   words.each do |word|
#     new_words << word  if !negative?(word) 
#   end
#   new_words.join(' ')
# end

puts neutralize('These dull boring cards are part of a chaotic board game.')
# Expected: These cards are part of a board game.
# Actual: These boring cards are part of a board game.