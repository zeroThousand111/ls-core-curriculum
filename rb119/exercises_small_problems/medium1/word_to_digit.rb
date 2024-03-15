=begin
______________________________________________________________________________
*****Understand the PROBLEM*****
______________________________________________________________________________
THE PROBLEM:

Write a method that takes a sentence string as input, and returns the same string with any sequence of the words 'zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine' converted to a string of digits.

Hint 1
The String#gsub! method may prove useful in this problem.

Hint 2
String#gsub! requires a "pattern" argument, which is typically expressed as a regular expression (regex). Regular expressions (regex) are very useful for string operations, but we don't cover them in any detail until RB130. If you haven't already read our book, Introduction to Regular Expressions, you may do so now, but it isn't necessary - this hint provides the only regular expression you need for this problem: if you have a variable named foo that contains some sort of word and want to match that word in a longer string, you can use the regex /\b#{foo}\b/.

INPUT: A String

OUTPUT: A new String?

RULES
EXPLICIT REQUIREMENTS:
  - 
  -
  -
  
IMPLICIT REQUIREMENTS:
  - is it a new string or a mutated string?
  -
  -

______________________________________________________________________________
*****EXAMPLES/TEST CASES*****
______________________________________________________________________________

word_to_digit('Please call me at five five five one two three four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'

______________________________________________________________________________
*****DATA STRUCTURES*****
______________________________________________________________________________
Could use Arrays
______________________________________________________________________________
*****ALGORITHM*****
______________________________________________________________________________
1. Requirement — The important, generalized steps required to navigate from the input to the desired output.
  a. Approach — The process that will be utilized to accomplish each Requirement.
    i. Procedure — Specific details to implement the Approach.

The following strategy creates a NEW string, not a mutated calling object string

1.SPLIT the string into an Array of 'words' 
  a.Words are defined by whitespace (' ')
  b.String#split defaults to split by whitespace
  c.This does not deal with full stops (aka periods) or other characters
    i.
2.
  a.
    i.
3.
  a.
    i.
4.
  a.
    i.
5.
  a.
    i.
______________________________________________________________________________

Now CODE with intent!
=end

require 'pry'
require 'pry-byebug'

HASH = {
  'zero' => '0', 
  'one'=> '1', 
  'two'=> '2', 
  'three' => '3', 
  'four' => '4', 
  'five' => '5', 
  'six' => '6',
  'seven' => '7', 
  'eight' => '8',
  'nine' => '9'
}

# solution 1 - splitting string twice on " " and "." then using #map and conditional IF statement to replace number word with numerical string but doesn't work fully because it can't replace full stops!

def word_to_digit(string)
  array = string.split(" ")
  array.map do |substring|
    substring.split('.').map do |subsubstring|
      # binding.pry
      if HASH.keys.include?(subsubstring)
        HASH[subsubstring]
      else
        subsubstring
      end
    end.join(".")
  end.join(" ")
end

# -------------------

# solution 2 - #map but doesn't deal with full stops

def word_to_digit(string)
  array = string.split(" ")
  array.map do |substring|
    if HASH.keys.include?(substring)
      HASH[substring]
    else
      substring
    end
  end.join(" ")
end

# -------------------

# solution 3 - after hints, iterating through HASH and replacing any key found in string with the value

def word_to_digit(string)
  HASH.each do |key, value|
    string.gsub!(/\b#{key}\b/, value)
  end
  string
end

# -------------------

# solution 4 - above refactored

def word_to_digit(string)
  HASH.each { |key, value| string.gsub!(/\b#{key}\b/, value) }
  string
end

# -------------------

# solution 5 - 

# -------------------

# Print Tests
p word_to_digit('Please call me at five five five one two three four. Thanks.') # 'Please call me at 5 5 5 1 2 3 4. Thanks.'

# Test Cases
# p word_to_digit('Please call me at five five five one two three four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'