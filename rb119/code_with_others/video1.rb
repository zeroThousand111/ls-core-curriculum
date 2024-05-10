=begin
Given a non-empty string, check if it can be constructed by taking a substring of it and appending multiple copies of the substring together.  You may assume the given string consists of lowercase English letters only.

# Example 1:
Input: "abab"
Output: True
Explanation: It's the substring "ab" twice

Example 2:
Input: "aba"
Output: False

---

Input: a string
Output: a Boolean true or false
Rules:
Explicit requirements:
  - Return a boolean value
  - Return true if the string can be constructed of mutliple of copies of a any substring, false otherwise
  - Strings always lowercase English letters, no other character
Implicit requirements:
  - A Substring is one or more characters in the input string in the order that they appear in the input string
  - For a true return, the WHOLE string must be constructed of substrings, not just a part of it
  
Examples:

p repeated_substring_pattern("abab") == true
p repeated_substring_pattern("aba") == false
p repeated_substring_pattern("aabaaba") == false
p repeated_substring_pattern("abaababaab") == true
p repeated_substring_pattern("abcabcabcabc") == true

Data structures:
Strings.  Maybe arrays of strings will assist?

Algorithm:
* MOVE through input string, starting at first letter
  + use a simple loop
  + use #each
  + use #upto
  + use #each_char
* SELECT incrementing length of substring
  + create a local variable 
    - substring = ""
  + use a nested simple loop inside above one
  + use nested #each
  + use nested #upto
  + stop before selecting whole input string as substring i.e. input_string[0..-1], because this will give false result
* CREATE next multiple of current substring 
  + use String#* to create multiples of current substring
    - multiplied_substring = substring * n
  + start at multiple of 2x
  + how many multiples before stopping?  Stop at multiple == string.length
* COMPARE current multiplied substring with input string
    - input_string == multiplied_substring
* RETURN true, if any multiplied substring equivalent to input string
* STOP moving
* RETURN false

=end

require 'pry'
require 'pry-byebug'

# My solution 1 - using two nested simple loops to create all possible substrings

def repeated_substring_pattern(input_string)
  final_index = input_string.length - 1
  
  start_index = 0
  loop do
    end_index = start_index
    loop do
      substring = input_string[start_index..end_index]
      multiple = 2
      loop do 
        multiplied_substring = substring * multiple
        multiple += 1
        return true if multiplied_substring == input_string
        break if multiple == input_string.length
      end
      
      end_index += 1
      break if end_index == final_index
    end
    start_index +=1
    break if start_index == final_index
  end
  return false
end

# My solution 2 - using three nested #upto loops

def repeated_substring_pattern(input_string)
  final_index = input_string.length - 1
  
  0.upto(final_index) do |start_index| # start index loop
    start_index.upto(final_index) do |end_index|
      substring = input_string[start_index..end_index]
      2.upto(input_string.length) do |multiple|
        multiplied_substring = substring * multiple
        return true if multiplied_substring == input_string
      end
    end
  end
  
  return false
end

# My solution 3 - using an #upto inside an #each_char.with_index iterator.  This doesn't add a lot of value beyond solution 2 above tbh

# def repeated_substring_pattern(input_string)
#   final_index = input_string.length - 1
  
#   input_string.each_char.with_index do |_, start_index|
#     start_index.upto(final_index) do |end_index|
#       substring = input_string[start_index..end_index]
#       2.upto(input_string.length) do |multiple|
#         multiplied_substring = substring * multiple
#         return true if multiplied_substring == input_string
#       end
#     end
#   end
  
#   return false
# end

# print cases
# p repeated_substring_pattern("abab") #true
# p repeated_substring_pattern("aba") # false

# test cases
p repeated_substring_pattern("abab") == true
p repeated_substring_pattern("aba") == false
p repeated_substring_pattern("aabaaba") == false
p repeated_substring_pattern("abaababaab") == true
p repeated_substring_pattern("abcabcabcabc") == true