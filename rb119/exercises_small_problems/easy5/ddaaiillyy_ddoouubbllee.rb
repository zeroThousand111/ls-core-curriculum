=begin
______________________________________________________________________________
*****Understand the PROBLEM*****
______________________________________________________________________________
THE PROBLEM:

Write a method that takes a string argument and returns a new string that contains the value of the original string with all consecutive duplicate characters collapsed into a single character. You may not use String#squeeze or String#squeeze!.

INPUT: A string

OUTPUT: A new string

RULES
EXPLICIT REQUIREMENTS:
  - A new string, not mutated argument;
  - All consecutive duplicate characters condensed to just one character
  - String#squeeze or String#squeeze! not allowed
  
IMPLICIT REQUIREMENTS:
  - One character and empty strings are allowed
  -
  -

______________________________________________________________________________
*****EXAMPLES/TEST CASES*****
______________________________________________________________________________

crunch('ddaaiillyy ddoouubbllee') == 'daily double'
crunch('4444abcabccba') == '4abcabcba'
crunch('ggggggggggggggg') == 'g'
crunch('a') == 'a'
crunch('') == ''
______________________________________________________________________________
*****DATA STRUCTURES*****
______________________________________________________________________________

Strings, maybe arrays
______________________________________________________________________________
*****ALGORITHM*****
______________________________________________________________________________

1.CREATE new empty string 
2.ITERATE through the input string
  a.Simple loop with index as counter; OR
  b.Turn string to array of characters and use Array#each
    i.
3.CHECK if the next character is the same 
  a.Is string[n] == string[n + 1]?
    i.
4.DELETE that character if the next character is the same
  a. string#delete! will delete ALL instances of a character, so that's not helpful for this problem
  b. string#gsub! will be better 
    i.new_string.gsub!('#{new_string[string_index + 1]}', '')
5.Return new string
  a.
    i.
5.
  a.
    i.
______________________________________________________________________________

Now CODE with intent!
=end

require 'pry'
require 'pry-byebug'

# solution 1 - Using a simple loop string

def crunch(string)
  new_string = ''
  index = 0
  
  loop do
    break if index == string.length
    unless string[index] == string[index + 1]
      new_string << string[index]
    end
    index +=1
  end
  new_string
end

# -------------------

# solution 2 - Iterating through an Array of characters

# def crunch(string)
#   array = string.chars
#   new_array = []
#   array.each_index do |index|
#     new_array << array[index] unless array[index] == array[index + 1]
#   end
#   new_array.join
# end

# -------------------

# solution 3 - 

# -------------------

# solution 4 - 

# -------------------

# solution 5 - 

# -------------------

# Print Tests
p crunch('ddaaiillyy ddoouubbllee') # 'daily double'
p crunch('4444abcabccba') # '4abcabcba'
p crunch('ggggggggggggggg') # 'g'

p crunch('xxyxxy')

# Test Cases
p crunch('ddaaiillyy ddoouubbllee') == 'daily double'
p crunch('4444abcabccba') == '4abcabcba'
p crunch('ggggggggggggggg') == 'g'
p crunch('a') == 'a'
p crunch('') == ''