=begin
Write a method that takes a sentence string as input, and returns the same string with any sequence of the words 'zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine' converted to a string of digits.

Hint 1: The String#gsub! method may prove useful in this problem.

Hint 2: String#gsub! requires a "pattern" argument, which is typically expressed as a regular expression (regex). Regular expressions (regex) are very useful for string operations, but we don't cover them in any detail until RB130. If you haven't already read our book, Introduction to Regular Expressions, you may do so now, but it isn't necessary - this hint provides the only regular expression you need for this problem: if you have a variable named foo that contains some sort of word and want to match that word in a longer string, you can use the regex /\b#{foo}\b/.

# UNDERSTAND THE PROBLEM

## Input: a string, containing some words, and some words are alphabetic numbers e.g. nine
## Output: a string, where any alphabetic numbers in the input string have been transformed into numeric strings e.g. 9
## Rules
### Explicit requirements:
  - a method
  - the alphabetic strings will be in sequence
### Implicit requirements:
  - words are separated by white space
  - string can contain other characters, such as full stops
  - no direction if we should mutate input string or return new string, but I'm going to assume we return a new string
  - full stops always have whitespace after them, this could be a useful property
  - alphabetic strings are all lower case strings, so don't need to account for upper case or mixed case
  
# EXAMPLES

Example:

word_to_digit('Please call me at five five five one two three four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'

# DATA STRUCTURES
Strings
An Array of strings to iterate through

# ALGORITHM

* CREATE a Hash of alphabetic strings 0 to 9 and their numeric string correspondents
  + e.g. {"zero" => "0"}
* CREATE an empty output string
* SPLIT the input string into an array of "words"
  + words are character sequences delineated by whitespace
  + some words will contain full stops, which need to be accounted for
* MOVE through the array of words, word by word
  + could use #each if we just want to move through it
* CHECK each word to see if it is an alphabetic string in the Hash
  + use hash.include?(word)
* ACT upon the result of the check
  + IF the word IS an alphabetic string, push the value in the key-value pair in the hash to the output_string plus one whitespace
    - output_string << Hash[word] + " "
  + IF the word is NOT an alphabetic string, push the word plus one whitespace onto the end of the output string
    - output_string << word + " "

* DELETE the last extraneous whitespace at the last place
* RETURN the output string
=end

HASH = {
  "zero" => "0",
  "one" => "1",
  "two" => "2",
  "three" => "3",
  "four" => "4",
  "five" => "5",
  "six" => "6",
  "seven" => "7",
  "eight" => "8",
  "nine" => "9",
}

# solution 1 - without hints

def word_to_digit(input_string)
  output_string = ""
  array_of_words = input_string.split(" ")
  array_of_words.each_with_index do |word, index|
    if HASH.include?(word)
      output_string << HASH[word] + " "
    elsif index == array_of_words.size - 1
      output_string << word
    else
      output_string << word + " "
    end
  end
  output_string
end

# solution 2 - after hints

def word_to_digit(input_string)
  HASH.each do |key, value|
    input_string.gsub!(/\b#{key}\b/, value)
  end
  input_string
end

def word_to_digit(string)
  HASH.each { |key, value| string.gsub!(/\b#{key}\b/, value) }
  string
end

p word_to_digit('Please call me at five five five one two three four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'
