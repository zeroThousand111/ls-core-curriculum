=begin
In the previous two exercises, you developed methods that convert simple numeric strings to signed Integers. In this exercise and the next, you're going to reverse those methods.

Write a method that takes a positive integer or zero, and converts it to a string representation.

You may not use any of the standard conversion methods available in Ruby, such as Integer#to_s, String(), Kernel#format, etc. Your method should do this the old-fashioned way and construct the string by analyzing and manipulating the number.

Examples
integer_to_string(4321) == '4321'
integer_to_string(0) == '0'
integer_to_string(5000) == '5000'

---

PROBLEM
Input: An Integer
Output: A string
Rules:
Explict requirements:
  - The input Integer will be positive or zero
  - Ruby core library conversion methods are not allowed
  - 
Implicit requirements:
  - There won't be an input of a non-Integer class
  - There won't be any negative Integer input
  - The Integer could be of any length including one digit
  - 

DATA STRUCTURES

- Input is an Integer
- Output is a String
- A conversion Hash might be needed, as in previous two exercises
- An Array as a way of storing digits in the correct order

ALGORITHM
(this is implemented by the main method `integer_to_string`)

1. Turn the input Integer into an Array of single digits (see sub-algorithm)
2. Convert the Array elements into string characters using a conversion Hash and array element assignment (see sub-algorithm)
3. Join the Array elements into a string using Array#join (is this allowed?)

SUB-ALGORITHM | TURNING A NUMBER INTO AN ARRAY OF SINGLE DIGITS
(this is implemented by the helper method `create_array`)

1. Create an empty array
2. Measure length of Integer?
3. 

Or use Array#digits and reverse the order with Array#reverse!
i.e. num.digits.reverse

=end

CONVERSION = {
  1 => "1",
  2 => "2",
  3 => "3",
  4 => "4",
  5 => "5",
  6 => "6",
  7 => "7",
  8 => "8",
  9 => "9",
  0 => "0"
}

def integer_to_string(num)
  array = create_array(num)
  array.join
end

def create_array(num)
  num.digits.reverse
end

def value_at_position(num, position, base=10)
  (num % (base**position))/(base**(position-1))
end



# print tests
p integer_to_string(4321) # '4321'

# test cases
# p integer_to_string(4321) == '4321'
# p integer_to_string(0) == '0'
# p integer_to_string(5000) == '5000'