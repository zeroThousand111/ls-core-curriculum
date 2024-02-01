=begin
______________________________________________________________________________
*****Understand the PROBLEM*****
______________________________________________________________________________
THE PROBLEM:

Write a method that takes a sentence string as input, and returns the same string with any sequence of the words 'zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine' converted to a string of digits.

INPUT: A string

OUTPUT: A string

RULES
EXPLICIT REQUIREMENTS:
  - A method;
  - "The same string" - does this mean a mutating method?
  -
  
IMPLICIT REQUIREMENTS:
  - 10 numerical words, no more (i.e. no 'eleven')
  -
  -

______________________________________________________________________________
*****EXAMPLES/TEST CASES*****
______________________________________________________________________________

word_to_digit('Please call me at five five five one two three four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'

______________________________________________________________________________
*****DATA STRUCTURES*****
______________________________________________________________________________

Strings. Arrays.
______________________________________________________________________________
*****ALGORITHM*****
______________________________________________________________________________

1. Chop up input_string into an array of words (String#split) by white space;
2. 
3.
4. If word contains punctuation, the number string should too
5.
______________________________________________________________________________

Now CODE with intent!
=end

# solution 1 - 

# def word_to_digit(input_string)
#   array_of_words = input_string.split(/[\s]/) # nice regex
#   new = array_of_words.map do |word|
#     if word.end_with?('.')
#       case word
#       when "zero." then word = "0."
#       when "one." then word = "1."
#       when "two." then word = "2."
#       when "three." then word = "3."
#       when "four." then word = "4."
#       when "five." then word = "5."
#       when "six." then word = "6."
#       when "seven." then word = "7."
#       when "eight." then word = "8."
#       when "nine" then word = "9."
#       else word
#       end
#     else
#       case word
#       when "zero" then word = "0"
#       when "one" then word = "1"
#       when "two" then word = "2"
#       when "three" then word = "3"
#       when "four" then word = "4"
#       when "five" then word = "5"
#       when "six" then word = "6"
#       when "seven" then word = "7"
#       when "eight" then word = "8"
#       when "nine" then word = "9"
#       else word
#       end # this does not deal with how to put back punctuation marks!
#     end
#   end
#   new.join(" ")
# end

# -------------------

# solution 2 - using String#gsub! destructive method after hints

ZERO = "zero"
ONE = "one"
TWO = "two"
THREE = "three"
FOUR = "four"
FIVE = "five"
SIX = "six"
SEVEN = "seven"
EIGHT = "eight"
NINE = "nine"

def word_to_digit(input_string)
  input_string.gsub!(/\b#{ZERO}\b/, "0")
  input_string.gsub!(/\b#{ONE}\b/, "1")
  input_string.gsub!(/\b#{TWO}\b/, "2")
  input_string.gsub!(/\b#{THREE}\b/, "3")
  input_string.gsub!(/\b#{FOUR}\b/, "4")
  input_string.gsub!(/\b#{FIVE}\b/, "5")
  input_string.gsub!(/\b#{SIX}\b/, "6")
  input_string.gsub!(/\b#{SEVEN}\b/, "7")
  input_string.gsub!(/\b#{EIGHT}\b/, "8")
  input_string.gsub!(/\b#{NINE}\b/, "9")
  input_string
end

# -------------------

# solution 3 - official LS solution

DIGIT_HASH = {
  'zero' => '0', 'one' => '1', 'two' => '2', 'three' => '3', 'four' => '4',
  'five' => '5', 'six' => '6', 'seven' => '7', 'eight' => '8', 'nine' => '9'
}.freeze

def word_to_digit(words)
  DIGIT_HASH.keys.each do |word|
    words.gsub!(/\b#{word}\b/, DIGIT_HASH[word])
  end
  words
end

# -------------------

# Print Tests

p word_to_digit('one')
p word_to_digit('You are two')

p word_to_digit('Please call me at five five five one two three four. Thanks.') # 'Please call me at 5 5 5 1 2 3 4. Thanks.'

# Test Cases

p word_to_digit('Please call me at five five five one two three four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'
