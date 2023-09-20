puts "Enter a noun:"
noun = gets.chomp

puts "Enter a verb:"
verb = gets.chomp

puts "Enter an adjective:"
adjective = gets.chomp

puts "Enter an adverb:"
adverb = gets.chomp

structure = [1, 2, 3].sample

case structure
when 1
  puts "Do you #{verb} your #{adjective} #{noun} #{adverb}?  Really?"
when 2
  puts "#{verb} #{adverb} the #{adjective} #{noun} you will, said Yoda."
when 3
  puts "Oh no!  I forgot to #{verb} the #{adjective} #{noun} #{adverb}!"
end
