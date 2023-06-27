def mess_with_vars(a, b, c)
	 p a # => "one"
	 p b # => 5
	 p c # => [1, 2, 3]

	 a = b
	 b = c
	 c = a

	 p a # => 5
	 p b # => [1, 2, 3]
	 p c # => 5
end

one = "one"
two = 5
three = [1, 2, 3]

mess_with_vars(one, two, three)

puts "one is: #{one}"
puts "two is: #{two}"
puts "three is: #{three}"

# Output:
# one is: one
# two is: 5
# three is: [1, 2, 3]
