=begin
# Problem
Implement a caesar cipher that takes in a string and the shift factor and then outputs the modified string

Quick Tips:

You will need to remember how to convert a string into a number.
Don’t forget to wrap from z to a.
Don’t forget to keep the same case.

## Input: A string
## Output: A new modified string
## Rules:
### Explicit requirements
  - The output string
  - The cases of the letters in the output string should be the same as the input string
### Implicit requirements
  - A positive number means a shift of letter to the RIGHT up the alphabet i.e. "a" shifted by 5 is "f"
  - Non-letters, such as spaces, will be ignored.
# Examples/Test Cases
caesar_cipher("What a string!", 5)
=> "Bmfy f xywnsl!"

# Data Structures
Strings input and output
A hash will help link letters with numbers
An array of characters of input and output strings may help? (But maybe not necessary?)

# Algorithm

1.CREATE two hashes of alpabetic characters with their corresponding number of their order in the alphabet e.g. "a" => 1, one uppercase and one lowercase
2.CREATE an empty output string
3.MOVE through the string object
  a.turn the string into an array of characters OR
  b.use a method like `#each_char` to iterate through every character
4.CATEGORISE what the current character is
  a.is it a lower
5.ACT on what the current character is
  a. IF the character is not a letter, then add it to the output_string unmodified
  b. IF the character is an uppercase character, add the uppercase character shifted the number of times in the shift factor to the output_string
    i. What if the letter index plus shift factor is greater than 26?
  c. IF the character is a lowercase character, add the lowercase character shifted the number of times in the shift factor to the output_string
=end

# Code
require 'pry'
require 'pry-byebug'

UPPER_ALPHABET = { 
  1 => "A",
  2 => "B",
  3 => "C",
  4 => "D",
  5 => "E",
  6 => "F",
  7 => "G",
  8 => "H",
  9 => "I",
  10 => "J",
  11 => "K",
  12 => "L",
  13 => "M",
  14 => "N",
  15 => "O",
  16 => "P",
  17 => "Q",
  18 => "R",
  19 => "S",
  20 => "T",
  21 => "U",
  22 => "V",
  23 => "W",
  24 => "X",
  25 => "Y",
  26 => "Z"
}

LOWER_ALPHABET = { 
  1 => "a",
  2 => "b",
  3 => "c",
  4 => "d",
  5 => "e",
  6 => "f",
  7 => "g",
  8 => "h",
  9 => "i",
  10 => "j",
  11 => "k",
  12 => "l",
  13 => "m",
  14 => "n",
  15 => "o",
  16 => "p",
  17 => "q",
  18 => "r",
  19 => "s",
  20 => "t",
  21 => "u",
  22 => "v",
  23 => "w",
  24 => "x",
  25 => "y",
  26 => "z"
}

def caesar_cipher(string, shift_factor)
  output_string = ""
  string.each_char do |char|
    # binding.pry
    if UPPER_ALPHABET.values.include?(char)
      shift_value = UPPER_ALPHABET.key(char) + shift_factor
      if shift_value > 26
        shift_value = shift_value - 26
      end
      output_string << UPPER_ALPHABET[shift_value]
    elsif LOWER_ALPHABET.values.include?(char)
      shift_value = LOWER_ALPHABET.key(char) + shift_factor
      if shift_value > 26
        shift_value = shift_value - 26
      end
      output_string << LOWER_ALPHABET[shift_value]
    else
      output_string << char
    end
  end
  
  output_string
end

# print tests

# p caesar_cipher("a", 5) # "f"
# p caesar_cipher("A", 5) # "F"
# p caesar_cipher("Z", 1) # "A"
# p caesar_cipher("z", 1) # "a"
# p caesar_cipher("What a string!", 5) # "Bmfy f xywnsl!"
# p caesar_cipher("My name is Maximus Meridius.  And I am SPARTACUS!", 11) # ?
p caesar_cipher("Hi! And nothing else...", 6) # ?

# test cases

# p caesar_cipher("What a string!", 5) == "Bmfy f xywnsl!"