=begin
______________________________________________________________________________
*****Understand the PROBLEM*****
______________________________________________________________________________
THE PROBLEM:

Write a method that takes a string as an argument and returns a new string in which every uppercase letter is replaced by its lowercase version, and every lowercase letter by its uppercase version. All other characters should be unchanged.

INPUT: A string

OUTPUT: A NEW string

RULES
EXPLICIT REQUIREMENTS:
  - A method;
  - Return a NEW string;
  - Replace every uppercase with lowercase and vica versa.
  
IMPLICIT REQUIREMENTS:
  - Non-letters and spaces remain the same
  - 
  -

______________________________________________________________________________
*****EXAMPLES/TEST CASES*****
______________________________________________________________________________

swapcase('CamelCase') == 'cAMELcASE'
swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'
______________________________________________________________________________
*****DATA STRUCTURES*****
______________________________________________________________________________

An interim array of characters for the input string
______________________________________________________________________________
*****ALGORITHM*****
______________________________________________________________________________

1. Create an array of uppercase letters and another of lower case letters;
2. Create an array of letters from the input string;
3. Create an new array for the output string;
4. Iterate through the array of input characters:
  a. If the character matches (#include?) a letter in the CAPS array, downcase it and put it in the output array;
  b. If the character matches (#include?) a letter in the LOWS array, upcase it and put it in the output array;
  c. If the character does not match in the CAPS or LOWS array, leave it alone and put it in the output array.
5. Join and return the new output array.
______________________________________________________________________________

Now CODE with intent!
=end

# solution 1 - helper method and simple loop

# CAPS = ('A'..'Z').to_a
# LOWS = ('a'..'z').to_a

# def letter_id(char)
#   if CAPS.include?(char)
#     return char.downcase
#   elsif LOWS.include?(char)
#     return char.upcase
#   else 
#     return char
#   end
# end

# def swapcase(input)
#   input_array = input.chars
#   output_array = []
  
#   counter = 0
#   loop do
#     output_array << letter_id(input_array[counter])
#     counter += 1
#     break if counter == input_array.size
#   end
#   output_array.join
# end

# solution 2 - helper method and iterate with #each 

# CAPS = ('A'..'Z').to_a
# LOWS = ('a'..'z').to_a

# def letter_id(char)
#   if CAPS.include?(char)
#     return char.downcase
#   elsif LOWS.include?(char)
#     return char.upcase
#   else 
#     return char
#   end
# end

# def swapcase(input)
#   output_array = []
  
#   input.chars.each do |char|
#     output_array << letter_id(char)
#   end
  
#   output_array.join
# end

# solution 3 - using #map to create the output array

# CAPS = ('A'..'Z').to_a
# LOWS = ('a'..'z').to_a

# def letter_id(char)
#   if CAPS.include?(char)
#     return char.downcase
#   elsif LOWS.include?(char)
#     return char.upcase
#   else 
#     return char
#   end
# end

# def swapcase(input)
#   input.chars.map { |char|letter_id(char) }.join
# end

# solution 4 - official LS solution using Regex

def swapcase(string)
  characters = string.chars.map do |char|
    if char =~ /[a-z]/
      char.upcase
    elsif char =~ /[A-Z]/
      char.downcase
    else
      char
    end
  end
  characters.join
end

# Print Tests
p swapcase('Tonight on XYZ-TV') #'tONIGHT ON xyz-tv'

# Test Cases

p swapcase('CamelCase') == 'cAMELcASE'
p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'