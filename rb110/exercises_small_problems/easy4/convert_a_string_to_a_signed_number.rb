=begin
In the previous exercise, you developed a method that converts simple numeric strings to Integers. In this exercise, you're going to extend that method to work with signed numbers.

Write a method that takes a String of digits, and returns the appropriate number as an integer. The String may have a leading + or - sign; if the first character is a +, your method should return a positive number; if it is a -, your method should return a negative number. If no sign is given, you should return a positive number.

You may assume the string will always contain a valid number.

You may not use any of the standard conversion methods available in Ruby, such as String#to_i, Integer(), etc. You may, however, use the string_to_integer method from the previous lesson.
=end

# examples
# string_to_signed_integer('4321') == 4321
# string_to_signed_integer('-570') == -570
# string_to_signed_integer('+100') == 100

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

def string_to_signed_integer(string)
  if string[0] == '-'
    # remove sign destructively
    string[0] = '0'
    # use former method string_to_integer
    result = string_to_integer(string)
    # turn result into negative value
    result = result - (result * 2)
  elsif string[0] == '+'
    # remove sign destructively
    string[0] = '0'
    # use former method string_to_integer
    result = string_to_integer(string)
  else
    return string_to_integer(string)
  end 
  result
end


# print tests
p string_to_signed_integer('4321') # 4321
p string_to_signed_integer('-570') # -570
p string_to_signed_integer('+100') # 100

# examples/truth tests
p string_to_signed_integer('4321') == 4321
p string_to_signed_integer('-570') == -570
p string_to_signed_integer('+100') == 100