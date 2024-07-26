=begin
59. Which are in?
(​https://www.codewars.com/kata/550554fd08b86f84fe000a58​)
6 kyu

Given two arrays of strings a1 and a2 return a sorted array r in lexicographical order of the strings of a1 which are substrings of strings of a2.

Notes:
Arrays are written in "general" notation. See "Your Test Cases" for examples in your language.
In Shell bash a1 and a2 are strings. The return is a string where words are separated by commas.
Beware: r must be without duplicates. Don't mutate the inputs.

# PROBLEM
## INPUT: two arrays of srings, a1 and a2
## OUTPUT: a NEW array of strings r from elements of a1, if they can be found in the elements of a2
## RULES
### Explicit requirements:
  - r should have no duplicates
  - 

#Example 1: a1 = ["arp", "live", "strong"]
a2 = ["lively", "alive", "harp", "sharp", "armstrong"]
returns ["arp", "live", "strong"]
#Example 2: a1 = ["tarp", "mice", "bull"]
a2 = ["lively", "alive", "harp", "sharp", "armstrong"]
returns []

# ALGORITHM
* CREATE an empty output array r
* MOVE through a1 from the first string to the last
* FOR current string, MOVE through the strings of a2 from the first string to the last
* DETERMINE if the current a1 string is in any of the strings of a2
* ACT upon the above determination
  * IF the current a1 string can be found in a2, then SHOVEL it to output array
  * ELSE move on
* STOP moving through a1 strings
* SORT output array in alphabetical order and RETURN

=end

def which_are_in(a1, a2)
  output = []
  a1.each do |string_a1| 
    a2.each do |string_a2|
      if string_a2.include?(string_a1)
        output << string_a1
        break
      end
    end
  end
  output.sort
end

p which_are_in(["arp", "live", "strong"], ["lively", "alive", "harp", "sharp", "armstrong"]) == ["arp", "live", "strong"]
p which_are_in(["tarp", "mice", "bull"], ["lively", "alive", "harp", "sharp", "armstrong"]) == []