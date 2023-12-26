=begin
______________________________________________________________________________
*****Understand the PROBLEM*****
______________________________________________________________________________
THE PROBLEM:

Write a method that takes a string, and returns a new string in which every consonant character is doubled. Vowels (a,e,i,o,u), digits, punctuation, and whitespace should not be doubled.

INPUT: A string

OUTPUT: A string

RULES
EXPLICIT REQUIREMENTS:
  - A method;
  - Return is a NEW string;
  - every consonant character is doubled
  -Vowels (a,e,i,o,u), digits, punctuation, and whitespace should not be doubled.
  
IMPLICIT REQUIREMENTS:
  - An empty string returns an empty string;
  - Some strings will contain numbers or non-letters
  -

______________________________________________________________________________
*****EXAMPLES/TEST CASES*****
______________________________________________________________________________

double_consonants('String') == "SSttrrinngg"
double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
double_consonants("July 4th") == "JJullyy 4tthh"
double_consonants('') == ""

______________________________________________________________________________
*****DATA STRUCTURES*****
______________________________________________________________________________
Arrays?
______________________________________________________________________________
*****ALGORITHM*****
______________________________________________________________________________

1.
2.
3.
4.
5.
______________________________________________________________________________

Now CODE with intent!
=end

def consonant?(char)
  char =~ /[^aeiou]/ && char.count('A-Za-z') == 1
end

def double_consonants(string)
  result = ''
  string.each_char do |char|
    if consonant?(char)
      result << char << char
    else
      result << char
    end
  end
  result
end

# Print Tests
p double_consonants("July 4th") # "JJullyy 4tthh"

# Test Cases
p double_consonants('String') == "SSttrrinngg"
p double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
p double_consonants("July 4th") == "JJullyy 4tthh"
p double_consonants('') == ""