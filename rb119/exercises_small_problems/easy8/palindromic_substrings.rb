=begin
______________________________________________________________________________
*****Understand the PROBLEM*****
______________________________________________________________________________
THE PROBLEM:

Write a method that returns a list of all substrings of a string that are palindromic. That is, each substring must consist of the same sequence of characters forwards as it does backwards. The return value should be arranged in the same sequence as the substrings appear in the string. Duplicate palindromes should be included multiple times.

You may (and should) use the substrings method you wrote in the previous exercise.

For the purposes of this exercise, you should consider all characters and pay attention to case; that is, "AbcbA" is a palindrome, but neither "Abcba" nor "Abc-bA" are. In addition, assume that single characters are not palindromes.

FURTHER EXPLORATION:

Can you modify this method (and/or its predecessors) to ignore non-alphanumeric characters and case? Alphanumeric characters are alphabetic characters(upper and lowercase) and digits.

INPUT: A string

OUTPUT: An array of palindromic substrings

RULES
EXPLICIT REQUIREMENTS:
  - a palindrome is when a substring has the same sequence of characters forwards as it does backwards
  - in this exercise, case matters; "Abcba" is not a palindrome here
  - single characters are not palindromes
  - the return array should order the palindromic substrings in the order that they appear in the string
  
IMPLICIT REQUIREMENTS:
  - an empty array is the appropriate return for a string with no palindromic substrings
  -
  -

______________________________________________________________________________
*****EXAMPLES/TEST CASES*****
______________________________________________________________________________

palindromes('abcd') == []
palindromes('madam') == ['madam', 'ada']
palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]

______________________________________________________________________________
*****DATA STRUCTURES*****
______________________________________________________________________________

Arrays
______________________________________________________________________________
*****ALGORITHM*****
______________________________________________________________________________
1. Requirement — The important, generalized steps required to navigate from the input to the desired output.
  a. Approach — The process that will be utilized to accomplish each Requirement.
    i. Procedure — Specific details to implement the Approach.


1.CREATE an array of ALL possible substrings from the input string
  a.Use the solution to the previous exercise
    i.all_substrings 
2.CREATE an empty array of palindromic substrings
  a. palindromic_substrings
    i.
3.EXAMINE each substring in all_substrings
  a.Use a simple loop to loop through the array
  b.Use #each to iterate
    i.
4.DETERMINE if each substring is palindromic and, if yes, copy to array of palindromic substrings
  a.This is case sensitive
  b.A palindrome is a substring that reads the same forwards or backwards AND is not 1 character in length
    i.substring == substring.reverse && substring.size != 1
  c.Copy to new array
    i. Array#<<
    ii.Array#push
5.STOP after all possible substrings checked
6.RETURN array of palindromic substrings
  a.
    i.
______________________________________________________________________________

Now CODE with intent!
=end

require 'pry'
require 'pry-byebug'

# def leading_substrings(string)
#   string.chars.map.with_index { |char, index| string[0, index + 1] }
# end

# def substrings(string)
#   array = []
#   0.upto(string.length) do |start_index|
#     array.push(leading_substrings(string[start_index..-1]))
#   end
#   array.flatten
# end

# solution 1 - Using a simple loop to iterate

# def palindromes(string)
#   all_substrings = substrings(string)
#   palindromic_substrings = []
  
#   index = 0
#   loop do
#     # binding.pry
#     palindromic_substrings << all_substrings[index] if all_substrings[index] == all_substrings[index].reverse && all_substrings[index].length != 1
#     index += 1
#     break if index == all_substrings.size
#   end
#   palindromic_substrings
# end

# -------------------

# solution 2 - Using #each to iterate

# def palindromes(string)
#   all_substrings = substrings(string)
#   palindromic_substrings = []
  
#   all_substrings.each do |sub|
#     palindromic_substrings << sub if sub == sub.reverse && sub.length != 1
#   end
  
#   palindromic_substrings
# end

# -------------------

# solution 3 - Using #select to filter the all_substrings array

# def palindromes(string)
#   all_substrings = substrings(string)
#   all_substrings.select { |sub| sub == sub.reverse && sub.length != 1 }
# end

# -------------------

# solution 4 - Refactor 3 to make smart-ass one liner

# def palindromes(string)
#   substrings(string).select { |sub| sub == sub.reverse && sub.length != 1 }
# end

# -------------------

# solution 5 - FURTHER EXPLORATION - remove non-alphanumeric characters at the beginning using String#delete and character selectors

def leading_substrings(string)
  new_string = string.delete('^A-Za-z0-9')
  new_string.chars.map.with_index { |char, index| string[0, index + 1] }
end

def substrings(string)
  array = []
  0.upto(string.length) do |start_index|
    array.push(leading_substrings(string[start_index..-1]))
  end
  array.flatten
end

def palindromes_fe(string)
  substrings(string).select { |sub| sub == sub.reverse && sub.length != 1 }
end

# -------------------

# Print Tests

# Test Cases
# p palindromes('abcd') == []
# p palindromes('madam') == ['madam', 'ada']
# p palindromes('hello-madam-did-madam-goodbye') == [
#   'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
#   'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
#   '-madam-', 'madam', 'ada', 'oo'
# ]
# p palindromes('knitting cassettes') == [
#   'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
#]

# Further Exploration Test Cases
p palindromes_fe('!madam?') == ['madam', 'ada']
p palindromes_fe('1aba1') == ['1aba1', 'aba']