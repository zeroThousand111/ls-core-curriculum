=begin
For a given nonempty string s find a minimum substring t and the maximum number k, such that the entire string s is equal to t repeated k times. The input string consists of lowercase latin letters. Your function should return a tuple (in Python) (t, k) or an array (in Ruby and JavaScript) [t, k]

Example #1:
for string
s = "ababab" the answer is
["ab", 3]

Example #2:
for string
s = "abcde" the answer is
  because for this string "abcde" the minimum substring t, such that s is t repeated k times, is itself.
  
# UNDERSTAND THE PROBLEM

## INPUT: a string
## OUTPUT: a string and an integer, written as an array ["string", Integer]
## RULES:
### Explicit requirements:
  - the input string won't be an empty string
  - the input string is comprised of lower case latin letters only
  - the return should be an array, containing the repeating substring and the multiple Integer
### Implicit requirements:
  - the input string will either be comprised of a repeating smaller string OR it can be expressed as a repetition of 1 instance of the input string (see test cases)
  
# EXAMPLES TEST CASES
p f("ababab") == ["ab", 3]
p f("abcde") == ["abcde", 1]

# DATA STRUCTURES
Strings, maybe an array of substrings may help?

# ALGORITHM

* CREATE an empty output array?
* CREATE a local variable to track size of substring
  - length = 1
* CREATE a local variable to track the multiple of substrings in the array of substrings to be compared
    - multiple = string.length
--- start of iterator
* START a loop

CHECK to see if the input string contains only substring of 1 character long

* CREATE an array of substrings of length by splitting the substring into the number of substrings == multiple
  + in other words, if multiple is initially string.length, then chop up the string into substrings of string.length size i.e. 1 char each
  + HOW???
  
  + use 
  
* DETERMINE if all the substrings are the same
    + could use Array#all? with a match?
    + could use Array#uniq.size == 1
  + ACT on the above determination
    + IF they are all the same, then return the substring and number of elements in the array of substrings
      - ["substring", array_of_substrings.size]
    + ELSE move on and iteratate with a substring of a higher length
* STOP looping when length local variable == length of string + 1
an array of substrings

=end

def f(string)
  multiple = string.length
  length = 1
  loop do 
    array_of_subs = []
    
    # create array_of_sub
    index = 0
    loop do 
      array_of_subs << string[index, length]
      index += length
      break if index >= string.length
    end
    
    # check if all substrings are the same
    if array_of_subs.all?(array_of_subs[0])
      return [array_of_subs[0], (string.length / array_of_subs[0].length)]
    end
  
    length += 1
    break if length == string.length + 1
  end
end

p f("ababab") == ["ab", 3]
p f("abcde") == ["abcde", 1]