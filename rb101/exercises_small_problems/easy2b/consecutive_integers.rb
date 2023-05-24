# method
def calculation(n, operation)
  array = []
  n.times do | i |
    array << i + 1
  end
  if operation == 's'
    return array.inject(:+)
  elsif operation == 'p'
    return array.inject(:*)
  end
end

def valid_integer?(n)
  n.to_s.to_i == n && n > 0
end

def valid_operator?(string)
  string.include?('s') || string.include?('p')
end

def get_integer
  int = nil
  loop do
    puts ">> Please enter an integer greater than 0:"
    int = gets.chomp.to_i
    break if valid_integer?(int)
    puts ">> Sorry that's not a valid integer above zero.  Please try again."
  end
  int
end

def get_operator
  calc = nil
  loop do 
    puts "> >> Enter 's' to compute the sum, 'p' to compute the product."
    calc = gets.chomp.downcase!
    break if valid_operator?(calc)
    puts ">> Sorry that's not a valid input.  Please type 's' or 'p'"
  end
  calc
end

total = 0

# get user input
integer = get_integer
calc = get_operator

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