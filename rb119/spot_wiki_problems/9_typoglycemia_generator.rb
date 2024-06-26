=begin
Background
There is a message that is circulating via public media that claims a reader can easily read a message where the inner letters of each words is scrambled, as long as the first and last letters remain the same and the word contains all the letters.
Another example shows that it is quite difficult to read the text where all the letters are reversed rather than scrambled.
In this kata we will make a generator that generates text in a similar pattern, but instead of scrambled or reversed, ours will be sorted alphabetically
Requirement
return a string where:
1) the first and last characters remain in original place for each word
2) characters between the first and last characters must be sorted alphabetically
3) punctuation should remain at the same place as it started, for example: shan't -> sahn't
Assumptions
1) words are seperated by single spaces
2) only spaces separate words, special characters do not, for example: tik-tak -> tai-ktk
3) special characters do not take the position of the non special characters, for example: -dcba -> -dbca 
4) for this kata puctuation is limited to 4 characters: hyphen(-), apostrophe('), comma(,) and period(.)
5) ignore capitalisation
for reference: http://en.wikipedia.org/wiki/Typoglycemia =end

# UNDERSTAND THE PROBLEM 
## INPUT: a string of "words", 
## OUTPUT: a NEW string of "words", with the characters in different order
## RULES:
### EXPLICIT REQUIREMENTS:
  - the first and last characters remain in original place for each word
  - characters between the first and last characters must be sorted alphabetically BUT...
  - a "word" is separated by whitespace, and nothing else
  - special characters do not take the position of the non special characters, in other words
  - punctuation is limited to "-", '``, ',' or '.'
  - punctuation should remain at the same place as it started, in other words, at the same index position in the output string as in the input string
  - ignore capitalisation, in other words, the method of transformation is not case sensitive
### IMPLICIT REQUIREMENTS:
  - the string of "words" may contain one or more "words" or be an empty string
  - any punctuation at the beginning or end of the input string doesn't count as the first or last character to stay in place, but it stays in place in the same index order at the front or back of the string

# NOTABLE TEST CASES
p scramble_words('-dcba') == '-dbca' # first character is "d"
p scramble_words('dcba.') == 'dbca.' # last character is "a"

# DATA STRUCTURES
Strings
Perhaps an array of characters to build a substring that is sorted

# EXAMPLES / TEST CASES
p scramble_words('professionals') == 'paefilnoorsss' 
p scramble_words('i') == 'i'
p scramble_words('') == ''
p scramble_words('me') == 'me'
p scramble_words('you') == 'you'
p scramble_words('card-carrying') == 'caac-dinrrryg' 
p scramble_words("shan't") == "sahn't"
p scramble_words('-dcba') == '-dbca'
p scramble_words('dcba.') == 'dbca.'
 
p scramble_words("you've gotta dance like there's nobody watching, love like you'll never be hurt, sing like there's nobody listening, and live like it's heaven on earth.") == "you've gotta dacne like teehr's nbdooy wachintg, love like ylo'ul neevr be hrut, sing like teehr's nbdooy leiinnstg, and live like it's haeevn on earth."


# ALGORITHM

# HIGH LEVEL
1. RETURN the input string if it is 1 character or empty
2. SPLIT the string into words
  * 
  + use String#split(' ')
    - array_of_words = string.split(' ')
3. OPERATE on each word
  + see below
  + create a helper method that takes a word from the array_of_words and returns a new 
4. JOIN all the words together
5. RETURN the joined string

# SUB-PROBLEM - SCRAMBLE each word

* CREATE a helper method for this sub problem
* RETURN the input string if the string is empty or has 3 characters or fewer
    - return input_word if input_word.length <= 3
* CREATE an empty string for the method to return later
    - output_word = ''
* CREATE a switch local variable to switch once the first alphabetic
* TRANSFORM the string into an array of characters
    - input_word.chars
* MOVE through the array of chars from the first character to the last
  + use #each_index
  + OR use an #upto iterator?
* IDENTIFY the INDEX of the first alphabetic character in the word
  + use a helper method
  + use #each_with_index
  + use IF with condition char.match?(/[a-z]/)
    - array.each_with_index { |char, index| return index if char.match?(/[a-z]/) }
  + IF alphabetic, assign the index to a local variable
  + ELSE move on
* IDENTIFY the INDEX of the last alphabetic character in the word
  + use a helper method
  + use #reverse_each and #with_index in a method chain
  + use IF with condition char.match?(/[a-z]/)
    - array.reverse_each.with_index { |char, index| return index if char.match?(/[a-z]/) }
    
## SUB-SUB PROBLEM - sort middle alphabetic characters ONLY and INSERT punctuation back in the middle string at the correct indices

* IDENTIFY the middle characters in the string, start index and stop index
  + start_index will be first character index + 1
  + stop_index will be the last character index - 1

* SORT middle alphabetic characters ONLY

=end

require 'pry'
require 'pry-byebug'

def get_first_alpha_char_index(array)
  array.each_with_index { |char, index| return index if char.match?(/[a-z]/) }
end

def get_last_alpha_char_index(array)
  index = array.size - 1
  loop do
    return index if array[index].match?(/[a-z]/)
    index -= 1
    break if index <= 0
  end
end

def sort_middle(input_array) # input is an array, output is a string
  alphabetic_only = []
  input_array.each_with_index do |char, index|
    if char.match?(/[a-z]/)
      alphabetic_only << input_array[index]
    end
  end
  
  output_array = alphabetic_only.sort
  
  input_array.each_with_index do |char, index|
    if char.match?(/[^a-z]/)
      output_array.insert(index, char)
    end
  end
  
  output_array.join
end

def scramble_word(input_word)
  return input_word if input_word.length <= 3
  output_word = ''
  array_of_chars = input_word.chars
  
  first_char_index = get_first_alpha_char_index(array_of_chars)
  last_char_index = get_last_alpha_char_index(array_of_chars)
  
  middle_characters = array_of_chars[(first_char_index + 1)...last_char_index]
  
  sorted_middle_characters = sort_middle(middle_characters) 
  
  output_word << input_word[0..first_char_index]
  output_word << sorted_middle_characters
  output_word << input_word[last_char_index..-1]
  output_word
end

def scramble_words(input_string)
  return input_string if input_string.length <= 1
  
  array_of_words = input_string.split
  array_of_scrambled_words = []
  
  array_of_words.each do |word|
    array_of_scrambled_words << scramble_word(word)
  end
  
  array_of_scrambled_words.join(' ')
end

# individual method tests
# p get_first_alpha_char_index(["a"]) == 0
# p get_first_alpha_char_index([",", "-", "a"]) == 2

# p get_last_alpha_char_index(["a"]) == 0
# p get_last_alpha_char_index(["b,", "a", ",", "-"]) == 1
# p get_last_alpha_char_index(["b,", "a", "c", "f"]) == 3
# p get_last_alpha_char_index([",", "-"]) == nil

# p sort_middle(["c", "b", "a"]) == "abc"

# test cases

p scramble_words('professionals') == 'paefilnoorsss' 
p scramble_words('i') == 'i'
p scramble_words('') == ''
p scramble_words('me') == 'me'
p scramble_words('you') == 'you'
p scramble_words('card-carrying') == 'caac-dinrrryg' 
p scramble_words("shan't") == "sahn't"
p scramble_words('-dcba') == '-dbca'
p scramble_words('dcba.') == 'dbca.'

p scramble_words("you've gotta dance like there's nobody watching, love like you'll never be hurt, sing like there's nobody listening, and live like it's heaven on earth.") == "you've gotta dacne like teehr's nbdooy wachintg, love like ylo'ul neevr be hrut, sing like teehr's nbdooy leiinnstg, and live like it's haeevn on earth."