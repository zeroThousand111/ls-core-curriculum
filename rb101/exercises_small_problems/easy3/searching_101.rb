# initialise empty array
array = []
# get five numbers from the user
puts "Enter the 1st number:"
n1 = gets.chomp.to_i
array << n1
puts "Enter the 2nd number:"
n2 = gets.chomp.to_i
array << n2
puts "Enter the 3rd number:"
n3 = gets.chomp.to_i
array << n3
puts "Enter the 4th number:"
n4 = gets.chomp.to_i
array << n4
puts "Enter the 5th number:"
n5 = gets.chomp.to_i
array << n5

# get sixth number from the user
puts "Enter the last number:"
last = gets.chomp.to_i

# output result:
if array.include?(last)
  puts "The number #{last} appears in #{array}"
else
  puts "The number #{last} does not appear in #{array}"
end
