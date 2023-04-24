# get user input
puts "What is the bill ($)?"
bill = gets.chomp.to_f
puts "What is the tip percentage (%)?"
percentage = gets.chomp.to_f

# calculation
tip = bill * (percentage / 100)
result = (bill + tip).round(2)

# output
puts <<-HEREDOC
The tip on a bill of £#{format("%.2f", bill)}...
with a tip percentage of #{percentage}%...
is... £#{format("%.2f", result)}
HEREDOC