=begin
23. Longest alphabetical substring
(​https://www.codewars.com/kata/5a7f58c00025e917f30000f1​) 
6 kyu

Find the longest substring in alphabetical order.
   
Example: the longest alphabetical substring in "asdfaaaabbbbcttavvfffffdf" is "aaaabbbbctt". There are tests with strings up to 10 000 characters long so your code will need to be efficient. The input will only consist of lowercase characters and will be at least one letter long.

If there are multiple solutions, return the one that appears first. 

# PROBLEM

## INPUT: a string
## OUTPUT: a string, a substring of input string
## RULES
### Explicit requirements:
  - find the longest "alpabetical" substring in a string and return it
  - if there are multiple solutions i.e. two longest substrings, then return the one that appears first

### Implicit requirements:
  - "alphabetical substring" means a string that contains all it's characters in alphabetical order
    - e.g. "abcdegoyz" is an alphabetical string
    - e.g. "dea" is not
  - the input strings can be long, which implies that creating an array of ALL substrings will be costly on performance
  - Performance is important
  - a "substring" is made of consecutive characters in order that they appear in the input string, in other words, they are not jumbled up in order

# EXAMPLES 
p longest('asd') == 'as' 
p longest('nab') == 'ab' starting at index 1
p longest('abcdeapbcdef') == 'abcde'
p longest('asdfaaaabbbbcttavvfffffdf') == 'aaaabbbbctt' starting at index 4
p longest('asdfbyfgiklag') =='fgikl'
p longest('z') == 'z'
p longest('zyba') == 'z' all alphabetical substrings are 1 character, "z" appears first

# DATA STRUCTURES
Strings
Intermediate: an array of substrings
Intermediate: a filtered array of alphabetical substrings

# ALGORITHM
## HIGH-LEVEL STEPS
1. Select all substrings that are alphabetical
2. Measure the length of selected substrings
3. Return the longest substring or the longest that appears first

1. Select all substrings that are alphabetical
1.a. Select all substrings
* CREATE an array of alphabetical substrings
* MOVE through the substring from first character to last as the start_index
  + use #upto
    - 0.upto(string.length - 1) do |start_index|
  * MOVE through the substring from first character to the last as the stop_index
      - start_index.upto(string.length - 1) do |stop_index|
    * SELECT substring from start_index to stop_index
    * TEST if substring is alphabetical
      + use helper method
    * SHOVEL substring to array IF it is alphabetical

1.b. Determine if the current substring is alphabetical
* SORT the substring into alphabetical order
  + use #sort
    - substring.chars.sort.join
* COMPARE 

1.c. Capture those substrings that are alphabetical
* SHOVEL the substring to the array of substrings if it is alphabetical, move on and do nothing if not

2. Measure the length of selected substrings and RETURN longest
* Measure the length of each alphabetical substring
  + use #max_by
    - alphabetical_substrings.max_by { |sub| sub.length }

=end

def is_alphabetical?(substring)
  sorted_substring = substring.chars.sort.join
  return true if sorted_substring == substring
  false
end

def create_alphabetical_substrings(string)
  alphabetical_substrings = []
  0.upto(string.length - 1) do |start_index|
    start_index.upto(string.length - 1) do |stop_index|
      if is_alphabetical?(string[start_index..stop_index])
        alphabetical_substrings << string[start_index..stop_index]
      end
    end
  end
  alphabetical_substrings
end

def longest(string)
  alphabetical_substrings = create_alphabetical_substrings(string)
  alphabetical_substrings.max_by { |sub| sub.length }
end

p longest('asd') == 'as'
p longest('nab') == 'ab'
p longest('abcdeapbcdef') == 'abcde'
p longest('asdfaaaabbbbcttavvfffffdf') == 'aaaabbbbctt' 
p longest('asdfbyfgiklag') =='fgikl'
p longest('z') == 'z'
p longest('zyba') == 'z'
