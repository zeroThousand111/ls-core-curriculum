=begin
______________________________________________________________________________
*****Understand the PROBLEM*****
______________________________________________________________________________
THE PROBLEM:

Write a method that takes a string as an argument, and returns true if all parentheses in the string are properly balanced, false otherwise. To be properly balanced, parentheses must occur in matching '(' and ')' pairs.

INPUT: A string

OUTPUT: A boolean

RULES
EXPLICIT REQUIREMENTS:
  - Return is true if parentheses are "properly balanced", false otherwise
  - To be properly balanced, parentheses must occur in matching '(' and ')' pairs.
  -
  
IMPLICIT REQUIREMENTS:
  - What is "properly balanced"? "Matching '(' and ')'", but what is this?
    - From test cases the number of '(' characters must be the same as the number of ')' characters in the string
    - AND THERE IS ANOTHER CONDITION TO MAKE THEM BALANCED WHICH I CAN'T PUT INTO WORDS, LET ALONE CODE!!
    - BECAUSE The last 3 test cases evaluate to false EVEN THOUGH THEY HAVE THE SAME NUMBER OF OPENING AND CLOSING PARENTHESES
  - Nested parentheses are allowed e.g '(( ))'
  - No parentheses are allowed and return true, because zero '(' and zero ')'
  
https://www.geeksforgeeks.org/check-for-balanced-parentheses-in-an-expression/
______________________________________________________________________________
*****EXAMPLES/TEST CASES*****
______________________________________________________________________________

balanced?('What (is) this?') == true
balanced?('What is) this?') == false
balanced?('What (is this?') == false
balanced?('((What) (is this))?') == true
balanced?('((What)) (is this))?') == false
balanced?('Hey!') == true
balanced?(')Hey!(') == false
balanced?('What ((is))) up(') == false
balanced?('What ())(is() up') == false

______________________________________________________________________________
*****DATA STRUCTURES*****
______________________________________________________________________________
Maybe none needed for this one
______________________________________________________________________________
*****ALGORITHM*****
______________________________________________________________________________

1.Create local variables opening_tally and closing_tally and set to 0
2.Iterate through the string using a simple loop 
  3.If string[0] is a '(' increment tally of opening_tally by 1 and if it is a ')' then increment tally of closing_tally by 1, else do nothing
4.Compare value of opening_tally and closing_tally.  If they are the same then return true, else return false
5.
______________________________________________________________________________

Now CODE with intent!
=end

# solution 1 - Using a simple loop to iterate through the characters of the input_string and an Array "stack" of parentheses in order

def balanced?(string)
  character_index = 0
  stack = []
  
  loop do
    if string[character_index] == '('
      stack << "("
    elsif string[character_index] == ')'
      popped = stack.pop
      return false if popped == nil
    end
      
    character_index += 1
    break if character_index == string.length
  end
  
  stack.empty?
end

# -------------------

# solution 2 - 

# -------------------

# Print Tests

# Test Cases
p balanced?('What (is) this?') == true
p balanced?('What is) this?') == false
p balanced?('What (is this?') == false
p balanced?('((What) (is this))?') == true
p balanced?('((What)) (is this))?') == false
p balanced?('Hey!') == true
p balanced?(')Hey!(') == false
p balanced?('What ((is))) up(') == false
p balanced?('What ())(is() up') == false