=begin
________________________________________________________________________________
*****Problem*****

Write a method that takes an Array of Integers between 0 and 19, and returns an Array of those Integers sorted based on the English words for each number:

zero, one, two, three, four, five, six, seven, eight, nine, ten, eleven, twelve, thirteen, fourteen, fifteen, sixteen, seventeen, eighteen, nineteen

Examples:
________________________________________________________________________________
Input:
  # What is the form of the data you want to transform?
  
  An array of consecutive Integers from zero to 19
  
Output: 
  # What is the form of the data you want the program to either return or print?
  
  An array of Integers sorted according to their alphabetical order when written in English
  
Explicit reqs:
  # What does the problem say about what you should do?
  - Write a method;
  - The input is always an array of Integers from zero to 19;
  - Sort according to the English spelling of each number;
  
Implicit reqs:
  # What does the problem NOT say about what you need to have covered?
  - 
________________________________________________________________________________
*****Examples/Test cases*****
________________________________________________________________________________
Test cases:
  # What are some examples of expected outputs for a given input? Be thorough
  
  alphabetic_number_sort((0..19).to_a) == [
  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0
  ]
________________________________________________________________________________
*****Data structures*****

Arrays: input and output

________________________________________________________________________________
Data manipulation strategy:
  # What forms do your data take on while the program is running?
  
  An array sorted consecutively in order of number is then sorted according to the alphabetic order in which the elements are spelled in English
  
  A helper hash linking each Integer with the String equivalent spelled in English
________________________________________________________________________________
*****Algorithm*****
________________________________________________________________________________
Step-by-step process (plaintext or pseudocode):
  # The logical process by which you intend to tackle the problem at hand
  
  High Level
  1. Create a translation dictionary hash between Integers and their corresponding English names;
  2. Create a new list of alphabetic numbers that matches the input list of Integers;
  3. Sort this alpabetic list alphabetically
  4. Create a new list of numbers in the same order as the alphabetic list and return it.
  
  
  2. Make a list of names in alpabetic order
    a. Make a list of the Integer names;
    b. Sort the list of names into alphabetical order;
  3. Make a list of Integers in the same order as the list of alphabetical names (e.g. zero 0 will be last on the list)
  4. Make a blank list of items the length of the input array
  5. Overwrite the item on the blank list at the index order of the Integer in the sorted list of names
  e.g. `0` is 19th/last.
  6. Return the now no longer blank list.
  
  For example:
  [0] is the element
  - What is the name of that element in the DICTIONARY? "zero"
  - What order is the name in the list of names? 19th
  - Therefore the value of the 19th element in the blank list is 0.
  
________________________________________________________________________________
Time to code!
=end

# solution 1: Long version

# 1. Create a DICTIONARY hash of key-value pairs

DICTIONARY = {
  0 => "zero",
  1 => "one",
  2 => "two",
  3 => "three",
  4 => "four",
  5 => "five",
  6 => "six",
  7 => "seven",
  8 => "eight",
  9 => "nine",
  10 => "ten",
  11 => "eleven",
  12 => "twelve",
  13 => "thirteen",
  14 => "fourteen",
  15 => "fifteen",
  16 => "sixteen",
  17 => "seventeen",
  18 => "eighteen",
  19 => "nineteen",
}

# def alphabetic_number_sort(input_array)
#   # 2. Create a new list of alphabetic numbers that matches the input list of Integers;
#   alphabetic_array = input_array.map do |num|
#     DICTIONARY[num]
#   end
  
#   # 3. Sort this alpabetic list alphabetically
  
#   sorted_array = alphabetic_array.sort
  
#   # 4. Create a new list of numbers in the same order as the alphabetic list and return it.
  
#   sorted_numbers_array = sorted_array.map do |word|
#     DICTIONARY.key(word)
#   end
# end

# solution 2: refactored to be shorter
def alphabetic_number_sort(input_array)
  alphabetic_array_sorted = input_array.map { |num| DICTIONARY[num] }.sort
  
  alphabetic_array_sorted.map { |word|DICTIONARY.key(word) }
end


# solution 3: Official LS solution using #sort_by

# NUMBER_WORDS = %w(zero one two three four
#                   five six seven eight nine
#                   ten eleven twelve thirteen fourteen
#                   fifteen sixteen seventeen eighteen nineteen)

# def alphabetic_number_sort(numbers)
#   numbers.sort_by { |number| NUMBER_WORDS[number] }
# end

# print tests
p alphabetic_number_sort((0..2).to_a) 
# [1, 2, 0]
p alphabetic_number_sort((0..4).to_a)
# [5, 4, 1, 3, 2, 0]
p alphabetic_number_sort((0..19).to_a)
# [8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,6, 16, 10, 13, 3, 12, 2, 0]
  
# truth test
p alphabetic_number_sort((0..19).to_a) == [8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17, 6, 16, 10, 13, 3, 12, 2, 0]