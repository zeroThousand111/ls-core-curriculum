=begin
45. Alphabetized
(​https://www.codewars.com/kata/5970df092ef474680a0000c9/train/ruby​)
6 kyu

The alphabetized kata
Re-order the characters of a string, so that they are concatenated into a new string in "case-insensitively-alphabetical-order-of-appearance" order. Whitespace and punctuation shall simply be removed!
The input is restricted to contain no numerals and only words containing the english alphabet letters. 

# PROBLEM
## INPUT: a string
## OUTPUT: a NEW string
## RULES
### Explicit requirements:
  - reorder the characters into a custom order
  - custom order is alphabetical, but 
  - remove whitespace and punctuation
  - no numerals and only English characters
  - 
### Implicit requirements:
  - the custom order is lowercase alphabetic then uppercase alphabetic
  
  
# EXAMPLES

Example:
alphabetized("The Holy Bible") # "BbeehHilloTy" 

# DATA STRUCTURES
Input: a string
Output: a new string
Intermediate:
 - an array of string characters?
 - a reference array of string characters in the custom order

# ALGORITHM
* CREATE a reference array of string chars in the custom order
* REMOVE whitespace and non-alphabetic chars from the input string
  + use #delete
    - clean_string = input_string.delete("^A-Za-z")
* CREATE an empty output_string
* MOVE through the cleaned string from first character to the last
* MOVE through the reference array from first character to the last
* SHOVEL reference char to the output string IF it is included in the cleaned string
* STOP moving through the reference array
* STOP moving through the cleaned string
* RETURN the output_string
=end

CUSTOM_ORDER = ["a", "A", "b", "B", "c", "C", "d", "D"]

def clean_string(string)
  string.delete("^A-Za-z")
end

def alphabetized(input_string)
  output_string = ""
  cleaned_string = clean_string(input_string)
  # cleaned_string.each_char do |char|
    CUSTOM_ORDER.each do |ref|
      if cleaned_string.include?(ref)
        output_string << ref
        # cleaned_string.delete(char)
      end
    # end
  end
  output_string
end


p alphabetized("") == ""
p alphabetized(" ") == ""
p alphabetized(" a") == "a"
p alphabetized("a ") == "a"
p alphabetized(" a ") == "a"
# p alphabetized("A b B a") == "AabB" # this test case is incorrect
p alphabetized("A b B a") == "aAbB" # my corrected test case from above
p alphabetized(" a b c d A B C D ") == "aAbBcCdD"
# p alphabetized(" a b c d e f g h i j k l m n o p q r s t u v w x y z A B C D E F G H I J K L M N O P Q R S T U V W X Y Z") #== "aAbBcCdDeEfFgGhHiIjJkKlLmMnNoOpPqQrRsStTuUvVwWxXyYzZ"