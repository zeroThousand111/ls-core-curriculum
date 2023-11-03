=begin
The String#to_i method converts a string of numeric characters (including an optional plus or minus sign) to an Integer. String#to_i and the Integer constructor (Integer()) behave similarly. In this exercise, you will create a method that does the same thing.

Write a method that takes a String of digits, and returns the appropriate number as an integer. You may not use any of the methods mentioned above.

For now, do not worry about leading + or - signs, nor should you worry about invalid characters; assume all characters will be numeric.

You may not use any of the standard conversion methods available in Ruby to convert a string to a number, such as String#to_i, Integer(), etc. Your method should do this the old-fashioned way and calculate the result by analyzing the characters in the string.
=end

CONVERSION = {
  "1" => 1,
  "2" => 2,
  "3" => 3,
  "4" => 4,
  "5" => 5,
  "6" => 6,
  "7" => 7,
  "8" => 8,
  "9" => 9,
  "0" => 0
}

def string_to_integer(string)
  # split string into characters
  array_of_strings = string.chars
  # convert array of string characters into an array of integers
  array_of_integers = array_of_strings.map { |e| CONVERSION[e] }
  # Convert each element into a number with the right place value and sum
  number = 0
  indices = array_of_integers.length - 1
  array_of_integers.each do |e| 
    number += (e * (10 ** indices))
    indices -= 1
  end
  # return the total
  number
end

# print tests
# p string_to_integer('4321') # 4321

# examples/truth tests
p string_to_integer('4321') == 4321
p string_to_integer('570') == 570
