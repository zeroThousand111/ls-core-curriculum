=begin
______________________________________________________________________________
*****Understand the PROBLEM*****
______________________________________________________________________________
THE PROBLEM:

A double number is a number with an even number of digits whose left-side digits are exactly the same as its right-side digits. For example, 44, 3333, 103103, 7676 are all double numbers. 444, 334433, and 107 are not.

Write a method that returns 2 times the number provided as an argument, unless the argument is a double number; double numbers should be returned as-is.

INPUT: An integer

OUTPUT: An integer

RULES
EXPLICIT REQUIREMENTS:
  - Return double the number, unless the argument is a double number.
  -
  -
  
IMPLICIT REQUIREMENTS:
  - Only integers; no floats.
  - No empty arguments
  - Underscores may be present (but Ruby ignores them anyway)
  - A double number is an even number, all odd numbers are not double numbers

______________________________________________________________________________
*****EXAMPLES/TEST CASES*****
______________________________________________________________________________

twice(37) == 74
twice(44) == 44
twice(334433) == 668866
twice(444) == 888
twice(107) == 214
twice(103103) == 103103
twice(3333) == 3333
twice(7676) == 7676
twice(123_456_789_123_456_789) == 123_456_789_123_456_789
twice(5) == 10
______________________________________________________________________________
*****DATA STRUCTURES*****
______________________________________________________________________________

Arrays
______________________________________________________________________________
*****ALGORITHM*****
______________________________________________________________________________

1. Create an array of digits from the input_number
2. Check for double number: if the array is the same as array.reverse, it is a double number
3. Return input_number * 2 or self, if double number

______________________________________________________________________________

Now CODE with intent!
=end

# solution 1 - using conditional if statement

def twice(input_number)
  if input_number.digits.size.even?
    half = input_number.digits.size / 2
    first = input_number.digits[0..(half - 1)]
    last = input_number.digits[half..-1]
    if first == last
      return input_number
    else
      return (input_number * 2)
    end
  else
    return (input_number * 2)
  end
end

# solution 2 - 

# Print Tests
# p twice(334433) # 668866
# p twice(444) #888
# p twice(103103) # 103103
# p twice(3333) # 3333
# p twice(123_456_789_123_456_789) # 123_456_789_123_456_789

# Test Cases
p twice(37) == 74
p twice(44) == 44
p twice(334433) == 668866
p twice(444) == 888
p twice(107) == 214
p twice(103103) == 103103
p twice(3333) == 3333
p twice(7676) == 7676
p twice(123_456_789_123_456_789) == 123_456_789_123_456_789
p twice(5) == 10