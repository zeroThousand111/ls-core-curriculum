=begin
Problem 16
Create a method that returns the count of distinct case-insensitive alphabetic characters and numeric digits that occur more than once in the input string. You may assume that the input string contains only alphanumeric characters.

# PROBLEM
## INPUT: a string of only alpha-NUMERIC characters
## OUTPUT: an Integer
## RULES
### EXPLICIT REQUIREMENTS
  - return a count of those characters that occur more than once in the input string
### IMPLICIT REQUIREMENTS
  - no white space
  - characters can be alphabetic, numeric and in upper or lower case
  
Examples

p distinct_multiples('xyz') == 0               # (none
p distinct_multiples('xxyypzzr') == 3          # x, y, z
p distinct_multiples('xXyYpzZr') == 3          # x, y, z
p distinct_multiples('unununium') == 2         # u, n
p distinct_multiples('multiplicity') == 3      # l, t, i
p distinct_multiples('7657') == 1              # 7
p distinct_multiples('3141592653589793') == 4  # 3, 1, 5, 9
p distinct_multiples('2718281828459045') == 5  # 2, 1, 8, 4, 5
The above tests should each print true.

# DATA STRUCTURES
Input: a string
Output: an INteger
Intermediate: a tally hash
{ "char" => count}

# ALGORITHM
## HIGH-LEVEL
1. Create a tally hash of the unique characters in the input string and their frequencies
2. Count how many keys in the tally hash have frequencies of more than 1

## DETAIL
1. Create a tally hash of the unique characters in the input string and their frequencies
* create an array of downcased string chars
* Create a tally hash
  + use #tally
2. Count how many keys in the tally hash have frequencies of more than 1
* Count the number of keys with a value of > 1
  + use #count
    - hash.count {|k,v| v > 1}

=end

def distinct_multiples(string)
  tally_hash = string.downcase.chars.tally
  tally_hash.count { |k,v| v > 1 }
end

p distinct_multiples('xyz') == 0               # (none
p distinct_multiples('xxyypzzr') == 3          # x, y, z
p distinct_multiples('xXyYpzZr') == 3          # x, y, z
p distinct_multiples('unununium') == 2         # u, n
p distinct_multiples('multiplicity') == 3      # l, t, i
p distinct_multiples('7657') == 1              # 7
p distinct_multiples('3141592653589793') == 4  # 3, 1, 5, 9
p distinct_multiples('2718281828459045') == 5  # 2, 1, 8, 4, 5