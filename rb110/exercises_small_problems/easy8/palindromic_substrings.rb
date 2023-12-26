=begin
______________________________________________________________________________
*****Understand the PROBLEM*****
______________________________________________________________________________
THE PROBLEM:

Write a method that returns a list of all substrings of a string that are palindromic. That is, each substring must consist of the same sequence of characters forwards as it does backwards. The return value should be arranged in the same sequence as the substrings appear in the string. Duplicate palindromes should be included multiple times.

You may (and should) use the substrings method you wrote in the previous exercise.

For the purposes of this exercise, you should consider all characters and pay attention to case; that is, "AbcbA" is a palindrome, but neither "Abcba" nor "Abc-bA" are. In addition, assume that single characters are not palindromes.

INPUT: A string

OUTPUT: An array of strings

RULES
EXPLICIT REQUIREMENTS:
  - A method;
  - An array of palindromic strings as the return;
  - A palindrome: each substring must consist of the same sequence of characters forwards as it does backwards;
  - For the purposes of this exercise, palindromes are case-sensitive and they account for non-letters: "AbcbA" is a palindrome, but neither "Abcba" nor "Abc-bA" are;
  - In addition, assume that single characters are not palindromes;
  - You may (and should) use the substrings method you wrote in the previous exercise.

IMPLICIT REQUIREMENTS:
  - The return if there are no palindromes is an empty array;
  - Non-letters are included in the definition of palindromes e.g. '-did-' is a palindrome.
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

Two strategies:
a. Test each sub-string for palindromic properties as you go and store if yes; or
b. Create a list of all possible sub-strings, then test each for palindromes.

Using Strategy A

1. Create an empty array to store found palindromes;
2. Iterate through the string to create every possible sub-string;
3. Check each sub-string for palindromic properties
3. If palindrome, store in array
4. Finish when all sub-strings checked
5. Return palindrome array.

Using Strategy B

1. Create an empty array to store found palindromes;
2. Create an empty array to store all possible sub-strings;
3. Iterate through the string and create all sub-strings in array;
4. Iterate through the created sub-strings array to check each element for palindromic properties;
5. If palindrome, store in array;
6. Return palindrome array.
______________________________________________________________________________

Now CODE with intent!
=end

# solution 1 - Strategy B using simple loop

# def substrings(string)
#   result = []
#   counter = 0
  
#   loop do
#     counter.upto(string.size - 1) do |index|
#       result << string[counter..index]
#     end
#     counter += 1
#     break if counter == string.size
#   end
  
#   result
# end

# def palindromic?(substring)
#   (substring.chars == substring.chars.reverse) && (substring.size > 1)
# end

# def palindromes(string)
#   palindromes = []
#   sub_strings = substrings(string)
#   sub_strings.each do |substring|
#     if palindromic?(substring)
#       palindromes << substring 
#     end
#   end
#   palindromes
# end

# solution 2 - Offical LS solution

def leading_substrings(string)
  result = []
  0.upto(string.size - 1) do |index|
    result << string[0..index]
  end
  result
end

def substrings(string)
  results = []
  (0...string.size).each do |start_index|
    this_substring = string[start_index..-1]
    results.concat(leading_substrings(this_substring))
  end
  results
end

def palindromes(string)
  all_substrings = substrings(string)
  results = []
  all_substrings.each do |substring|
    results << substring if palindrome?(substring)
  end
  results
end

def palindrome?(string)
  string == string.reverse && string.size > 1
end

# Print Tests
p palindromes('madam') # ['madam', 'ada']

# Test Cases
p palindromes('abcd') == []
p palindromes('madam') == ['madam', 'ada']
p palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
p palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]