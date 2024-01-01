=begin
______________________________________________________________________________
*****Understand the PROBLEM*****
______________________________________________________________________________
THE PROBLEM:

Write a method that takes one argument, a positive integer, and returns the sum of its digits.

INPUT: An Integer

OUTPUT: An Integer

RULES
EXPLICIT REQUIREMENTS:
  - A method;
  - One argument: a positive Integer;
  - The return should be the sum of the digits of the argument.
  
IMPLICIT REQUIREMENTS:
  - Output will be an Integer.
  -
  -

______________________________________________________________________________
*****EXAMPLES/TEST CASES*****
______________________________________________________________________________

puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45

______________________________________________________________________________
*****DATA STRUCTURES*****
______________________________________________________________________________

Array?  String?

______________________________________________________________________________
*****ALGORITHM*****
______________________________________________________________________________

1. Convert input_num to separate digits and store in an array;
  a. Convert input_num to a string;
  b. Iterate over string and generate numerical strings that convert to numbers;
  c. Store each number in the new array.
2. Sum elements in the array
3. Return the sum.
4.
5.
______________________________________________________________________________

Now CODE with intent!
=end

# solution 1 - using a simple loop

# def sum(input)
#   string = input.to_s
#   array = []
#   counter = 0
  
#   loop do
#     array << string[counter].to_i
#     counter += 1
#     break if counter == string.length
#   end
  
#   array.sum
# end

# -------------------

# solution 2 - using #each

# def sum(input)
#   string_array = input.to_s.chars
#   array = []
  
#   string_array.each do |char|
#     array << char.to_i
#   end
  
#   array.sum
# end

# -------------------

# solution 3 - using #map

# def sum(input)
#   string_array = input.to_s.chars
#   array = string_array.map do |char|
#     char.to_i
#   end
  
#   array.sum
# end

# -------------------

# solution 4 - using #map refactored to be condensed

# def sum(input)
#   input.to_s.chars.map { |char| char.to_i}.sum
# end

# -------------------

# solution 5 - Challenge using Array#digits and #reverse

# def sum(input)
#   input.digits.reverse.sum
# end


# -------------------

# solution 6 - official last one line LS solution

def sum(input)
  input.to_s.chars.map(&:to_i).reduce(:+)
end

=begin
23.to_s        # => "23"
  .chars       # => ["2", "3"]
  .map(&:to_i) # => [2, 3]
  .reduce(:+)  # => 5
=end

# Print Tests
p sum(23) # 5

# Test Cases
puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45