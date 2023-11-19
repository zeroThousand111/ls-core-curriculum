=begin
PROBLEM
Write a method that determines and returns the ASCII string value of a string that is passed in as an argument. The ASCII string value is the sum of the ASCII values of every character in the string. (You may use String#ord to determine the ASCII value of a character.)

# TEST CASES
ascii_value('Four score') == 984
ascii_value('Launch School') == 1251
ascii_value('a') == 97
ascii_value('') == 0

# UNDERSTAND THE PROBLEM
INPUT: String
OUTPUT:Integer

RULES:
EXPLICIT REQUIREMENTS:
- Input is a string;
- ASCII String Value is the output;
- ASCII String Value is the total of every character in the string;
- Method is called `ascii_value` and takes one argument.

IMPLICIT REQUIREMENTS:
- The ASCII value is an Integer, capable of being summed;
- Output is an Integer;
- An empty string returns the integer 0
- 

# DATA STRUCTURES

Input is a string.  Output is an integer.

Interim structure will be an array of string characters.

# ALGORITHM

1. Create a sum_total variable with a value of zero;
2. Split the string into characters;
3. Loop over the array of string characters;
- 3a. Use String#ord to return the ASCII value for that character;
- 3b. Add that value to the sum_total value
4. When all characters have been looped over, return the sum_total.

=end

def ascii_value(string)
  sum_total = 0
  string.chars.each do |character|
    sum_total += character.ord
  end
  sum_total
end

# Print Tests
# p ascii_value('a') # 97
# p ascii_value('Four score') #984

# Test Cases
p ascii_value('Four score') == 984
p ascii_value('Launch School') == 1251
p ascii_value('a') == 97
p ascii_value('') == 0