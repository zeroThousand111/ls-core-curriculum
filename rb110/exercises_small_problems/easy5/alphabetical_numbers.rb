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
  - The input is always an array of consecutive Integers from zero to 19;
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
  1. Create a translation dictionary between Integers and their corresponding English names;
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
}

def alphabetic_number_sort(input_array)
  # 2. create a list of Integer names and sort them alphabetically
  sorted_names_array = DICTIONARY.values.sort
  
  # 3. create a corresponding list of numbers in that same order
  sorted_integers_array = sorted_names_array.map do |name|
                              DICTIONARY.key(name)
                            end
                            
  # 4. create a blank list as long as the input_array
  p blank_list = Array.new(input_array.length)
  
  # 5. For EACH item of the input_array, overwrite the item on the blank list at the index order of the Integer in the sorted list of names
  
  input_array.each do |i|
    blank_list[sorted_integers_array.index(i)] = i
  end
  # 6. Return the completed list
  blank_list
end

# print test
p alphabetic_number_sort((0..2).to_a)
# p alphabetic_number_sort((0..4).to_a)
# [5, 4, 1, 3, 2, 0]
# p alphabetic_number_sort((0..19).to_a)
# [8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,6, 16, 10, 13, 3, 12, 2, 0]
  
# truth test
# p alphabetic_number_sort((0..19).to_a) == [8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17, 6, 16, 10, 13, 3, 12, 2, 0]