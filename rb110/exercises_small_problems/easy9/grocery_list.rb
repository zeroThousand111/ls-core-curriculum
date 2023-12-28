=begin
______________________________________________________________________________
*****Understand the PROBLEM*****
______________________________________________________________________________
THE PROBLEM:

Write a method which takes a grocery list (array) of fruits with quantities and converts it into an array of the correct number of each fruit.

INPUT: A 2D nested array; each sub-array has two elements: 1 string, 1 integer.

OUTPUT: A 1D array of strings

RULES
EXPLICIT REQUIREMENTS:
  - 
  -
  -
  
IMPLICIT REQUIREMENTS:
  -
  -
  -

______________________________________________________________________________
*****EXAMPLES/TEST CASES*****
______________________________________________________________________________

buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]

______________________________________________________________________________
*****DATA STRUCTURES*****
______________________________________________________________________________

Arrays

______________________________________________________________________________
*****ALGORITHM*****
______________________________________________________________________________

1. Create a new empty array
2. Take the first sub-array of the input push the string element n times to new array, where n is the second element
3. Return the new array
4.
5.
______________________________________________________________________________

Now CODE with intent!
=end

# solution 1 - using two simple loops

# def buy_fruit(input_array)
#   output_array = []
  
#   element_index = 0
#   # iterate over each element_index of input_array
#   loop do 
    
#     # add element n times to output_array
#     num = 0
    
#     loop do 
#       output_array << input_array[element_index][0]
#       num += 1
#       break if num == input_array[element_index][1]
#     end
    
#     element_index += 1
#     break if element_index == input_array.size
#   end
#   output_array
# end

# -------------------

# solution 2 - using Array#each and Integer#times

def buy_fruit(input_array)
  output_array = []
  
  input_array.each do |sub_array|
    sub_array[1].times { |n| output_array << sub_array[0] }
  end
  
  output_array
end

# -------------------

# Print Tests
p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) 
# ["apples", "apples", "apples", "orange", "bananas","bananas"]

# Test Cases
p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]