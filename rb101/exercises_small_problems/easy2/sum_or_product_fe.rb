# define calculation methods
def sum(n)
  (1..n).inject { |sum, i| sum + i}
end

def product(n)
  (1..n).inject { |product, i| product * i}
end

# get user input
puts "Please pick a number greater than zero:"
n = gets.chomp.to_i
puts "Do you want to determine the sum or the product of all the numbers between 1 and your number?"
puts "'s' for sum, 'p' for product"
operation = gets.chomp

# conditional flow of code depending upon user input
if operation == 's'
  puts "The sum of all numbers from 1 to #{n} is #{sum(n)}."
elsif operation == 'p'
  puts "The product of all numbers from 1 to #{n} is #{product(n)}."
else
  puts "I didn't understand what you wanted me to do, please try again."
end

puts "Goodbye!"
