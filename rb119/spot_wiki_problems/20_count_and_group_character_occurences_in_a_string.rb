=begin
20. Count and Group Character Occurrences in a String
(​https://www.codewars.com/kata/543e8390386034b63b001f31​)
6 kyu

Write a method that takes a string as an argument and groups the number of times each character appears in the string as a hash sorted by the highest number of occurrences.

The characters should be sorted alphabetically e.g:
get_char_count("cba") => {1=>["a", "b", "c"]}
You should ignore spaces, special characters and count uppercase letters as lowercase ones.

# UNDERSTAND THE PROBLEM
## INPUT: a string of alphabetic and non-alphabetic characters
## OUTPUT: a hash, with keys as frequencies and values as alphabetic characters appearing at those frequencies
## RULES
### Explicit requirements:
  - a method;
  - hash can be described as a group of frequencies
  - character values in array values should be sorted alphabetically
  - hash keys sorted in descending order of numerical value
  - ignore whitespace, and non-alphabetic characters
  - treat uppercase characters as lowercase
### Implicit requirements:
  - returned characters in value arrays are lowercase only
  - numeric strings ARE included in group and come before alphabetic characters in the array values
  
# EXAMPLES
p get_char_count("Mississippi") == {4=>["i", "s"], 2=>["p"], 1=>["m"]}
p get_char_count("Hello. Hello? HELLO!!") == {6=>["l"], 3=>["e", "h", "o"]}
p get_char_count("aaa...bb...c!") == {3=>["a"], 2=>["b"], 1=>["c"]}
p get_char_count("aaabbbccc") == {3=>["a", "b", "c"]}
p get_char_count("abc123") == {1=>["1", "2", "3", "a", "b", "c"]}

# DATA STRUCTURES
A hash is returned
{count => ["1", "a"]}

An interim tally hash will be helpful

# ALGORITHM

* TRANSFORM input string to all lowercase and reorder string into alphabetic order
  + split into an array of chars using #chars
  + use #downcase
  + use #sort
* CREATE an empty output hash
    - output_hash = {}
* MOVE through the characters of the downcased input string, one character at a time from first to the last
* COUNT the number of instances of the current character in the input string
  + use #count
    - input_string.count("current_char")
* DETERMINE if that count value is already in the output Hash and if that char is already in the Hash array
  + use #include?
    - output_hash.include?(count)
* ACT upon the results of the above determination
  + IF the count(key) IS already included, then DETERMINE if the char is already in the value array
    - output_hash[count].include?(char)
    + IF it is, then move on, it's already noted
    + ELSE append or SHOVEL the char to the value array 
      - output_hash[count] << char
  + ELSE if the count IS NOT included, then create a new key-value pair in the output_hash
    - output_hash[count] = [char]
    
* RETURN the output hash
=end

def get_char_count(input_string)
  string = input_string.chars.map {|char| char.downcase}.sort.join.delete("^0-9a-z")
  output_hash = {}
  string.each_char do |char|
    count = string.count(char)
    if output_hash.include?(count)
      unless output_hash[count].include?(char)
        output_hash[count] << char
      end
    else
      output_hash[count] = [char]
    end
  end
  output_hash
end

p get_char_count("Mississippi") == {4=>["i", "s"], 2=>["p"], 1=>["m"]}
p get_char_count("Hello. Hello? HELLO!!") == {6=>["l"], 3=>["e", "h", "o"]}
p get_char_count("aaa...bb...c!") == {3=>["a"], 2=>["b"], 1=>["c"]}
p get_char_count("aaabbbccc") == {3=>["a", "b", "c"]}
p get_char_count("abc123") == {1=>["1", "2", "3", "a", "b", "c"]}