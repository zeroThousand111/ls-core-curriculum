=begin
Problem 9
Create a method that takes two string arguments and returns the number of times that the second string occurs in the first string. Note that overlapping strings don't count: 'babab' contains 1 instance of 'bab', not 2.

You may assume that the second argument is never an empty string.

# PROBLEM
## INPUT: two strings of alphabetic chars
## OUTPUT: an Integer
## RULES
### EXPLICIT REQUIREMENTS
  - second argument is never empty, but first might be
  - return the number of times that the second string occurs in the first string
  - can't include overlapping strings, in other words, once the second string has been found, don't use any characters from that instance again
### IMPLICIT REQUIREMENTS
  - 

Examples

p count_substrings('babab', 'bab') == 1
p count_substrings('babab', 'ba') == 2
p count_substrings('babab', 'b') == 3
p count_substrings('babab', 'x') == 0
p count_substrings('babab', 'x') == 0
p count_substrings('', 'x') == 0
p count_substrings('bbbaabbbbaab', 'baab') == 2
p count_substrings('bbbaabbbbaab', 'bbaab') == 2
p count_substrings('bbbaabbbbaabb', 'bbbaabb') == 1

# DATA STRUCTURES
input: a string
output: an integer
intermediate:
  - could use an array of substrings, but this won't allow for overlapping second string

# ALGORITHM
## HIGH-LEVEL
1. MOVE through the first string, checking one substring of length of second string at a time
2. COUNT the number of instances of second string found in first.
3. MOVE on length of string2 if a substring match is found in string1
4. RETURN count after finished moving

## DETAIL
1. MOVE through the first string, checking one substring of length of second string at a time
* MOVE through the first string from first character to the last
  + use upto
    - 0.upto(string2.length - 1)
  + parameter is start_index
* SELECT current substring string1[start_index, lengthofstring2]

2. COUNT the number of instances of second string found in first.
* CREATE count local variable
* COMPARE current substring with string 2
  + substring == string2
* ACT upon result of comparison
  + IF a match, then increment count by 1
  + AND...
3. MOVE on length of string2 if a substring match is found in string1
* MOVE start_index on by length of string2
4. RETURN count after finished moving
=end

def count_substrings(string1, string2)
  count = 0
  start_index = 0
  
  until start_index > (string1.length - 1) do
    substring = string1[start_index, string2.length]
    if substring == string2
      count += 1 
      start_index += string2.length - 1
    end
    start_index += 1
  end
  
  count
end

p count_substrings('babab', 'bab') == 1
p count_substrings('babab', 'ba') == 2
p count_substrings('babab', 'b') == 3
p count_substrings('babab', 'x') == 0
p count_substrings('babab', 'x') == 0
p count_substrings('', 'x') == 0
p count_substrings('bbbaabbbbaab', 'baab') == 2
p count_substrings('bbbaabbbbaab', 'bbaab') == 2
p count_substrings('bbbaabbbbaabb', 'bbbaabb') == 1