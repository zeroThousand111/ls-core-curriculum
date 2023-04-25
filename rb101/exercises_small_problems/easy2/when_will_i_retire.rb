# get user input
puts "What is your age?"
age = gets.chomp.to_i
puts "At what age would you like to retire?"
retirement_age = gets.chomp.to_i

# calculations
this_year = 2023
difference = retirement_age - age
retirement_year = this_year + difference

# output
puts <<HEREDOC
It's #{this_year}.  You will retire in #{retirement_year}.
You have only #{difference} years of work to go!
HEREDOC