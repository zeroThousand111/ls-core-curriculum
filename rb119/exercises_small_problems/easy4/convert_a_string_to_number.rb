=begin
______________________________________________________________________________
*****Understand the PROBLEM*****
______________________________________________________________________________
THE PROBLEM:

The String#to_i method converts a string of numeric characters (including an optional plus or minus sign) to an Integer. String#to_i and the Integer constructor (Integer()) behave similarly. In this exercise, you will create a method that does the same thing.

Write a method that takes a String of digits, and returns the appropriate number as an integer. You may not use any of the methods mentioned above.

For now, do not worry about leading + or - signs, nor should you worry about invalid characters; assume all characters will be numeric.

You may not use any of the standard conversion methods available in Ruby to convert a string to a number, such as String#to_i, Integer(), etc. Your method should do this the old-fashioned way and calculate the result by analyzing the characters in the string.

INPUT: A numerical string

OUTPUT: An Integer

RULES
EXPLICIT REQUIREMENTS:
  - cannot use String#to_i
  - cannot use Integer()
  - return is an Integer
  - Don't worry about leading + or - signs, or invalid characters
  - Assume all characters will be numeric
  
IMPLICIT REQUIREMENTS:
  - strings may be of different lengths
  -
  -

______________________________________________________________________________
*****EXAMPLES/TEST CASES*****
______________________________________________________________________________

string_to_integer('4321') == 4321
string_to_integer('570') == 570

______________________________________________________________________________
*****DATA STRUCTURES*****
______________________________________________________________________________

Arrays to chop up the string and iterate on it
Hash for a conversion table between numeric strings and Integers

______________________________________________________________________________
*****ALGORITHM*****
______________________________________________________________________________

1.CREATE a conversion table between numeric strings and Integers
  a. A hash is a good structure for a conversion table
    i. {'1' => 1, '2' => 2, etc } 
  b. Constants are good to use so the table can be accessible and the values don't need to change
    i. TABLE = {}
2.TRANSFORM the string into an array of string characters
  a.The String#chars method works for this
    i. input_array.chars
  b.OR  could create a new array and iterate over the string to populate the new array with string characters
    i. loop do etc, with counter being string index
3.CREATE a new array of Integers
4.TRANSFORM each string character into an Integer in the array of Integers
  a.Use hash element reference and the conversion table
    i.
5.CREATE a numerical sum local variable
  a.
    i.sum = 0
6.Iterate backwards through the array of Integers i.e. reverse order 
  a.My approach to do the same thing is REVERSE the array of Integers and then iterate through it forward from left to right
    i.array_of_nums.reverse
    ii. simple loop to iterate from index 0 until array.size
7.Increment the value of sum by orders of place value 
  a. array[-1] * 1, array[-2] * 10, array[-3] * 100, etc but because the array of numbers has been reversed this will be array[0] * 1, array[1] * 10, etc
    i.sum += (array_of_nums[num_index] * (10 ** num_index))
8.Return the value of sum
______________________________________________________________________________

Now CODE with intent!
=end

require 'pry'
require 'pry-byebug'

CONVERSION = {
  '0' => 0,
  '1' => 1,
  '2' => 2,
  '3' => 3,
  '4' => 4,
  '5' => 5,
  '6' => 6,
  '7' => 7,
  '8' => 8,
  '9' => 9,
}

# solution 1 - Using simple loops only - hardcore!

# def string_to_integer(string)
#   chars = []
#   string_index = 0
  
#   loop do
#     chars << string[string_index]
#     string_index += 1
#     break if string_index == string.length
#   end
  
#   array_of_nums = []
#   array_index = 0
  
#   loop do
#     array_of_nums << CONVERSION[chars[array_index]]
#     array_index += 1
#     break if array_index == chars.size
#   end
  
#   array_of_nums = array_of_nums.reverse
  
#   sum = 0
#   num_index = 0
  
#   loop do
#     sum += (array_of_nums[num_index] * (10 ** num_index))
#     num_index +=1
#     break if num_index == array_of_nums.size
#   end
  
#   sum
# end

# -------------------

# solution 2 - Refactoring solution 1 using #each etc

# def string_to_integer(string)
#   characters = string.chars
#   array_of_nums = characters.map do |char|
#                     CONVERSION[char]
#                   end
  
#   array_of_nums.reverse!
#   sum = 0
  
#   array_of_nums.each_with_index do |num, index|
#     sum += (num * (10 ** index))
#   end
  
#   sum
# end

# -------------------

# solution 3 - Trying to be smartass clever with #inject

def string_to_integer(string)
  array_of_nums = string.chars.map { |char| CONVERSION[char] }
  
  array_of_nums.each.inject { |memo, num| 10 * memo + num }
end

# -------------------

# solution 4 - 

# -------------------

# solution 5 - 

# -------------------

# Print Tests
p string_to_integer('4321') #4321

# Test Cases
p string_to_integer('4321') == 4321
p string_to_integer('570') == 570