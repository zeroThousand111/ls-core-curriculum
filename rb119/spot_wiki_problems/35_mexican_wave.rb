=begin
35. Mexican Wave
(​https://www.codewars.com/kata/58f5c63f1e26ecda7e000029/train/ruby​) 
6 kyu

In this simple Kata your task is to create a function that turns a string into a Mexican Wave. You will be passed a string and you must return that string in an array where an uppercase letter is a person standing up.
Rules
1. The input string will always be lower case but maybe empty.
2. If the character in the string is whitespace then pass over it as if it was an empty seat.

# PROBLEM
## INPUT: a string
## OUTPUT: an array of strings
## RULES
### Explicit requirements:
  - a method;
  - no capital letters, but empty strings are possible
  - ignore whitespace
### Implicit requirements:
  - the number of strings in the returned array is the same number of alphabetic characters in the input string
  - white space in the input string is preserved in the output strings, including leading and trailing whitespace
  

# EXAMPLES
p wave("hello") == ["Hello", "hEllo", "heLlo", "helLo", "hellO"]
p wave("codewars") == ["Codewars", "cOdewars", "coDewars", "codEwars", "codeWars", "codewArs", "codewaRs", "codewarS"]
p wave("") == []
p wave("two words") == ["Two words", "tWo words", "twO words", "two Words", "two wOrds", "two woRds", "two worDs", "two wordS"]
p wave(" gap ") == [" Gap ", " gAp ", " gaP "]

# DATA STRUCTURES
Input: string
Output: an array of strings, n string where n = string.length
Intermediate: an array of string characters for the input string

# ALGORITHM
* CREATE an empty output_array
* CREATE a local variable n, where n is the number of alphabetic characters in the input string
  + n = input_string.delete(" ").length
* CREATE an array of characters of the input string, including white space
  + use #chars
    - array_of_chars = input_string.chars
* CREATE local variable cap = 0
* MOVE through the array of characters from first to last n times
  + use 
    - n.times do |iteration|
        array_of_chars.each_with_index do |char|
* CREATE word local variable and set to ""
* DETERMINE if current char is alphabetic char ie. not whitespace and if it's index matches the value of cap variable
  + use #match?
    - char.match?(/[a-z]/)
  + use #==
    - index == cap
* ACT upon the determination
  + IF char is alphabetic AND cap == index then SHOVEL uppercase char to word variable and increment 
    - word << char.upcase
  + IF char is alphabetic but NOT cap, then SHOVEL lowercase char to word variable
    - word << char
  + IF char is NOT alphabetic whitespace to word
    - word << char
  + IF char is NOT alph
* STOP moving through array of characters, push and increment cap variable by 1
    - cap += 1
* STOP iterating after n number of times
* RETURN the array of strings

=end

def wave(input_string)
  output_array = []
  n = input_string.length
  array_of_chars = input_string.chars
  cap_index = 0
  n.times do |iteration|
    if input_string[cap_index] == " "
      cap_index += 1
      next
    end
    word = ""
    array_of_chars.each_with_index do |char, index|
      
      if char.match?(/[a-z]/)
        index == cap_index ? word << char.upcase : word << char
      else
        word << char
      end
      
    end
    cap_index += 1
    output_array << word
  end
  
  
  output_array
  
end

p wave("hello") == ["Hello", "hEllo", "heLlo", "helLo", "hellO"]
p wave("codewars") == ["Codewars", "cOdewars", "coDewars", "codEwars", "codeWars", "codewArs", "codewaRs", "codewarS"]
p wave("") == []
p wave("two words") == ["Two words", "tWo words", "twO words", "two Words", "two wOrds", "two woRds", "two worDs", "two wordS"]
p wave(" gap ") == [" Gap ", " gAp ", " gaP "]