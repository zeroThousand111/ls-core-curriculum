=begin
41. Backspaces in string
(​https://www.codewars.com/kata/5727bb0fe81185ae62000ae3/train/ruby​)
6 kyu
Assume "#" is like a backspace in string. This means that string "a#bc#d" actually is "bd"
Your task is to process a string with "#" symbols.


Examples
"abc#d##c" ==> "ac" 
"abc##d######" ==> ""
"#######" ==> ""
"" ==> ""

# PROBLEM
## INPUT: a string containing hash symbols
## OUTPUT: the same string with some charcters deleted
## RULES
### Explicit requirements:
  - the symbol "#" acts like a backspace, but what does this mean?!
### Implicit requirements:
  - a backspace deletes the preceding character
  - multiple n backspaces delete the preceding n characters
  - 

# DATA STRUCTURES
input: a string
intermediate: building and deleting the output string
output: a string

# ALGORITHM

* CREATE an empty output string
    - output_string = ""
* MOVE through the characters of the input string, from first to the last
  + use #each_char
* DETERMINE what the current char is: an alphabetic char, or a #
* ACT upon the above determination
  + IF the char is alphabetic, SHOVEl it to the output string
  + IF the char is #, delete the last char in the output string
* STOP moving through the input string
* RETURN the output string

=end

def clean_string(input_string)
  output_string = ""
  input_string.each_char do |char|
    if char == "#" && !output_string.empty?
      output_string[-1] = "" 
    else
      output_string << char
    end
  end
  output_string
end

p clean_string('abc#d##c') == "ac"
p clean_string('abc####d##c#') == ""

