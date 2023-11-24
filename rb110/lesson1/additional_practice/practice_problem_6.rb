=begin
Write code that changes the array below so that all of the names are shortened to just the first three characters. Do not create a new array.

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

=end

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

# solution 1: Loop and String Element (re)Assignment

# p flintstones
# counter = 0

# loop do
#   flintstones[counter] = flintstones[counter][0, 3]
#   counter += 1
#   break if counter == flintstones.size
# end

# p flintstones

# solution 2a: Array#map! and String Element (re)Assignment

# p flintstones

# flintstones.map! do |word|
#   word[0, 3]
# end

# p flintstones

# solution 2b: As above but on a single line.  Same as official LS solution

p flintstones
flintstones.map! { |word| word[0, 3] }
p flintstones