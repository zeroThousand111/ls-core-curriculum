=begin
Write a method that takes a string argument and returns a new string that contains the value of the original string with all consecutive duplicate characters collapsed into a single character. You may not use String#squeeze or String#squeeze!.

# UNDERSTAND THE PROBLEM

Inputs: a string
Outputs: a new string, with all consecutive duplicate characters removed
Rules
  Explicit requirements:
    - may not use methods String#squeeze or #squeeze!
    - return a new string based on input string, minus any duplicate consecutive characters
    - 
  Implicit requirements:
    - "characters" means all characters, including digits
    - "consecutive" means adjacent in the string, e.g. "aba" returns "aba" not "ab"
    - input can be an empty string
    - 


# TEST CASES
crunch('ddaaiillyy ddoouubbllee') == 'daily double'
crunch('4444abcabccba') == '4abcabcba'
crunch('ggggggggggggggg') == 'g'
crunch('a') == 'a'
crunch('') == ''

# DATA STRUCTURES

Strings, maybe could use array as intermediate step

# ALGORITHM
* CREATE an empty new string
    - output_string = ""
* RETURN output_string if input_string is empty
* SHOVEL first character of input_string onto output_string
* MOVE through the input string character by character, keeping hold of index value of current character
  + could use a loop and incrementing index value
  + could use an iterator method chain such as #each_char.with_index
* COMPARE current character with last character in output_string
    - char == output_string[-1]
  + IF the two are the same, do nothing and move on
  + IF the two are different, shovel the current character to the new string
    - output_string << char unless char == output_string[-1]
* STOP MOVING through input string when the method has iterated through all the characters in the input string.
=end

def crunch(input_string)
  output_string = ""
  return output_string if input_string.empty?
  output_string << input_string[0]
  input_string.each_char.with_index do |char, index|
    output_string << char unless char == output_string[-1]
  end
  output_string
end

p crunch('ddaaiillyy ddoouubbllee') == 'daily double'
p crunch('4444abcabccba') == '4abcabcba'
p crunch('ggggggggggggggg') == 'g'
p crunch('a') == 'a'
p crunch('') == ''