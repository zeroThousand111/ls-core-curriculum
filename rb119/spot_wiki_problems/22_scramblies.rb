=begin
22. Scramblies
(​https://www.codewars.com/kata/55c04b4cc56a697bb0000048/train/ruby​)
5 kyu

Complete the function scramble(str1, str2) that returns true if a portion of str1 characters can be rearranged to match str2, otherwise returns false.

Notes:
Only lower case letters will be used (a-z). No punctuation or digits will be included. Performance needs to be considered
Input strings s1 and s2 are null terminated.

# PROBLEM
## INPUTS: two strings
## OUTPUTS: a boolean true or false
## RULES
### Explicit requirements
  - a method;
  - returns a boolean
  - true if a portion of str1 characters can be rearranged to match str2
  - in other words, the characters of str2 must all be present in string1
  - only lowercase alphabetic characters in both strings
  - account for performance issues
### Implicit requirements
  - 

# EXAMPLES
- no obvious issues or gotchas

# DATA STRUCTURES
strings
Intermediate: an array of characters might be needed?

# ALGORITHM
* CREATE empty string to track str2 chars included in str1
* MOVE through the characters of string2 from first to last
* DETERMINE if current char is in string1
* ACT on above determination
  + IF current char is in string1
  + ELSE
* DETERMINE if ALL chars in string 2 are accounted for
  + IF they are, then str2 == included_chars
  + ELSE str != included_chars
=end

def scramble(str1, str2)
  included_chars = ""
  str2.chars.each do |char|
    included_chars << char if str1.include?(char)
  end
  return true if included_chars == str2
  false
end

# refactored to use #all?

def scramble(str1, str2)
  str2.chars.all? do |char|
    str1.include?(char)
  end
end

p scramble('rkqodlw', 'world') == true
p scramble('cedewaraaossoqqyt', 'codewars') == true 
p scramble('katas', 'steak') == false
p scramble('rkqodlw','world') == true
p scramble('cedewaraaossoqqyt','codewars') == true 
p scramble('katas','steak') == false
p scramble('scriptjava','javascript') == true
p scramble('scriptingjava','javascript') == true