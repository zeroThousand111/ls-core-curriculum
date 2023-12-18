=begin
______________________________________________________________________________
*****Understand the PROBLEM*****
______________________________________________________________________________
THE PROBLEM:

Write a method that takes a String as an argument, and returns a new String that contains the original value using a staggered capitalization scheme in which every other character is capitalized, and the remaining characters are lowercase. Characters that are not letters should not be changed, but count as characters when switching between upper and lowercase.

INPUT: A string

OUTPUT: A NEW string

RULES
EXPLICIT REQUIREMENTS:
  - New string returned;
  - Alternating capitals and lowercase;
  - Non-letters are not changed;
  - Non-letters count for purposes of staggered caps/lowercase.
  
IMPLICIT REQUIREMENTS:
  - First character of string begins with capital;
  -
  -

______________________________________________________________________________
*****EXAMPLES/TEST CASES*****
______________________________________________________________________________

staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
staggered_case('ALL_CAPS') == 'AlL_CaPs'
staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'
______________________________________________________________________________
*****DATA STRUCTURES*****
______________________________________________________________________________

Arrays

______________________________________________________________________________
*****ALGORITHM*****
______________________________________________________________________________

1. Turn input string into a list of characters;
2. Iterate through list of characters:
  a. If character is at an even index number, it should be upper case;
  b. If character is an odd index number, it should be lower case;
  c. Ignore characters that aren't letters.
3. Join new array into new string;
4. Return new string.
N.B. pure #map transformation may not work because the index number needs to be accounted for
______________________________________________________________________________

Now CODE with intent!
=end

# solution 1 - build output array using a simple loop

# def staggered_case(input_string)
#   array_chars = input_string.chars
#   new_array = []
#   counter = 0
  
#   loop do
    
#     if array_chars[counter] =~ /[A-Za-z]/
#       if counter.even?
#         new_array << array_chars[counter].upcase
#       else
#         new_array << array_chars[counter].downcase
#       end
#     else
#       new_array << array_chars[counter]
#     end
    
#     counter += 1
#     break if counter == array_chars.size
#   end
  
#   new_array.join
# end

# solution 2 - build output array using #each

# def staggered_case(input_string)
#   array_chars = input_string.chars
#   new_array = []
  
#   array_chars.each_with_index do |char, index|
#     if char =~ /[A-Za-z]/
#       if index.even?
#         new_array << char.upcase
#       else
#         new_array << char.downcase
#       end
#     else
#       new_array << char
#     end
#   end
  
#   new_array.join
# end

# solution 3 - chaining #map with #with_index

def staggered_case(input_string)
  array_chars = input_string.chars
  new_array = array_chars.map.with_index do |char, index|
    if char =~ /[A-Za-z]/
      if index.even?
        char.upcase
      else
        char.downcase
      end
    else
      char
    end
  end
  new_array.join
end

# solution 4 - official LS solution

# def staggered_case(string)
#   result = ''
#   need_upper = true
#   string.chars.each do |char|
#     if need_upper
#       result += char.upcase
#     else
#       result += char.downcase
#     end
#     need_upper = !need_upper
#   end
#   result
# end


# Further Exploration - create ability for user to change stagger

# def staggered_case(string, keyword)
#   result = ''
#   if keyword == "up"
#     need_upper = true
#   else
#     need_upper = false
#   end
  
#   string.chars.each do |char|
#     if need_upper
#       result += char.upcase
#     else
#       result += char.downcase
#     end
#     need_upper = !need_upper
#   end
#   result
# end

# Print Tests
p staggered_case('I Love Launch School!') # 'I LoVe lAuNcH ScHoOl!'

# Print Tests for Further Exploration
# p staggered_case('I Love Launch School!', "up") # 'I LoVe lAuNcH ScHoOl!'
# p staggered_case('I Love Launch School!', "down") # 'I LoVe lAuNcH ScHoOl!'

# Test Cases
p staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
p staggered_case('ALL_CAPS') == 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'