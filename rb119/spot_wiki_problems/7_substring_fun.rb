=begin
Complete the function that takes an array of words.
You must concatenate the nth letter from each word to construct a new word which should be returned as a string, where n is the position of the word in the list.
For example:
["yoda", "best", "has"] --> "yes" ^^^
n=0 n=1 n=2

Note: Test cases contain valid input only - i.e. a string array or an empty array; and each word will have enough letters. 

# UNDERSTAND THE PROBLEM

## INPUT: an array of "words"
## OUTPUT: a String, a "word"

## RULES
### Explicit requirements:
  - concatenate the nth letter from the nth "word" to build a new "word"
  - Return the new "word"
### Implicit requirements:
  - a "word" is a sequence of alphabetic string characters
  - No non-alphabetic characters or whitespace is introduced in the array of strings

# TEST CASES / EXAMPLES
p nth_char(['yoda', 'best', 'has']) == 'yes' {0=>y, 1=>e, 2=>s}
p nth_char([]) == ''
p nth_char(['X-ray']) == 'X'
p nth_char(['No', 'No']) == 'No'
p nth_char(['Chad', 'Morocco', 'India', 'Algeria', 'Botswana', 'Bahamas', 'Ecuador', 'Micronesia']) == 'Codewars'

# DATA STRUCTURES
Strings and an array of strings

# ALGORITHM

* CREATE an empty string to return
    - output = ''
    
--- start of iterator
* MOVE through the array of strings, from first to last string, tracking the index number through the move
  + could use a simple loop
  + could use an iterator:
    + each_index
    + each_with_index
    + upto
* SHOVEL or CONCAT the nth character of the nth word to the end of the output string
   + In other words, use the current value of the index and take the character (substring) in that index position of the string in that position in the array of strings
   + e.g. character at index 3 from string in index 3 of array
     - output << array[index][index]
* STOP moving through the array of strings, when reach the last string
--- end of iterator
* RETURN output string

=end

def nth_char(array)
  output = ''
  array.each_index do |index|
    output << array[index][index]
  end
  output
end

p nth_char(['yoda', 'best', 'has']) == 'yes' 
p nth_char([]) == ''
p nth_char(['X-ray']) == 'X'
p nth_char(['No', 'No']) == 'No'
p nth_char(['Chad', 'Morocco', 'India', 'Algeria', 'Botswana', 'Bahamas', 'Ecuador', 'Micronesia']) == 'Codewars'