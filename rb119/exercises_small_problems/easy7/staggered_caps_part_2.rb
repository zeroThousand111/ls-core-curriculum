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
1. Requirement — The important, generalized steps required to navigate from the input to the desired output.
  a. Approach — The process that will be utilized to accomplish each Requirement.
    i. Procedure — Specific details to implement the Approach.


1.
  a.
    i.
2.
  a.
    i.
3.
  a.
    i.
4.
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

# Previous solution to PART 1

# def staggered_case(string)
#   string.chars.map.with_index do |char, index|
#     if char.match?(/[A-Za-z]/)
#       if index.odd?
#         char.upcase
#       else
#         char.upcase
#       end
#     else
#       char
#     end
#   end.join
# end

# -------------------

# solution 1 - Using a boolean caps_switch and a simple loop

def staggered_case(string)
  new_string = ''
  index = 0
  caps_switch = true
  loop do
    if string[index].match?(/[^A-Za-z]/)
      new_string << string[index]
    else
      if caps_switch == false
        new_string << string[index].downcase
        caps_switch = !caps_switch
      else
        new_string << string[index].upcase
        caps_switch = !caps_switch
      end
    end
    index += 1
    break if index == string.length
  end
  new_string
end

# -------------------

# solution 2 - using String#each_char to iterate instead of a loop

def staggered_case(string)
  new_string = ''
  caps_switch = true
  
  string.each_char do |char|
    if char.match?(/[^A-Za-z]/)
      new_string << char
    else
      if caps_switch == false
        new_string << char.downcase
        caps_switch = !caps_switch
      else
        new_string << char.upcase
        caps_switch = !caps_switch
      end
    end
  end
  
  new_string
end

# -------------------

# solution 3 - #map not useful, because #map has to account for every character in the collection, can't skip and can't have the switch easily embedded

# -------------------

# solution 4 - 

# -------------------

# solution 5 - 

# -------------------

# Print Tests
p staggered_case('ALL CAPS') # 'AlL CaPs'

# Test Cases
p staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
p staggered_case('ALL CAPS') == 'AlL cApS'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'