famous_words = "seven years ago..."

# string concatenation
puts "Four score and " + famous_words # doesn't mutate

# shovel operator aka String#<< method
puts "Four score and " << famous_words # does mutate famous_words

# String#prepend
famous_words = "seven years ago..."

puts famous_words.prepend("Four score and ")
