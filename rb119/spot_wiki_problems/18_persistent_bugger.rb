=begin
18. Persistent Bugger.
(​https://www.codewars.com/kata/55bf01e5a717a0d57e0000ec/train/ruby​)
6 kyu

Write a function, persistence, that takes in a positive parameter num and returns its multiplicative persistence, which is the number of times you must multiply the digits in num until you reach a single digit.

# UNDERSTAND THE PROBLEM
## INPUT: an Integer, always positive
## OUTPUT: an integer, the number of times needed to multiply the digits before you reach a single digit
## RULES
### Explicit requirements:
  - a method:
  - called persistence
  - stop when you reach a single digit
### Implicit requirements:
  - multiply the input digits
  - then multiply the digits of the product of the above
  - repeat until you get a single digit


# EXAMPLES:

For example:
persistence(39) # returns 3, because 3*9=27, 2*7=14, 1*4=4 # and 4 has only one digit
persistence(999) # returns 4, because 9*9*9=729, 7*2*9=126, # 1*2*6=12, and finally 1*2=2
persistence(4) # returns 0, because 4 is already a one-digit number

# DATA STRUCTURES
An array of the digits

# ALGORITHM

* CREATE an array of the digits, e.g. 39 => [3, 9]
  + use Integer#digits (no reverse needed)
  + 
* CREATE a count local variable
    - count = 0
* MULTIPLY the digits in the array and reassign the result to `num`
  + use #reduce
    - num = array_of_digits.reduce(&:*)
* RETURN count, if array size is 1
* 
=end

def persistence(num)
  count = 0
  array_of_digits = num.digits
  until array_of_digits.size == 1
    return count if array_of_digits.size == 1
    num = array_of_digits.reduce(&:*)
    count += 1
    array_of_digits = num.digits
  end
  count
end


p persistence(39) == 3 
p persistence(4) == 0
p persistence(25) == 2 
p persistence(999) == 4
