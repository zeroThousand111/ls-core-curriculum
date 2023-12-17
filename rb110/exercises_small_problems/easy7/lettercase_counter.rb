=begin
______________________________________________________________________________
*****Understand the PROBLEM*****
______________________________________________________________________________
THE PROBLEM:
Write a method that takes a string, and then returns a hash that contains 3 entries: one represents the number of characters in the string that are lowercase letters, one represents the number of characters that are uppercase letters, and one represents the number of characters that are neither.

INPUT: A String

OUTPUT: A Hash with 3 key-value pairs

RULES
EXPLICIT REQUIREMENTS:
  - A method;
  - The contents of the hash:
    - lowercase represents the number of characters in the string that are lowercase letters;
    - uppercase represents the number of characters that are uppercase letters; and
    - neither represents the number of characters that are neither.
  - 
  
IMPLICIT REQUIREMENTS:
  - Input string may contain letters, numbers, symbols and spaces;
  - Input string can be empty;
  - Spaces, numbers and symbols are counted as "neither";
  - 

______________________________________________________________________________
*****EXAMPLES/TEST CASES*****
______________________________________________________________________________

letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }

______________________________________________________________________________
*****DATA STRUCTURES*****
______________________________________________________________________________

Input string
Output hash
______________________________________________________________________________
*****ALGORITHM*****
______________________________________________________________________________

1.Create a new Hash with three keys and values of zero;
2.Count lowercase letters and then add the total to the value of :lowercase;
3.Count uppercase letters and then add the total to the value of :uppercase;
4.Calculate neither by subtracting (lowercase + uppercase) from string length and add to the value of neither;
5.Return the result hash.
______________________________________________________________________________

Now CODE with intent!
=end

# solution 1 - use String#count

def letter_case_count(string)
  result = { lowercase: 0, uppercase: 0, neither: 0 }
  result[:lowercase] = string.count('a-z')
  result[:uppercase] = string.count('A-Z')
  result[:neither] = string.size - result[:lowercase] - result[:uppercase]
  result
end

# solution 2 - LS official solution uses simple loops and matching of generated arrays using Array#include?

# UPPERCASE_CHARS = ('A'..'Z').to_a
# LOWERCASE_CHARS = ('a'..'z').to_a

# def letter_case_count(string)
#   counts = { lowercase: 0, uppercase: 0, neither: 0 }

#   string.chars.each do |char|
#     if UPPERCASE_CHARS.include?(char)
#       counts[:uppercase] += 1
#     elsif LOWERCASE_CHARS.include?(char)
#       counts[:lowercase] += 1
#     else
#       counts[:neither] += 1
#     end
#   end

#   counts
# end

# solution 3 - LS Official solution uses Array#count and Regex patterns

# def letter_case_count(string)
#   counts = {}
#   characters = string.chars
#   counts[:lowercase] = characters.count { |char| char =~ /[a-z]/ }
#   counts[:uppercase] = characters.count { |char| char =~ /[A-Z]/ }
#   counts[:neither] = characters.count { |char| char =~ /[^A-Za-z]/ }
#   counts
# end

# Print Tests
p letter_case_count('abCdef 123') # { lowercase: 5, uppercase: 1, neither: 4 }

# Test Cases
p letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
p letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
p letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
p letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }