# get user input:
puts "=> Please enter a noun:"
noun = gets.chomp

puts "=> Please enter a verb:"
verb = gets.chomp

puts "=> Please enter an adjective:"
adjective = gets.chomp

puts "=> Please enter an adverb:"
adverb = gets.chomp

# concatenate the input into a sentence & output the madlib
puts "Do you #{verb} your #{adjective} #{noun} #{adverb}?"