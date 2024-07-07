=begin
Create a method that takes a string argument and returns the character that occurs most often in the string. If there are multiple characters with the same greatest frequency, return the one that appears first in the string. When counting characters, consider uppercase and lowercase versions to be the same.

# PROBLEM
## INPUT: a string
## OUTPUT: a string of one character, the most commmon in the input string
## RULES
### Explicit requirements:
  - a method;
  - return the character that occurs the most often
  - ignore case
  
### Implicit requirements:
  - input string may include whitespace and punctuation

# EXAMPLES

p most_common_char('Hello World') == 'l' # whitespace and capitals
p most_common_char('Mississippi') == 'i'
p most_common_char('Happy birthday!') == 'h'# whitespace and punctuation
p most_common_char('aaaaaAAAA') == 'a'

my_str = 'Peter Piper picked a peck of pickled peppers.'
p most_common_char(my_str) == 'p'

my_str = 'Peter Piper repicked a peck of repickled peppers. He did!'
p most_common_char(my_str) == 'e'
The above tests should each print true.

# DATA STRUCTURES
input string
Intermediate:
  - an array of alphabetic characters?
  - a tally hash of frequencies per character

# ALGORITHM
## HIGH LEVEL STEPS
1. TREAT string to remove whitespace and non-alphabetic characters and make all lowercase
2. COUNT all the characters in the string using a tally hash
3. RETURN the most common alphabetic character

1. TREAT string to remove whitespace and non-alphabetic characters and make all lowercase
* DELETE whitespace and non-alpha characters
  + use #delete
  + could build new string using #match? returns
* DOWNCASE string

2. COUNT all the characters in the string using a tally hash
* CREATE a tally hash
* MOVE through the treated string from first character to the last
* DETERMINE if the character is in the tally hash
  + IF yes, increment the value of that key by 1
  + IF not, add that char as a key to the tally hash
  
3. RETURN the most common alphabetic character
* DETERMINE the most common character
  + this will have the highest value in the tally hash
  + use max_by?
=end

def treat_string(string)
  downcased = string.chars.map { |char| char.downcase}.join
  downcased.delete("^a-z")
end

def tally(treated_string)
  tally_hash = {}
  treated_string.chars.each do |char|
    if tally_hash.include?(char)
      tally_hash[char] += 1
    else
      tally_hash[char] = 1
    end
  end
  tally_hash
end

def most_common_char(string)
  treated_string = treat_string(string)
  tally_hash = tally(treated_string)
  tally_hash.max_by { |(key, value)| value }.first
end

# test cases
p most_common_char('Hello World') == 'l'
p most_common_char('Mississippi') == 'i'
p most_common_char('Happy birthday!') == 'h'
p most_common_char('aaaaaAAAA') == 'a'

my_str = 'Peter Piper picked a peck of pickled peppers.'
p most_common_char(my_str) == 'p'

my_str = 'Peter Piper repicked a peck of repickled peppers. He did!'
p most_common_char(my_str) == 'e'