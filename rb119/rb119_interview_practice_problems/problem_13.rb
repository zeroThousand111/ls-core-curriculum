=begin
Problem 13
Create a method that takes two strings as arguments and returns true if some portion of the characters in the first string can be rearranged to match the characters in the second. Otherwise, the method should return false.

You may assume that both string arguments only contain lowercase alphabetic characters. Neither string will be empty.

# UNDERSTAND THE PROBLEM
## INPUT: two strings
## OUTPUT: a boolean true or false
## RULES
### EXPLICIT REQUIREMENTS:
  - return true if a substring of string1 is an anagram of string2, else return false
  - in other words, all of the chars in string2 should be present in string1 (string1 may have some extra ones)
  - both string arguments only contain lowercase alphabetic chars
  
### IMPLICIT REQUIREMENTS
  - string 1 should
# EXAMPLES

Examples
p unscramble('ansucchlohlo', 'launchschool') == true
p unscramble('phyarunstole', 'pythonrules') == true 
p unscramble('phyarunstola', 'pythonrules') == false # one letter diff from above
p unscramble('boldface', 'coal') == true

The above tests should each print true.

# DATA STRUCTURES

# ALGORITHM
## HIGH-LEVEL
1. CREATE a tally hash of chars and their frequencies of string2
2. MOVE through the chars of string1 and decrement the values of frequencies of the tally hash as they are encountered
3. RETURN true if the tally_hash has values of 0 or less for all keys

## DETAIL
1. CREATE a tally hash of chars and their frequencies of string2
* CREATE tally hash
  + use #tally method
2. MOVE through the chars of string1 and decrement the values of frequencies of the tally hash as they are encountered
* MOVE through the chars of string1 from first to last
  + use #each
  + TRANSFORm to an aray of chars using #chars
* CHECK if current char1 is included in the tally_hash (might not be)
  + use #include?
3. RETURN true if the tally_hash has values of 0 or less for all keys
* CREATE an array of values of the tally_hash
* CHECK all values are zero or less
* IF they are, return true, else return false
=end

def create_tally_hash(string2)
  string2.chars.tally
end

def unscramble(string1, string2)
  tally_hash = create_tally_hash(string2)
  
  string1.chars.each do |char1| 
    if tally_hash.include?(char1)
      tally_hash[char1] -=1
    end
  end
  
  tally_hash.values.all? do |value|
    value <= 0
  end
end

p unscramble('ansucchlohlo', 'launchschool') == true
p unscramble('phyarunstole', 'pythonrules') == true
p unscramble('phyarunstola', 'pythonrules') == false
p unscramble('boldface', 'coal') == true
