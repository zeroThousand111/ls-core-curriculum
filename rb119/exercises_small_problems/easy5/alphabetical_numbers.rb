=begin
______________________________________________________________________________
*****Understand the PROBLEM*****
______________________________________________________________________________
THE PROBLEM:

Write a method that takes an Array of Integers between 0 and 19, and returns an Array of those Integers sorted based on the English words for each number:

zero, one, two, three, four, five, six, seven, eight, nine, ten, eleven, twelve, thirteen, fourteen, fifteen, sixteen, seventeen, eighteen, nineteen

INPUT: An array of Integers

OUTPUT: An array of the same Integers, sorted according to alphabetical spelling

RULES
EXPLICIT REQUIREMENTS:
  - A method;
  -
  -
  
IMPLICIT REQUIREMENTS:
  - A new array, rather than a mutated argument
  -
  -

______________________________________________________________________________
*****EXAMPLES/TEST CASES*****
______________________________________________________________________________

alphabetic_number_sort((0..19).to_a) == [
  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0
]

______________________________________________________________________________
*****DATA STRUCTURES*****
______________________________________________________________________________
Arrays, maybe hashes
______________________________________________________________________________
*****ALGORITHM*****
______________________________________________________________________________

1.CONVERT the input array of numbers to a new array of alphabetical numbers i.e. an array of strings
  a.Create a Hash of key-value pairs that are the numbers and matching numerical string e.g. 0 => 'zero', 1 => 'one', etc
    i. ALPHABETICAL_NUMBERS = {}
  b.Iterate or Map 
    i.array_of_strings = input_array.map { |n| ALPHABETICAL_NUMBERS[n]}
2.SORT the array of alphabetical numbers by alphabetical order
  a.
    i. alphabetical_numbers.sort
3.CONVERT the array of alpabetical numbers back to an array of numbers
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

ALPHABETICAL_NUMBERS = {
  0 => 'zero',
  1 => 'one',
  2 => 'two',
  3 => 'three',
  4 => 'four',
  5 => 'five',
  6 => 'six',
  7 => 'seven',
  8 => 'eight',
  9 => 'nine',
  10 => 'ten',
  11 => 'eleven',
  12 => 'twelve',
  13 => 'thirteen',
  14 => 'fourteen',
  15 => 'fifteen',
  16 => 'sixteen',
  17 => 'seventeen',
  18 => 'eighteen',
  19 => 'nineteen',
}

# solution 1 - Long hand first with each step on each line

# def alphabetic_number_sort(input_array)
#   array_of_strings = input_array.map { |n| ALPHABETICAL_NUMBERS[n]}
#   sorted_string_array = array_of_strings.sort
#   sorted_number_array = sorted_string_array.map { |n| ALPHABETICAL_NUMBERS.key(n)}
#   sorted_number_array
# end

# -------------------

# solution 2 - as solution 1 but refactored

def alphabetic_number_sort(input_array)
  sorted_string_array = input_array.map { |n| ALPHABETICAL_NUMBERS[n]}.sort
  sorted_string_array.map { |n| ALPHABETICAL_NUMBERS.key(n)}
end

# -------------------

# solution 3 - official LS solution

NUMBER_WORDS = %w(zero one two three four
                  five six seven eight nine
                  ten eleven twelve thirteen fourteen
                  fifteen sixteen seventeen eighteen nineteen)

def alphabetic_number_sort(numbers)
  numbers.sort_by { |number| NUMBER_WORDS[number] }
end

# -------------------

# solution 4 - 

# -------------------

# solution 5 - 

# -------------------

# Print Tests
p alphabetic_number_sort([0, 3, 2, 1])
p alphabetic_number_sort((0..19).to_a)

# Test Cases
p alphabetic_number_sort((0..19).to_a) == [
  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0
]