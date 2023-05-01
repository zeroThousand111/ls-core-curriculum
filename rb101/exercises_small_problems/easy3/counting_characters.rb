# get user input:
puts "Please write word or multiple words:"
string = gets.chomp

# count characters in string minus spaces
count = string.gsub(' ', '').length

# output
puts "There are #{count} characters in \"#{string}\"."
