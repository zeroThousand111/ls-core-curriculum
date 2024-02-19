=begin
______________________________________________________________________________
*****Understand the PROBLEM*****
______________________________________________________________________________
THE PROBLEM:

Write a method that determines and returns the ASCII string value of a string that is passed in as an argument. The ASCII string value is the sum of the ASCII values of every character in the string. (You may use String#ord to determine the ASCII value of a character.)

INPUT:

OUTPUT:

RULES
EXPLICIT REQUIREMENTS:
  - may use String#ord
  - The ASCII string value is the sum of the ASCII values of every character in the string
  -
  
IMPLICIT REQUIREMENTS:
  -
  -
  -

______________________________________________________________________________
*****EXAMPLES/TEST CASES*****
______________________________________________________________________________

ascii_value('Four score') == 984
ascii_value('Launch School') == 1251
ascii_value('a') == 97
ascii_value('') == 0
______________________________________________________________________________
*****DATA STRUCTURES*****
______________________________________________________________________________

Strings or Arrays
______________________________________________________________________________
*****ALGORITHM*****
______________________________________________________________________________

1. CREATE a total value
  a. Starts with zero
    i. ascii_sum = 0
2. DETERMINE the ASCII value of each character in the string
  a.Loop through the index numbers of the string; OR
  b.Turn the string into an array of characters and iterate through that; THEN
  c.Calculate the 
    i.
3. RETURN the sum of ASCII values
  a.
    i.
4.
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

# solution 1 - Loop through the string

def ascii_value(string)
  ascii_total = 0
  index = 0
  
  loop do 
    break if index == string.length
    ascii_total += string[index].ord
    index += 1
  end
  ascii_total
end

# -------------------

# solution 2 - Iterate through an array of characters

def ascii_value(string)
  ascii_total = 0
  array_of_characters = string.chars
  
  array_of_characters.each do |char|
    ascii_total += char.ord
  end
  
  ascii_total
end

# -------------------

# solution 3 - Use #map to create an array of ascii values then sum them

def ascii_value(string)
  array_of_characters = string.chars
  
  array_of_characters.map do |char|
    char.ord
  end.sum

end

# -------------------

# solution 4 - Use a FOR loop

def ascii_value(string)
  array_of_characters = string.chars
  ascii_total = 0
  
  for char in array_of_characters do
    ascii_total +=char.ord
  end
  ascii_total
end

# -------------------

# solution 5 - Official LS solution

def ascii_value(string)
  sum = 0
  string.each_char { |char| sum += char.ord }
  sum
end

# -------------------

# solution 6 - Further Exploration

# the mystery method is Integer#chr.  It is kind of the reverse of String#ord

def further(char)
  char.ord.chr == char
end

# -------------------

# Print Tests
p further('a')

# Test Cases
# p ascii_value('Four score') == 984
# p ascii_value('Launch School') == 1251
# p ascii_value('a') == 97
# p ascii_value('') == 0