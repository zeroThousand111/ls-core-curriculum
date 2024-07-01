=begin
Create a method that takes a nonempty string as an argument and returns an array consisting of a string and an integer. If we call the string argument `s`, the string component of the returned array `t`, and the integer component of the returned array `k`, then `s`, `t`, and `k` must be related to each other such that `s == t * k`. The values of `t` and `k` should be the shortest possible substring and the largest possible repeat count that satisfies this equation.

You may assume that the string argument consists entirely of lowercase alphabetic letters.

# UNDERSTAND THE PROBLEM
## INPUT: a string
## OUTPUT: an array, containing a substring and an integer ["substring", integer]
## RULES
### Explicit requirements:
  - a method;
  - input string will never be empty
  - return the smallest substring that can be multiplied to exactly fit the input string AND the multiplication factor
### Implicit requirements:
  - each test case contains either a substring that is a multiple of the string, or returns the string with the multiple of 1
  - substrings in the test cases are contiguous and all begin at string index 0, in other words, 'xyz' contains 'x', 'xy' and 'xyz', but not 'y', yz' or 'z'
  - 
  
# EXAMPLES

p repeated_substring('xyzxyzxyz') == ['xyz', 3]
p repeated_substring('xyxy') == ['xy', 2]
p repeated_substring('aaaaaaaa') == ['a', 8] - the smallest possible substring
p repeated_substring('xyz') == ['xyz', 1] - this and below are whole string
p repeated_substring('superduper') == ['superduper', 1]

The above tests should each print `true`.

# DATA STRUCTURES

Maybe an array of substrings, but maybe not

# ALGORITHM

--- start loop/iterator
* CREATE a local variable length and initialise with a value of 1
  + use #upto and use incrementing value as length
* CREATE a local variable multiple and initialise with value of string.length / length
  + multiple = string.length / substring.length 
* CREATE a substring local variable set to string[0, length]
    - substring = string[0, length]
* DETERMINE if substring * multiple == string
* ACT on determination
  + IF substring * multiple == string, then return [substring, multiple]
  + ELSE move on to next iteration
* INCREMENT substring length by 1
* REASSIGN value of multiple
  + multiple = string.length / substring.length 
(* SKIP to next iteration if string.length / substring.length isn't a whole number, but this step is OPTIONAL and an optimisation only
    - next if string.length / substring.length % != 0)
* REASSIGN substring to a larger substring of string[0, multiple]
  + increment multiple
--- end loop/iterator - loop will have returned once multiple reaches 1

=end

def repeated_substring(string)
  1.upto(string.length) do |length|
    multiple = string.length / length
    substring = string[0, length]
    next if string.length % substring.length != 0 # not a whole number
    return [substring, multiple] if substring * multiple == string
  end
end

p repeated_substring('xyzxyzxyz') == ['xyz', 3]
p repeated_substring('xyxy') == ['xy', 2]
p repeated_substring('xyz') == ['xyz', 1]
p repeated_substring('aaaaaaaa') == ['a', 8]
p repeated_substring('superduper') == ['superduper', 1]

