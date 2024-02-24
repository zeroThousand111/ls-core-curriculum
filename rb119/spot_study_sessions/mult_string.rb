=begin
______________________________________________________________________________
*****Understand the PROBLEM*****
______________________________________________________________________________
THE PROBLEM:

Given a string, multiply each letter by the most recent preceding number in the string. Return a new string containing only the letters, multiplied by their preceding number.

INPUT: a string containing both numbers and letters

OUTPUT: A longer string containing just letters

RULES
EXPLICIT REQUIREMENTS:
  - The output string is made up multiple copies of each letter in the input
  - The multiplier of each letter is the most recent number in the string
  -
  -
  
IMPLICIT REQUIREMENTS:
  -
  -
  -

______________________________________________________________________________
*****EXAMPLES/TEST CASES*****
______________________________________________________________________________

p mult_string('3abc') == 'aaabbbccc'

p mult_string('123abc') == 'aaabbbccc'

p mult_string('2g4ab13t0gh') == 'ggaaaabbbbttt'

p mult_string('1a5b20hi3cw') == 'abbbbbcccwww'

______________________________________________________________________________
*****DATA STRUCTURES*****
______________________________________________________________________________

______________________________________________________________________________
*****ALGORITHM*****
______________________________________________________________________________
1. Requirement — The important, generalized steps required to navigate from the input to the desired output.
  a. Approach — The process that will be utilized to accomplish each Requirement.
    i. Procedure — Specific details to implement the Approach.


1.CREATE a multiplier variable and set the value to zero
  a.
    i.
2.CREATE an empty new string
  a.
    i.
3.CHECK each character in the string
  a.IF the character is a number, then set the multiplier variable to that number
  b.IF the character is a letter then shovel multiple copies of the letter to the new string
    i. new_string << letter * multiplier
4.RETURN the new string
  a.
    i.
5.
  a.
    i.
______________________________________________________________________________

Now CODE with intent!
=end

require 'pry'
require 'pry-byebug'

# solution 1 - using a simple loop to iterate through the string and build new string

def mult_string(string)
  multiplier = 1
  new_string = ""
  
  index = 0
  
  loop do
    if string[index].match?(/[0-9]/)
      multiplier = string[index].to_i
    else
      new_string << string[index] * multiplier
    end
    index += 1
    break if index == string.length
  end
  new_string
end

# -------------------

# solution 2 - Use String#each_char

# def mult_string(string)
#   multiplier = 1
#   new_string = ""
  
#   string.each_char do |char|
#     if char.match?(/[0-9]/)
#       multiplier = char.to_i
#     else
#       new_string << char * multiplier
#     end
#   end

#   new_string
# end

# -------------------

# solution 3 - Using an Array of strings to iterate through

def mult_string(string)
  multiplier = 1
  new_string = ""
  array_of_chars = string.chars
  
  array_of_chars.each do |char|
    if char.match?(/[0-9]/)
      multiplier = char.to_i
    else
      new_string << char * multiplier
    end
  end

  new_string
end

# -------------------

# solution 4 - 

# -------------------

# solution 5 - 

# -------------------

# Print Tests
# p mult_string('3abc')        # 'aaabbbccc'
# p mult_string('123abc')      # 'aaabbbccc'
# p mult_string('2g4ab13t0gh') # 'ggaaaabbbbttt'
# p mult_string('1a5b20hi3cw') # 'abbbbbcccwww'

# Test Cases
p mult_string('3abc') == 'aaabbbccc'
p mult_string('123abc') == 'aaabbbccc'
p mult_string('2g4ab13t0gh') == 'ggaaaabbbbttt'
p mult_string('1a5b20hi3cw') == 'abbbbbcccwww'