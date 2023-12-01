=begin
________________________________________________________________________________
*****Problem*****

Write a method that takes one argument, a positive integer, and returns a list of the digits in the number.
________________________________________________________________________________
Input:
  # What is the form of the data you want to transform?
  
  An Integer
  
Output:
  # What is the form of the data you want the program to either return or print?
  
  An Array of Integers
  
Explicit reqs:
  # What does the problem say about what you should do?
  - One argument
  - Integer is a positive value (no negative, no zero)
  - Return a list of the digits in the number.
Implicit reqs:
  # What does the problem NOT say about what you need to have covered?
  - Test cases imply that the list should be in order of magnitude of digits
  
________________________________________________________________________________
*****Examples/Test cases*****
________________________________________________________________________________
Test cases:
  # What are some examples of expected outputs for a given input? Be thorough
  puts digit_list(12345) == [1, 2, 3, 4, 5]     # => true
  puts digit_list(7) == [7]                     # => true
  puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
  puts digit_list(444) == [4, 4, 4]             # => true
________________________________________________________________________________
*****Data structures*****
________________________________________________________________________________
Data manipulation strategy:
  # What forms do your data take on while the program is running?
  
  Integers are input.  Array is output.
________________________________________________________________________________
*****Algorithm*****
________________________________________________________________________________
Step-by-step process (plaintext or pseudocode):
  # The logical process by which you intend to tackle the problem at hand
  
  1. Split the 
________________________________________________________________________________
Time to code!
=end


# solution 1: Use Integer#digits to create reversed Array, then reverse with Array#reverse

# def digit_list(num)
#   num.digits.reverse
# end

# solution 2: Loop through a string version of the number!

# def digit_list(num)
#   counter = 0
#   array = []
#   string = num.to_s
#   loop do
#     array << string[counter].to_i
#     counter += 1
#     break if counter == num.to_s.size
#   end
#   array
# end

# solution 3: Iterate through an array of string characters and map them to the integer equivalent

def digit_list(num)
  num.to_s.chars.map { |i| i.to_i }
end

# Print tests
puts digit_list(12345)

# Test cases
puts digit_list(12345) == [1, 2, 3, 4, 5]     # => true
puts digit_list(7) == [7]                     # => true
puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
puts digit_list(444) == [4, 4, 4]             # => true