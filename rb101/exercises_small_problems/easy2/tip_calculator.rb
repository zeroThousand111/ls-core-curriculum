# get user input
puts "What is the bill ($)?"
bill = gets.chomp.to_f
puts "What is the tip percentage (%)?"
percentage = gets.chomp.to_f

# calculation
p tip = bill * (percentage / 100)
p result = (bill + tip).round(2)

# output
puts <<-HEREDOC
The tip on a bill of £#{bill}...
with a tip percentage of #{percentage}%...
is... £#{result}
HEREDOC