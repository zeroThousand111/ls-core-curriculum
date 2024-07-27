=begin

60. Format a string of names like 'Bart, Lisa & Maggie'.
(​https://www.codewars.com/kata/53368a47e38700bd8300030d​2) 
6 kyu

Given: an array containing hashes of names
Return: a string formatted as a list of names separated by commas except for the last two names, which should be separated by an ampersand.

# PROBLEM
## INPUT: an array of single key-value pair hashes
## OUTPUT: a new string of names
## RULES
### EXPLICIT REQUIREMENTS:
  - return a formatted string containing the names in the input array
  - names are only with alphabetic characters and a hyphen
  - names should be formatted with separation by comma, aside from the last name should have an ampersand &
  
### IMPLICIT REQUIREMENTS
  - array can have 1, 2 or three name hashes
  - an empty array is possible

# EXAMPLES
Example:
list([ {name: 'Bart'}, {name: 'Lisa'}, {name: 'Maggie'} ]) # returns 'Bart, Lisa & Maggie'
list([ {name: 'Bart'}, {name: 'Lisa'} ]) # returns 'Bart & Lisa'
list([ {name: 'Bart'} ]) # returns 'Bart'
  
list([])
# returns ''
Note: all the hashes are pre-validated and will only contain A-Z, a-z, '-' and '.'. 

# DATA STRUCTURE
## INPUT: an array containing one or more "name hashes" i.e. [ {name: 'Bart'}, {name: 'Lisa'}, {name: 'Maggie'} ]
## OUTPUT: a new string with format "name, name & name"
## INTERMEDIATE: ?

# ALGORITHM
## HIGH-LEVEL
1. COUNT how many name hashes are present in the input array
2. DECIDE upon course of string format, depending upon number of name hashes present
3. BUILD a new output string based upon above decision
4. RETURN output string

1. COUNT how many name hashes are present in the input array
* count the number of hashes
  + use Array#size
2. DECIDE upon course of string format, depending upon number of name hashes present
* Use a CASE statement to decide upon action based on count variable
  + WHEN count is 0, then return empty string ""
  + WHEN count is 1, then add name to output string
    - output << array[0][:name]
  + WHEN count is 2
    - output << array[0][:name]
    - output << " & "
  + WHEN count is 3 (or more)
    + MOVE through the array from first hash to the penultimate hash
      + use #each_index
      - output << array[index][:name] << " ,"
3. BUILD a new output string based upon above decision
4. RETURN output string


=end

def list(array)
  count = array.size
  output = ""
  case count
  when 1
    output << array[0][:name]
  when 2
    output << array[0][:name]
    output << " & "
    output << array[1][:name]
  end
  if count >= 3
    array.each_index do |index|
      output << array[index][:name] << ", "
      break if index == array.size - 2
    end
    output << "& " << array[-1][:name]
  end
  
  output
end

p list([])
p list([{name: 'Bart'}])
p list([{name: 'Bart'}, {name: 'Lisa'}])
p list([{name: 'Bart'}, {name: 'Lisa'}, {name: 'Maggie'}])