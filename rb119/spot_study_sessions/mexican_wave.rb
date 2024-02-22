=begin
______________________________________________________________________________
*****Understand the PROBLEM*****
______________________________________________________________________________
THE PROBLEM:

Create a method that turns a string into a Mexican Wave. You will be passed a string and you must return that string in an array where an uppercase letter is a person standing up.

INPUT: A string

OUTPUT: 
An array of strings
  - each string element is a duplicate of the input string
  - the number of string elements corresponds to the number of letters in the input string
  - Progressive capitalisation of one letter:
    - The first letter is capitalised in the first element (index 0)
    - The second letter is capitalised in the second element (index 1)
    - etc.
    - But whitespace (gaps in the string) are ignored for capitalisation, even though they are also preserved in the string elements in the array

RULES
EXPLICIT REQUIREMENTS:
  - A method
  - see above output
  -
  
IMPLICIT REQUIREMENTS:
  - empty string input is allowed and must be accounted for
  - white space in strings is ignored, but is preserved
  -

______________________________________________________________________________
*****EXAMPLES/TEST CASES*****
______________________________________________________________________________

p wave("hello") == ["Hello", "hEllo", "heLlo", "helLo", "hellO"]

p wave("codewars") == ["Codewars", "cOdewars", "coDewars", "codEwars", "codeWars", "codewArs", "codewaRs", "codewarS"]

p wave("") == []

p wave("two words") == ["Two words", "tWo words", "twO words", "two Words", "two wOrds", "two woRds", "two worDs", "two wordS"]

p wave(" gap ") == [" Gap ", " gAp ", " gaP "]

______________________________________________________________________________
*****DATA STRUCTURES*****
______________________________________________________________________________
Arrays
______________________________________________________________________________
*****ALGORITHM*****
______________________________________________________________________________
HIGH LEVEL
There are two strategies to create the slightly varied strings in the array of strings:

  A. Create an array of identical string objects, then CHANGE them in turn, OR
  B. Create empty strings, then BUILD each of them differently before pushing them into the array.
  
Initially I didn't think strategy A was easy (or even possible) because string[index].upcase! or any variation on this theme using String#slice aka string element reference doesn't work because you are creating a sub-string first then calling upcase on that NEW substring, which doesn't mutate the string element in the array of strings.  So I pursued strategy B instead.

However, for strategy A to work string element reassignment syntax such as string[0] = string[0].upcase might work, but shallow copy may get in the way?

Derek's RAP method for PEDAC:

1. Requirement — The important, generalized steps required to navigate from the input to the desired output.
  a. Approach — The process that will be utilized to accomplish each Requirement.
    i. Procedure — Specific details to implement the Approach.

MAIN ALGORITHM - Strategy B

1.CREATE an empty array of strings
  a.Just an empty array
    i.array_of_strings = []
2.CREATE a lowercase version of the input string to refer to in the method
  a.
    i.lowercase_string = string.downcase
3.CREATE a temporary empty string
  a. 
    i. temp_string = ''
4.BUILD the temporary string
  a.the temporary string is a variation of the input string, with different capitalisation
  b.each character matches the lowercase version of the input string 
     i.temp_string << lowercase_string[string_index]
  c.but when the string index number (of the temporary string and the lowercased input string) matches the array index number then that letter should be capitalised
    i.temp_string << lowercase_string[string_index].upcase
  d.this will necessarily create more strings in the array of strings than we should return, but see next step below
5.CHECK to see if the capitalised letter in the temporary string was actually a letter
  a.In other words, the character at the index of the string that matches the index of the element in the array it is to be inserted at
    i.lowercase_string[array_index].match?(/[A-Za-z]/)
6.DECIDE whether to add the temporary string to the array of strings or not
  a.Add if the capitalised letter was actually a letter, or don't if it was not i.e. if it was whitespace
    i.array_of_strings << temp_string if lowercase_string[array_index].match?(/[A-Za-z]/)
7.REPEAT steps 3-6
  a.the number of times to repeat is the number characters in the input string
  b.if there is whitespace in the input string, then the number of string elements added won't be the same number of total characters, but that is correct for this problem
8.RETURN the array of strings

______________________________________________________________________________

Now CODE with intent!
=end

require 'pry'
require 'pry-byebug'

# solution 1 - Strategy B - Using nested simple loops

def wave(string)
  lowercase_string = string.downcase
  array_of_strings = []
  return array_of_strings if string.length == 0

  # iterate through array of strings
  array_index = 0
  
  loop do # array element loop
    string_index = 0
    temp_string = ''
    
    loop do # string loop
      if string_index == array_index
        temp_string << lowercase_string[string_index].upcase
      else
        temp_string << lowercase_string[string_index]
      end
  
      string_index += 1
      break if string_index == lowercase_string.size
    end
  
    array_of_strings << temp_string if lowercase_string[array_index].match?(/[A-Za-z]/)
    array_index += 1
    break if array_index == lowercase_string.size
  end
  
  # return array
  array_of_strings
end

# -------------------

# solution 2 - As above but refactored with Integer#times as array loop 

def wave(string)
  lowercase_string = string.downcase
  array_of_strings = []
  return array_of_strings if string.length == 0
  
  string.length.times do |array_index| # array loop
    temp_string = ''
    string_index = 0
    loop do # string loop
      if string_index == array_index
        temp_string << lowercase_string[string_index].upcase
      else
        temp_string << lowercase_string[string_index]
      end
  
      string_index += 1
      break if string_index == lowercase_string.size
    end
    array_of_strings << temp_string if lowercase_string[array_index].match?(/[A-Za-z]/)
  end
  
  array_of_strings
end

# -------------------

# solution 3 - As above but inner loop refactored using Array#chars and Enumerable#each_with_index

def wave(string)
  lowercase_string = string.downcase
  array_of_strings = []
  return array_of_strings if string.length == 0
  
  string.length.times do |array_index| # array loop
    temp_string = ''
    lowercase_string.chars.each_with_index do |char, string_index| # string loop
      if string_index == array_index
        temp_string << lowercase_string[string_index].upcase
      else
        temp_string << lowercase_string[string_index]
      end
    end
    array_of_strings << temp_string if lowercase_string[array_index].match?(/[A-Za-z]/)
  end
  
  array_of_strings
end

# -------------------

# Print Tests
p wave("hello") # ["Hello", "hEllo", "heLlo", "helLo", "hellO"]
p wave("two words") # ["Two words", "tWo words", "twO words", "two Words", "two wOrds", "two woRds", "two worDs", "two wordS"]
p wave(" gap ") # [" Gap ", " gAp ", " gaP "]
p wave("") # []

# Test Cases
p wave("hello") == ["Hello", "hEllo", "heLlo", "helLo", "hellO"]
p wave("codewars") == ["Codewars", "cOdewars", "coDewars", "codEwars", "codeWars", "codewArs", "codewaRs", "codewarS"]
p wave("") == []
p wave("two words") == ["Two words", "tWo words", "twO words", "two Words", "two wOrds", "two woRds", "two worDs", "two wordS"]
p wave(" gap ") == [" Gap ", " gAp ", " gaP "]