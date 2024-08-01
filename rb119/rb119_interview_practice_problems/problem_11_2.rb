=begin
Problem 11 - 2nd time I have taken this problem

Create a method that takes a nonempty string as an argument and returns an array consisting of a string and an integer. If we call the string argument s, the string component of the returned array t, and the integer component of the returned array k, then s, t, and k must be related to each other such that s == t * k. The values of t and k should be the shortest possible substring and the largest possible repeat count that satisfies this equation.

You may assume that the string argument consists entirely of lowercase alphabetic letters.

# PROBLEM
## INPUT: a string of alphabetic chars
## OUTPUT: an array containing a substring and an integer
## RULES
### EXPLICIT REQUIREMENTS
  - return is [substring, number of occurences]
  - substring should be the shortest possible and frequency the highest possible
  
### IMPLICIT REQUIREMENTS
  - substring always begins at input string index 0
  - start search with shortest substring i.e. length = 1
  - multiple/count/occurence is string.length / substring.length 
  

Examples

p repeated_substring('xyzxyzxyz') == ['xyz', 3]
p repeated_substring('xyxy') == ['xy', 2]
p repeated_substring('xyz') == ['xyz', 1]
p repeated_substring('aaaaaaaa') == ['a', 8]
p repeated_substring('superduper') == ['superduper', 1]
The above tests should each print true.

# DATA STRUCTURES
input: a string
output: an array
intermediate: not needed

# ALGORITHM
## HIGH-LEVEL
1. Select a substring starting at string index 0, length 1 and incrementally increase length 1 
2. Calculate multiple
3. Check current substring * multiple against input string
4. Return [substring, multiple] if its a match
5. Eventually [string, 1] will be the return if not other substring matches

## DETAIL
1. Select a substring starting at string index 0, length 1 and incrementally increase length 1 
* MOVE through the string starting at index 0
  + use #upto to increment length
  + substtring = string[start_index, length]
2. Calculate multiple
  + multiple = string.length / substring.length 
3. Check current substring * multiple against input string

4. Return [substring, multiple] if its a match
5. Eventually [string, 1] will be the return if not other substring matches
=end


def repeated_substring(string)
  1.upto(string.length) do |length|
    substring = string[0, length]
    multiple = string.length / substring.length 
    return [substring, multiple] if string == (substring * multiple)
  end
  
end

p repeated_substring('xyzxyzxyz') == ['xyz', 3]
p repeated_substring('xyxy') == ['xy', 2]
p repeated_substring('xyz') == ['xyz', 1]
p repeated_substring('aaaaaaaa') == ['a', 8]
p repeated_substring('superduper') == ['superduper', 1]