=begin
______________________________________________________________________________
*****Understand the PROBLEM*****
______________________________________________________________________________
THE PROBLEM:
Modify the method from the previous exercise so it ignores non-alphabetic characters when determining whether it should uppercase or lowercase each letter. The non-alphabetic characters should still be included in the return value; they just don't count when toggling the desired case.

INPUT:

OUTPUT:

RULES
EXPLICIT REQUIREMENTS:
  - 
  -
  -
  
IMPLICIT REQUIREMENTS:
  -
  -
  -

______________________________________________________________________________
*****EXAMPLES/TEST CASES*****
______________________________________________________________________________

staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
staggered_case('ALL CAPS') == 'AlL cApS'
staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'

______________________________________________________________________________
*****DATA STRUCTURES*****
______________________________________________________________________________

______________________________________________________________________________
*****ALGORITHM*****
______________________________________________________________________________

1. Turn input string into a list of characters;
2. Turn upcase switch on;
3. Iterate through list of characters:
  a. Capitalise first character, then flip the switch;
  b. If next character is not a letter, return character and don't flip switch;
  c. If next character is a letter, return lowercase version and flip switch.
3. Join new array into new string;
4. Return new string.
______________________________________________________________________________

Now CODE with intent!
=end

# solution 1 - build an output array using a simple loop

# def staggered_case(input_string)
#   array_chars = input_string.chars
#   new_array = []
#   counter = 0
#   switch = true
  
#   loop do
    
#     if array_chars[counter] =~ /[A-Za-z]/
#       if switch
#         new_array << array_chars[counter].upcase
#         switch = !switch
#       else
#         new_array << array_chars[counter].downcase
#         switch = !switch
#       end
#     else
#       new_array << array_chars[counter]
#     end
    
#     counter += 1
#     break if counter == array_chars.size
#   end
  
#   new_array.join
# end

# solution 2a - build an output array using #each iterator

# def staggered_case(input_string)
#   array_chars = input_string.chars
#   new_array = []
#   switch = true
  
#   array_chars.each do |char|
#     if char =~ /[A-Za-z]/
#       if switch
#         new_array << char.upcase
#         switch = !switch
#       else
#         new_array << char.downcase
#         switch = !switch
#       end
#     else
#       new_array << char
#     end
#   end
  
#   new_array.join
# end

# solution 2b - solution 2a refactored - build an output array using #each iterator

# def staggered_case(input_string)
#   new_array = []
#   switch = true
  
#   input_string.chars.each do |char|
#     if char =~ /[A-Za-z]/
#       if switch
#         new_array << char.upcase
#         switch = !switch
#       else
#         new_array << char.downcase
#         switch = !switch
#       end
#     else
#       new_array << char
#     end
#   end
  
#   new_array.join
# end

# solution 3 - using #map

def staggered_case(input_string)
  
  switch = true
  
  input_string.chars.map do |char|
    if char =~ /[A-Za-z]/
      if switch
        switch = !switch
        char.upcase
      else
        switch = !switch
        char.downcase
      end
    else
      char
    end
  end.join
  
end

# solution 4 - Further Exploration

def account_for_non_letters(string)
  switch = true
  string.chars.map do |char|
    if char =~ /[A-Za-z]/
      if switch
        switch = !switch
        char.upcase
      else
        switch = !switch
        char.downcase
      end
    else
      char
    end
  end.join
end

def discount_for_non_letters(string)
  string.chars.map.with_index do |char, index|
    if char =~ /[A-Za-z]/
      if index.even?
        char.upcase
      else
        char.downcase
      end
    else
      char
    end
  end.join
end


def staggered_case(input_string, keyword)
  if keyword == 'account'
    account_for_non_letters(input_string)
  elsif keyword == 'discount'
    discount_for_non_letters(input_string)
  end
end


# Print Tests
# p staggered_case('I Love Launch School!') #'I lOvE lAuNcH sChOoL!'


# # Test Cases

# p staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
# p staggered_case('ALL CAPS') == 'AlL cApS'
# p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'

# Further Exploration Print Tests
p staggered_case('I Love Launch School!', 'account') #'I lOvE lAuNcH sChOoL!'
p staggered_case('I Love Launch School!', 'discount') #'I lOvE lAuNcH sChOoL!'