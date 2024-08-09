# ALPHABETICAL ORDER
=begin
Write a method that, given a string, returns a new string containing only the alphabetic characters (all whitespace and non-alphabetic characters removed). These characters should be in case-insensitive alphabetical order, in the order they appear in the original string.

I got this from Nora

# PROBLEM
## INPUT: a string
## OUTPUT: a new string, containing only the alphabetic characters of the input string, in a case-insensitive alphabetical order
## RULES
### EXPLICIT REQUIREMENTS
  - a new string
  - containing only the alphabetic characters of the input string
  - remove all whitespace and non-alphabetic characters
  - returned in a case-insensitive alphabetical order
  
### IMPLICT REQUIREMENTS
  - "case-insensitive alphabetical order" means a custom alphabetic order that has the letters grouped in alphabetical order but which goes first depends upon the order it appears in the string. This is not ascii-betical order.
  - There don't appear to be multiple characters of the same type in the reference string, which may open up more approaches as options

Examples:
p alphabetized('') == ''
p alphabetized(' ') == ''
p alphabetized('9#$.%') == ''
p alphabetized(' ba ') == 'ab'
p alphabetized('Ab Ba') == 'AabB'
p alphabetized('Ba Ab') == 'aABb'
p alphabetized('9A #b$B .a%') == 'AabB'
p alphabetized('abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ') == 'aAbBcCdDeEfFgGhHiIjJkKlLmMnNoOpPqQrRsStTuUvVwWxXyYzZ'

# DATA STRUCTURES
input: a string
intermediate: a reference array of alphabetical characters in the custom order
output: a NEW string

# ALGORITHM
## HIGH-LEVEL
1. Create an array of lowercase alphabetic characters
2. Moving along the reference array, set the current reference character to the first letter "a"
3. Move through the input string from first character to the last.  Check if that character is either case version of the current reference character.  if it is, shovel it to an empty output string, if not move on
4. Repeat steps two and three until the last character "z" has been checked

## DETAIL
1. Create an array of lowercase alphabetic characters
   - alphabet = ("a".."z").to_a
2. Moving along the reference array, set the current reference character to the first letter "a"
* MOVE along the reference array, from the first character ('a') to the last ('z')
  + use #each
  + name parameter ref_char
3. Move through the input string from first character to the last.  Check if that character is either case version of the current reference character.  if it is, shovel it to an empty output string, if not move on
* MOVE through the input string from first character to the last
  + use #each_char
  + label parameter `char`
* DETERMINE if the current ref_char is the same as char
  + use equality operator
    - output << char if char == ref_char 
* DETERMINE if the current ref_char is the same as char of the uppercase 
    - output << char if char == ref_char.upcase 
* ACT upon the determination
  * IF the char is in the input string, then SHOVEL it to the output string
  * ELSE move on to the next char
* STOP moving through the input string array
* STOP moving through the alphabet array
* RETURN the output string
=end

def alphabetized(input)
  alphabet = ("a".."z").to_a
  output = ''
  
  alphabet.each do |ref_char|
    input.each_char do |char|
      output << char if char == ref_char 
      output << char if char == ref_char.upcase 
    end
  end
  
  output
end

p alphabetized('') == ''
p alphabetized(' ') == ''
p alphabetized('9#$.%') == ''
p alphabetized(' ba ') == 'ab'
p alphabetized('Ab Ba') == 'AabB'
p alphabetized('Ba Ab') == 'aABb'
p alphabetized('9A #b$B .a%') == 'AabB'
p alphabetized('abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ') == 'aAbBcCdDeEfFgGhHiIjJkKlLmMnNoOpPqQrRsStTuUvVwWxXyYzZ'
