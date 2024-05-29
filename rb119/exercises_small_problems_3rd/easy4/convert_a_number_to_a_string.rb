=begin
In the previous two exercises, you developed methods that convert simple numeric strings to signed Integers. In this exercise and the next, you're going to reverse those methods.

Write a method that takes a positive integer or zero, and converts it to a string representation.

You may not use any of the standard conversion methods available in Ruby, such as Integer#to_s, String(), Kernel#format, etc. Your method should do this the old-fashioned way and construct the string by analyzing and manipulating the number.

# Understand the Problem

## Reframe the problem
Its clear without reframing

## Inputs: a positive integer or zero
## Outputs: a numeric string version of the input integer
## Rules:
### Explicit requirements:
  - a method;
  - no standard conversion methods are allowed;
  - 
### Implicit requirements:
  - none
  
  
Examples

integer_to_string(4321) == '4321'
integer_to_string(0) == '0'
integer_to_string(5000) == '5000'

# Data Structures
Strings
Arrays maybe

# Algorithm

* CREATE a reversed Integer to character hash?
* CREATE an empty numerical string for output
* CONVERT the Integer to an array of digits
  + use the Integer#digits method
  + reverse the array of digits (because #digits reverses the returned array)
* MOVE through the array of digits
  + use #each
* BUILD the numerical string by adding each new value of the HASH from the input key integer
  + use the #<< method
* RETURN the built string
=end

HASH = {
  0 => '0',
  1 => '1',
  2 => '2',
  3 => '3',
  4 => '4',
  5 => '5',
  6 => '6',
  7 => '7',
  8 => '8',
  9 => '9',
}

def integer_to_string(integer)
  string = ""
  integer.digits.reverse.each do |num|
    string << HASH[num]
  end
  string
end

p integer_to_string(4321) == '4321'
p integer_to_string(0) == '0'
p integer_to_string(5000) == '5000'