# Enter a noun: dog
# Enter a verb: walk
# Enter an adjective: blue
# Enter an adverb: quickly

# Do you walk your blue dog quickly? That's hilarious!

# get user input
puts "> Please enter a noun:"
noun = gets.chomp
puts "> Please enter a verb:"
verb = gets.chomp
puts "> Please enter an adjective:"
adjective = gets.chomp
puts "> Please enter an adverb:"
adverb = gets.chomp

# assemble madlib
puts "Do you #{verb} your #{adjective} #{noun} #{adverb}?  That's hilarious!"