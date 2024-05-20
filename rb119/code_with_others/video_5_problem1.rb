=begin
# Understand the Problem
Find the length of the longest substring in the given string that is the same in reverse.

## Reframe the problem
Find the longest palindrome substring in a string and return its length

inputs: a string
output: an integer
Rules:
  Explicit requirements:
    - return the length of the longest palindrome substring in a string
  Implicit requirepments:
    - test cases can have letters and numeric strings
    - no white space

# Examples/Test Cases

p longest_palindrome("a") == 1
p longest_palindrome("aa") == 2
p longest_palindrome("baa") == 2
p longest_palindrome("aab") == 2
p longest_palindrome("baabcd") == 4
p longest_palindrome("baablkj12345432133d") == 9

# Data Structures
Strings
Array of substrings

# Algorithm

* CREATE an array of all substrings of that string
  + use two nested #upto loops
  + use a helper method
* SELECT those substrings that are palindromes
  + use #select to return a new array of substrings that are palindromes
  + block contains expression substring == substring.reverse
* SELECT the palindrome that is the longest
  + use the #max_by to return the palindromic substring that is the longest
  + use #length to return the number of characters in that particular substring
* RETURN the length of that palindrome, else return 0
=end

def create_array_of_substrings(string)
    array = []
    0.upto(string.length - 1) do |start_index|
      start_index.upto(string.length - 1) do |stop_index|
        array << string[start_index..stop_index]
      end
    end
    array
  end
  
  def longest_palindrome(string)
    array_of_substrings = create_array_of_substrings(string)
    array_of_palindromes = array_of_substrings.select do |substring|
      substring == substring.reverse
    end
    array_of_palindromes.max_by { |substring| substring.length }.length
  end

p longest_palindrome("a") == 1
p longest_palindrome("aa") == 2
p longest_palindrome("baa") == 2
p longest_palindrome("aab") == 2
p longest_palindrome("baabcd") == 4
p longest_palindrome("baablkj12345432133d") == 9
