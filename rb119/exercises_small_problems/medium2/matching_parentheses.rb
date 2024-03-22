=begin
______________________________________________________________________________
*****Understand the PROBLEM*****
______________________________________________________________________________
THE PROBLEM:
Write a method that takes a string as an argument, and returns true if all parentheses in the string are properly balanced, false otherwise. To be properly balanced, parentheses must occur in matching '(' and ')' pairs.

Note that balanced pairs must each start with a (, not a ).

INPUT:

OUTPUT:

RULES
EXPLICIT REQUIREMENTS:
  - balanced pairs must each start with a (, not a ).
  -
  -
  
IMPLICIT REQUIREMENTS:
  - For every ( there must be a )
  - It isn't as simple as saying the number of ( == )
  - The conditions for a `true` return are:
    - Overall the number of ( == ) AND
    - Count ( and ).  If the count of ) ever exceeds (, then return false
  
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

Strings

______________________________________________________________________________
*****ALGORITHM*****
______________________________________________________________________________
1. Requirement — The important, generalized steps required to navigate from the input to the desired output.
  a. Approach — The process that will be utilized to accomplish each Requirement.
    i. Procedure — Specific details to implement the Approach.


1.CREATE two local variables to count ( and ) characters
  a.
    i.open_parentheses_count = 0, close_parentheses_count = 0
2.MOVE through the string
  a.Could use a simple loop
  b.Could use String#each_char
  c.
    i.
3.EXAMINE each character of the string
  a.
    i.
4.INCREMENT count variables if character is '(' or ')'
  a.
    i.
5.RETURN false if at any stage close_parentheses_count is greater than open_parentheses_count
  a.
    i.
6.After whole string iteration complete, compare count variables and return false if they are not equal
7.Return true if string hasn't already returned false by failing one of the two above conditions
______________________________________________________________________________

Now CODE with intent!
=end

require 'pry'
require 'pry-byebug'

# solution 1 - using String#each_char to iterate through the input string

def balanced?(string)
  open_parentheses_count = 0
  close_parentheses_count = 0
  
  string.each_char do |char|
    if char.include?('(')
      open_parentheses_count += 1
    elsif char.include?(')')
      close_parentheses_count += 1
    end
    return false if close_parentheses_count > open_parentheses_count
  end
  return false if open_parentheses_count != close_parentheses_count
  true
end

# -------------------

# solution 2 - LS approach using just one tally variable but using my terminology with no esoteric Ruby methods

def balanced?(string)
  parentheses_tally = 0
  
  string.each_char do |char|
    if char.include?('(')
      parentheses_tally += 1
    elsif char.include?(')')
      parentheses_tally -= 1
    end
    return false if parentheses_tally < 0
  end
  parentheses_tally == 0
end


# -------------------

# solution 3 - FURTHER EXPLORATION - taking into account curly brackets and square brackets too

def balanced?(string)
  parentheses_tally = 0
  curly_tally = 0
  square_tally = 0
  
  string.each_char do |char|
    case
    when char.include?('(') then parentheses_tally += 1
    when char.include?(')') then parentheses_tally -= 1
    when char.include?('{') then curly_tally += 1
    when char.include?('}') then curly_tally -= 1
    when char.include?('[') then square_tally += 1
    when char.include?(']') then square_tally -= 1
    end
    
    return false if parentheses_tally < 0 || curly_tally < 0 || square_tally < 0
  end
  parentheses_tally == 0 && curly_tally == 0 && square_tally == 0
end

# -------------------

# solution 4 - FURTHER EXPLORATION - refactor of above using a much simpler different method to check characters in a case statement - no need to use String#include?

def balanced?(string)
  parentheses_tally = 0
  curly_tally = 0
  square_tally = 0
  
  string.each_char do |char|
    case char
    when '(' then parentheses_tally += 1
    when ')' then parentheses_tally -= 1
    when '{' then curly_tally += 1
    when '}' then curly_tally -= 1
    when '[' then square_tally += 1
    when ']' then square_tally -= 1
    end
    
    return false if parentheses_tally < 0 || curly_tally < 0 || square_tally < 0
  end
  parentheses_tally == 0 && curly_tally == 0 && square_tally == 0
end

# -------------------

# solution 5 - 

# -------------------

# Print Tests

# Test Cases
# p balanced?('What (is) this?') == true
# p balanced?('What is) this?') == false
# p balanced?('What (is this?') == false
# p balanced?('((What) (is this))?') == true
# p balanced?('((What)) (is this))?') == false
# p balanced?('Hey!') == true
# p balanced?(')Hey!(') == false
# p balanced?('What ((is))) up(') == false
# p balanced?('What ())(is() up') == false

# FURTHER EXPLORATION Test Cases
p balanced?(')Hey!(') == false
p balanced?('((What) (is this))?') == true
p balanced?('({[ What ]})') == true
p balanced?('({[ What )') == false
p balanced?(']})({[ What ') == false