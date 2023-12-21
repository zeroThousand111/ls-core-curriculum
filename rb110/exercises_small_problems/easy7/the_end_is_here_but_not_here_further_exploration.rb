=begin
______________________________________________________________________________
*****Understand the PROBLEM*****
______________________________________________________________________________
THE PROBLEM:

Write a method that returns the middle word in the String passed to it as an argument.

Words are any sequence of non-blank characters.

Our (previous) solution ignored a couple of edge cases because we explicitly stated that you didn't have to handle them: strings that contain just one word, and strings that contain no words.

Suppose we need a method that retrieves the middle word of a phrase/sentence. What edge cases need to be considered? How would you handle those edge cases without ignoring them? Write a method that returns the middle word of a phrase or sentence. It should handle all of the edge cases you thought of.



INPUT: A string

OUTPUT: A string

RULES
EXPLICIT REQUIREMENTS:
  - A method;
  - Return a string of the middle word;
  - A word is any sequence of non-blank characters;
  -
  
IMPLICIT REQUIREMENTS:
  - The problem is not case-sensitive;
  -
  -

______________________________________________________________________________
*****EXAMPLES/TEST CASES*****
______________________________________________________________________________

penultimate('last word') == 'last'
penultimate('Launch School is great!') == 'is'

New Edge Cases
- One word strings e.g. "one"
- No-word strings e.g. " "
- Blank strings e.g. ""


______________________________________________________________________________
*****DATA STRUCTURES*****
______________________________________________________________________________

Strings
Arrays
______________________________________________________________________________
*****ALGORITHM*****
______________________________________________________________________________

1.Cut up string into words and make a list of words;
2.Count the number of words in the list;
3.Calculate middle word:
  a.If word is list is an odd number of words, identify one middle word.
  b.If even, identify two middle words.
4.Return word or words.
5.
______________________________________________________________________________

Now CODE with intent!
=end

# solution 1 - Array#split(" ")

def middle_word(input_string)
  array = input_string.split(" ")
  number = array.size
  
  if number == 0 || array.empty?
    puts "That's not a valid string!"
    return input_string
  end
  
  if number.odd?
    output_string = array[number / 2]
    return output_string
  else
    output_string = array[(number / 2 - 1), 2]
    return output_string.join(' ')
  end
  output_string
end

#Print Tests - Odd
p middle_word('the last word') #'last'

# Print Tests - Even
p middle_word('last word') #'last word'
p middle_word('Launch School is great!') #'School is'

# Print Tests - One Word
p middle_word('one') #'one'

# Print Tests - Empty String
p middle_word(' ')

# Print Tests - Blank String
p middle_word('')

# Test Cases
