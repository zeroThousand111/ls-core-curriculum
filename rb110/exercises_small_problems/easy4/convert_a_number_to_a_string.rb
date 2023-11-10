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
Output: A String
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
- A conversion Hash might be needed, as in the previous two exercises
- An Array as a way of storing digits in the correct order

ALGORITHM
(this is implemented by the main method `integer_to_string`)

1. Turn the input Integer into an Array of single digits (see sub-algorithm)
2. Convert the Array elements into string characters using a conversion Hash and array element assignment (see sub-algorithm)
3. Join the Array elements into a string 

SUB-ALGORITHM | TURNING A NUMBER INTO AN ARRAY OF SINGLE DIGITS
(this is implemented by the helper method `create_array`)

1. Create an empty array
2. Measure length of Integer?
3. Calculate value at each position of Integer

Or use Array#digits and reverse the order with Array#reverse!
i.e. num.digits.reverse

SUB-ALGORITHM | TURNING AN ARRAY OF STRINGS INTO A MERGED STRING OBJECT

1. Measure length of array
2. Create empty string
3. Concatenate empty string with first string object in array
4. Concatenate next string object into main string
5. Repeat for all objects in array of strings

Or use Array#join (is this allowed?)

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
  array_of_numbers = create_array(num)
  array_of_strings = convert_numbers_to_strings(array_of_numbers)
  join_array_of_strings(array_of_strings)
end

def create_array(num)
  # num.digits.reverse
  array = []
  counter = num.to_s.length # is this allowed?
  loop do
    array << value_at_position(num, counter)
    counter -= 1
    break if counter == 0
  end
  array
end

def value_at_position(num, position)
  (num % (10**position))/(10**(position-1))
end

def convert_numbers_to_strings(array)
  array.map { |num| CONVERSION[num] }
end

def join_array_of_strings(array)
  counter = 0
  string = ""
  loop do
    string += array[counter]
    counter += 1
    break if counter == array.length
  end
  string
end

# print tests
# p integer_to_string(4321) # '4321'

# p value_at_position(99199, 3) # 1

# p create_array(4321) # [4, 3, 2, 1]

# p join_array_of_strings(["4", "3", "2", "1"]) # "4321"

# test cases
p integer_to_string(4321) == '4321'
p integer_to_string(0) == '0'
p integer_to_string(5000) == '5000'