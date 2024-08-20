=begin
# Find the length of the longest substring in the given string that is the same in reverse.

As an example, if the string was "I like racecars that go fast", the substring ("racecar") length would be 7.

If the length of the input string is 0, return value must be 0.

# UNDERSTAND
## INPUT: a string of alphanumeric characters, no whitespace
## OUTPUT: an Integer
## RULES
### EXPLICIT REQUIREMENTS
  - return the length of the longest substring that is a palindrome
### IMPLICIT REQUIREMENTS
  - substrings are consecutive characters in the input string

Example:
"a" => 1
"aab" => 2
"abcde" => 1
"zzbaabcd" => 4
"" => 0

# DATA STRUCTURES
input: a string
output: an integer
intermediate: 
- an array of all substrings of the input string
- an array of all substrings that are palindromes
- an array of length of the palindromes


# ALGORITHM
## HIGH-LEVEL APPROACH 1 - store values in arrays
1. Create an array of all substrings
2. Select from the substring array all substrings that are palindromes
3. Transform the palindrome strings into an array of lengths
4. Return the largest value in the array of lengths

## HIGH-LEVEL APPROACH 2 - don't store values other than length of palindromes
1. Search through all substrings
2. Check if each substring is a palindrome
3. Shovel length of palindrome to an array
4. Return the largest value in the array of lengths

## DETAIL 1
1. Create an array of all substrings
* CREATE an empty array
* MOVE through the input string from first character to last
  + use #upto
  + parameter is start_index
  * MOve through input string from start_index to last
    + use #upto
    + parameter is stop_index
* SHOVEL substring input[start_index..stop_index] to empty array

2. Select from the substring array all substrings that are palindromes
* MOVE through array of substrings
* Check if each substring is a palindrome
  
3. Transform the palindrome strings into an array of lengths
* TRANSFORM
  + use #map
4. Return the largest value in the array of lengths
  + use #max
=end

def create_all_substrings(input)
  substrings = []
  0.upto(input.length - 1) do |start_index|
    start_index.upto(input.length - 1) do |stop_index|
      substrings << input[start_index..stop_index]
    end
  end
  substrings
end

def select_palindromes(substrings)
    substrings.select do |substring|
      substring == substring.reverse
    end
end

def transform_palindromes(palindromes)
  palindromes.map do |palindrome|
    palindrome.length
  end
end

def longest_palindrome(input)
  return 0 if input == ""
  substrings = create_all_substrings(input)
  palindromes = select_palindromes(substrings)
  lengths = transform_palindromes(palindromes)
  lengths.max
end

p longest_palindrome("a") == 1
p longest_palindrome("aa") == 2 # aa
p longest_palindrome("baa") == 2 # aa
p longest_palindrome("aab") == 2 # aa
p longest_palindrome("baabcd") == 4 # baab
p longest_palindrome("baablkj12345432133d") == 9 #123454321

p longest_palindrome("") == 0

