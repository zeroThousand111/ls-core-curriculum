=begin
______________________________________________________________________________
*****Understand the PROBLEM*****
______________________________________________________________________________
THE PROBLEM:

Implement octal to decimal conversion. Given an octal input string, your program should produce a decimal output. Treat invalid input as octal 0. The only valid digits in an octal number are 0, 1, 2, 3, 4, 5, 6, and 7.

Note: Implement the conversion yourself. Don't use any built-in or library methods that perform the necessary conversions for you. In this exercise, the code necessary to perform the conversion is what we're looking for.

About Octal (Base-8)

Decimal is a base-10 system. A number 233 in base 10 notation can be understood as a linear combination of powers of 10:

The rightmost digit gets multiplied by 100 = 1
The next digit gets multiplied by 101 = 10
The digit after that gets multiplied by 102 = 100
The digit after that gets multiplied by 103 = 1000
...
The n*th* digit gets multiplied by 10n-1.
All of these values are then summed.

Thus:
  233 # decimal
= 2*10^2 + 3*10^1 + 3*10^0
= 2*100  + 3*10   + 3*1
Octal numbers are similar, but they use a base-8 system. A number 233 in base 8 can be understood as a linear combination of powers of 8:

The rightmost digit gets multiplied by 80 = 1
The next digit gets multiplied by 81 = 8
The digit after that gets multiplied by 82 = 64
The digit after that gets multiplied by 83 = 512

...

The n*th* digit gets multiplied by 8n-1.
All of these values are then summed.

Thus:

  233 # octal
= 2*8^2 + 3*8^1 + 3*8^0
= 2*64  + 3*8   + 3*1
= 128   + 24    + 3
= 155

For our program, the details we need to keep in mind are as follows:

- The way to convert octal numbers to decimal numbers is to use base-8 in multiplication.
- Going from right-to-left, we multiply each digit of the number by 8 raised to a certain power.
- For the first digit (from the right), the power is 0. For the second digit, the power is 1. This continues until we multiply each digit from the number.
- Valid octal numbers only include digits 0 through 7.

INPUT: a String, representing an octal (base 8) number

OUTPUT:

RULES
EXPLICIT REQUIREMENTS:
  - Methods:
    - Octal#initialize constructor
    - 
  - don't use any built in core ruby library conversion methods
  -
  
IMPLICIT REQUIREMENTS:
  - The method that performs the conversion to decimal is also responsible for validating the input.
  - The method should iterate through the number's digits from right-to-left and compute each digit as a power of base 8.
  -
______________________________________________________________________________
*****EXAMPLES/TEST CASES*****
______________________________________________________________________________

From the test cases shown above, we can see that we need to create an Octal class. The class should have 2 methods as follows:

- a constructor that accepts a string as an argument that represents an octal number.
- a method that converts the argument into decimal and returns it as a number.
- We should return 0 if the argument has invalid characters such as letters or the digits 8 or 9.
- We may also want to create some helper methods to assist us, but those are optional.

______________________________________________________________________________
*****DATA STRUCTURES*****
______________________________________________________________________________

From the test cases, we can see that we're dealing with numbers and strings. We may want to use a collection (such as an array) for helpful built-in methods.

______________________________________________________________________________
*****ALGORITHM*****
______________________________________________________________________________

constructor

- Accepts a string as an argument that represents an octal number.

Method: convert to decimal (Ruby: to_decimal; JavaScript: toDecimal)

- If any character of the string being converted is not 0, 1, 2, 3, 4, 5, 6, or 7, return 0.
- Set a starting sum to 0.
- Reverse the digits.
- Iterate over digits one-by-one.
- For the first digit, multiply it by 8**0, then add it to sum.
- For the second digit, multiply it by 8**1, then add it to sum.
- Keep multiplying and adding to sum until all digits are processed.
- Return the sum.
______________________________________________________________________________

Now CODE with intent!
=end

require 'pry'
require 'pry-byebug'

# solution 1 - initial first draft

# class Octal
#   def initialize(string)
#     @string = string
#   end

#   def to_decimal
#     # validate and prepare
#     sum = 0
#     array_of_octals = @string.chars.map { |char| char.to_i}.reverse
#     return sum if @string.match?(/[^0-7]/)
#     # return sum if invalid_input?(array_of_octals)
#     # sum each index in turn
#     array_of_octals.each_with_index do |digit, index|
#       sum += digit * 8 ** index
#     end
#     sum
#   end

#   # def invalid_input?(array_of_octals)
#   #   array_of_octals.include?(8) || array_of_octals.include?(9)
#   # end
# end

# -------------------

# solution 2 - refactor

class Octal
  def initialize(string)
    @string = string
  end

  def to_decimal
    sum = 0
    return sum if @string.match?(/[^0-7]/)
    array_of_octals = @string.chars.map(&:to_i).reverse

    array_of_octals.each_with_index do |digit, index|
      sum += (digit * (8**index))
    end

    sum
  end
end

# -------------------

# solution 3 -

# -------------------

# solution 4 -

# -------------------

# solution 5 -

# -------------------

# Print Tests

# Test Cases
