# welcome message
puts "Welcome to Calculator!"

# ask the user for two numbers
puts "> Please enter the first number:"
num1 = gets.chomp
puts "> Please enter the second number:"
num2 = gets.chomp

# ask the user for an operation to perform
puts "> Please enter an operation you would like to perform (+, -, *, /):"
operation = gets.chomp

# perform the operation on the two numbers
if operation == "+"
  output = num1.to_i + num2.to_i
elsif operation == "-"
  output = num1.to_i - num2.to_i
elsif operation == "*"
  output = num1.to_i * num2.to_i
elsif operation == "/"
  output = num1.to_f / num2.to_f
else
  puts "I didn't understand that input, please try again."
end
  
# output the result
puts "You asked me to calculate #{num1} #{operation} #{num2}..."
puts "The answer is #{output}!"