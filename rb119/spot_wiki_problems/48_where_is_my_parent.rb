=begin
48. Where is my parent!?(cry)
(​https://www.codewars.com/kata/58539230879867a8cd00011c/train/ruby​ )
Where's my parent?
6 kyu
Mothers arranged a dance party for the children in school. At that party, there are only mothers and their children. All are having great fun on the dance floor when suddenly all the lights went out. It's a dark night and no one can see each other. But you were flying nearby and you can see in the dark and have ability to teleport people anywhere you want.
Legend:
-Uppercase letters stands for mothers, lowercase stand for their children, i.e. "A" mother's children are "aaaa". -Function input: String contains only letters, uppercase letters are unique.
Task:
Place all people in alphabetical order where Mothers are followed by their children, i.e. "aAbaBb" => "AaaBbb". 

# PROBLEM
## INPUT: a string
## OUTPUT: a string
## RULES
### Explicit requirements:
  - uppercase letters are mothers
  - lowercase letters are children
  - group the moethers first, with their children in the return string
  - in other words, sort the letters of the input string into a custom alphabetical order

### Implicit requirements:
  - this order does not fit Asciibetical order
  - the letters retain their original case

# EXAMPLES
p find_children("abBA") == "AaBb"
p find_children("AaaaaZazzz") == "AaaaaaZzzz"
p find_children("CbcBcbaA") == "AaBbbCcc"
p find_children("xXfuUuuF") == "FfUuuuXx"
p find_children("") == "" # empty

# DATA STRUCTURES
Input: a string
Intermediate: an array of substrings, where each substring is of same letter
Output: a string

# ALGORITHM
## HIGH-LEVEL
1. CREATE a custom reference array containing the custom order of letters
2. BUILD an output string by moving through the custom order one char at a time

1. CREATE a custom reference array containing the custom order of letters
* CREATE a custom reference array
  + custom_order = ["A", "a", "B", "b", etc]
2. BUILD an output string by moving through the custom order one char at a time
* CREATE an empty output string
* MOVE through the custom order array from first char to the last
  = use #each
  + ref_char
* MOVE through the input string one character at time from first to last
  + use #each_char
  + string_char
* IF the string_char == ref_char then SHOVEL it to the output string
* STOP moving through the input string
* STOp moving through the reference array
* RETURN the output string

=end
ORDER = ["A", "a", "B", "b", "C", "c", "F", "f", "U", "u", "X", "x", "Z", "z"]

def find_children(input_string)
  output_string = ""
  ORDER.each do |ref_char|
    input_string.each_char do |string_char|
      output_string << string_char if ref_char == string_char
    end
  end
  output_string
end

p find_children("abBA") == "AaBb"
p find_children("AaaaaZazzz") == "AaaaaaZzzz"
p find_children("CbcBcbaA") == "AaBbbCcc"
p find_children("xXfuUuuF") == "FfUuuuXx"
p find_children("") == ""