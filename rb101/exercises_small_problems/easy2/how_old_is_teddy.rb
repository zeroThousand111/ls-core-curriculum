# ask user for name input
puts '=> What is the name of the person?'
name = gets.chomp

# if name is blank, change it to Teddy
name = 'Teddy' if name == ''

# generate Teddy's age
age = rand(20..200)

# output to user
puts "#{name} is #{age} years old!"
