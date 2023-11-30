=begin
________________________________________________________________________________
*****Problem*****

Write a method that takes a string argument and returns a new string that contains the value of the original string with all consecutive duplicate characters collapsed into a single character. You may not use String#squeeze or String#squeeze!.
________________________________________________________________________________
Input:
  # What is the form of the data you want to transform?
  
  A random string
  
Output:
  # What is the form of the data you want the program to either return or print?
  
  A NEW string 
  
Explicit reqs:
  # What does the problem say about what you should do?
  - Remove ("squeeze out") all consecutive duplicate characters aside from one;
  - String#squeeze and String#squeeze! are not allowed;
  
Implicit reqs:
  # What does the problem NOT say about what you need to have covered?
  - The removal applies to all characters, not just letters;
  - An empty string input returns an empty string output;
________________________________________________________________________________
*****Examples/Test cases*****
________________________________________________________________________________
Test cases:
  # What are some examples of expected outputs for a given input? Be thorough
  
  crunch('ddaaiillyy ddoouubbllee') == 'daily double'
  crunch('4444abcabccba') == '4abcabcba'
  crunch('ggggggggggggggg') == 'g'
  crunch('a') == 'a'
  crunch('') == ''
________________________________________________________________________________
*****Data structures*****
________________________________________________________________________________
Data manipulation strategy:
  # What forms do your data take on while the program is running?
  
  Input is a string

  Interim might be an array of characters?
  
  Output is a string
________________________________________________________________________________
*****Algorithm*****
________________________________________________________________________________
Step-by-step process (plaintext or pseudocode):
  # The logical process by which you intend to tackle the problem at hand
  
  HIGH LEVEL
  1. Take the next character of the input string and compare it to the one after;
  2. If the next and nextnext character of the input string are the same, then delete the nextnext;
  3. Move on through the string until all characters have been compared
    a. Can't compare the last character with anything!
  adsf
  
________________________________________________________________________________
Time to code!
=end

# solution 1: Select non-duplicates only.  Use a simple loop

# def crunch(input_string)
#   return input_string if input_string == ''
#   array = input_string.chars
#   counter = 0
#   non_dups = []
#   loop do
#     unless array[counter] == array[counter + 1]
#       non_dups.push(array[counter])
#     end
#     counter += 1
#     break if counter == (array.length)
#   end
#   non_dups.join
# end

# solution 2: Use Array#select on non-duplicates - can't get this to work!

# def crunch(input_string)
#   return input_string if input_string == ''
#   array = input_string.chars
  
#   non_dups = array.select do |char|
#     char != array[char + 1] # how to compare against the next in the array?
#   end
  
#   non_dups.join
# end


# solution 3: LS Official Solution

def crunch(text)
  index = 0
  crunch_text = ''
  while index <= text.length - 1
    crunch_text << text[index] unless text[index] == text[index + 1]
    index += 1
  end
  crunch_text
end

# Print Tests
p crunch('ggggggggggggggg') # 'g'
p crunch('ddaaiillyy ddoouubbllee') # 'daily double'

# Test Cases
p crunch('ddaaiillyy ddoouubbllee') == 'daily double'
p crunch('4444abcabccba') == '4abcabcba'
p crunch('ggggggggggggggg') == 'g'
p crunch('a') == 'a'
p crunch('') == ''