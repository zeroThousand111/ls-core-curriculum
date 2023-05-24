# method
def calculation(n, operation)
  array = []
  n.times do | i |
    array << i + 1
  end
  if operation == 's'
    return array.sum
  elsif operation == 'p'
    return array.inject(:*)
  end
end

total = 0

# get user input
puts ">> Please enter an integer greater than 0:"
integer = gets.chomp.to_i
puts "> >> Enter 's' to compute the sum, 'p' to compute the product."
calc = gets.chomp

# invoke method on the user input
total = calculation(integer, calc)

# create string for operation output
if calc == 's'
  operation_string = "sum"
elsif calc == 'p'
  operation_string = "product"
else
  puts "You did not enter a valid operation."
end

# output
puts "The #{operation_string} of the integers between 1 and #{integer} is #{total}."