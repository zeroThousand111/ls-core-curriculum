=begin
Create a method that takes a string as an argument and returns `true` if the string is a pangram, `false` if it is not.

Pangrams are sentences that contain every letter of the alphabet at least once. For example, the sentence "Five quacking zephyrs jolt my wax bed." is a pangram since it uses every letter at least once. Note that case is irrelevant.

# UNDERSTAND THE PROBLEM
## INPUT: a string
## OUTPUT: a boolean true or false
## RULES
### EXPLICIT REQUIREMENTS
  - string argument
  - return true if the string is a pangram, else return false
  - Pangrams are sentences that contain every letter of the alphabet at least once
  - ignore case
### IMPLICIT REQUIREMENTS
  - AT LEAST ONCE, means that the string can contain more than one letter of each letter of the alphabet
  - some sentneces may have punctuation and all will have whitespace
  - no empty string arguments

Examples

p is_pangram('The quick, brown fox jumps over the lazy dog!') == true
p is_pangram('The slow, brown fox jumps over the lazy dog!') == false
p is_pangram("A wizard’s job is to vex chumps quickly in fog.") == true
p is_pangram("A wizard’s task is to vex chumps quickly in fog.") == false
p is_pangram("A wizard’s job is to vex chumps quickly in golf.") == true

my_str = 'Sixty zippers were quickly picked from the woven jute bag.'
p is_pangram(my_str) == true

The above tests should each print `true`.

# DATA STRUCTURES
## INPUT: a string of mixed characters
## OUTPUT: a boolean
## INTERMEDIATE
 - an array of each letter of the alphabet
 
# ALGORITHM
## HIGH-LEVEL
1. CREATE an array of every lowercase alphabet letter (test_array)
2. PREPARE the input string by making all alphabetic letters lowercase, removing whitespace and non-alphabetic characters
3. MOVE through the prepared input string and delete each current char from the test_array
4. RETURN true if the test array is now empty, false if not empty

1. CREATE an array of every lowercase alphabet letter (test_array)
* use a helper method
* use a range and #to_a
* lowercase a-z only

2. PREPARE the input string by making all alphabetic letters lowercase, removing whitespace and non-alphabetic characters
* Use String#delete().downcase chain
3. MOVE through the prepared input string and delete each current char from the test_array
* MOVE from first character to the last in the prepared string
  + use #each_char
* DELETE current char from 
4. RETURN true if the test array is now empty, false if not empty
* use #empty? upon test_array
=end

def is_pangram(string)
  test_array = ("a".."z").to_a
  prepared_string = string.delete("^A-Za-z").downcase
  prepared_string.each_char do |char|
    test_array.delete(char)
  end
  test_array.empty?
end

p is_pangram('The quick, brown fox jumps over the lazy dog!') == true
p is_pangram('The slow, brown fox jumps over the lazy dog!') == false
p is_pangram("A wizard’s job is to vex chumps quickly in fog.") == true
p is_pangram("A wizard’s task is to vex chumps quickly in fog.") == false
p is_pangram("A wizard’s job is to vex chumps quickly in golf.") == true

my_str = 'Sixty zippers were quickly picked from the woven jute bag.'
p is_pangram(my_str) == true