=begin
13. Kebabize
(​https://www.codewars.com/kata/57f8ff867a28db569e000c4a/train/ruby​)
6 kyu

Modify the kebabize function so that it converts a camel case string into a kebab case.
kebabize('camelsHaveThreeHumps') // camels-have-three-humps kebabize('camelsHave3Humps') // camels-have-humps
Notes:
the returned string should only contain lowercase letters

# UNDERSTAND THE PROBLEM
## INPUT: a string (camel case)
## OUTPUT: the same string (kebab case)
## RULES
### Explicit requirements:
  - a method;
  - transform input string from CamelCase to kebab-case
### Implicit requirements:
  - What is CamelCase?
    - first character lowercase
    - first characters of subsequent new words are uppercase
    - no white space
    - uses numerical integers
  - What is kebab-case?
    - all characters lowercase
    - separation of words with a single hyphen
    - no numerical integers allowed, and not converted
    
# EXAMPLES / TEST CASES
p kebabize('myCamelCasedString') == 'my-camel-cased-string'
p kebabize('myCamelHas3Humps') == 'my-camel-has-humps' # 3 removed

# DATA STRUCTURES

Strings
An array of characters?

# ALGORITHM

* create an empty output string
* MOVE through the input string, character by character, from the first to the last
* DETERMINE what the current character is
* ACT upon the determination
  + IF the char is a lowercase alphabetic letter, then shovel it to the output string
  + IF the char is an uppercase alphabetic letter, then SHOVEL a hyphen to the output string, followed by a lowercase version of the current char
  + IF the char is a numeric string, move on
* STOP moving through the input string
* RETURN the output string
=end

def kebabize(input_string)
  output_string = ''
  input_string.each_char do |char|
    if char.match?(/[a-z]/)
      output_string << char
    elsif char.match?(/[A-Z]/)
      output_string << "-" << char.downcase
    end
  end
  output_string
end

p kebabize('myCamelCasedString') == 'my-camel-cased-string'
p kebabize('myCamelHas3Humps') == 'my-camel-has-humps'