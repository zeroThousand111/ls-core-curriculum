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
## INPUT: a string
## OUTPUT: a string, could be a new string
## RULES
### EXPLICIT REQUIREMENTS
  - the first and last characters remain in original place for each word
  - characters between the first and last characters must be sorted alphabetically
  - punctuation should remain at the same place as it started, for example: shan't -> sahn't
  - for this kata puctuation is limited to 4 characters: hyphen(-), apostrophe('), comma(,) and period(.)
### IMPLICIT REQUIREMENTS

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


# DATA STRUCTURES
Strings
An array of characters to sort and build new string

# ALGORITHM

--- for EACH word

* CREATE an empty string to collect characters and later output
    - output_minus_punctuation = ''
* CREATE an empty array to collect middle characters
    - middle_characters = []
* SHOVEL on the first character of the input string to the output string

--- start loop
* MOVE through the input string from second character to penultimate character
  + use Integer#upto
    - 2.upto(string.length - 2)
* DETERMINE type of character
  + check for alphabetic character
  + use #match?
    - char.match?(/[a-z]/)
* ACT upon result of determination
  + IF alphabetic character, SHOVEL onto array of middle characters
  + ELSE, move on
--- end loop
* SORT array of middle characters into alphabetic order
  - middle_characters.sort
  
--- start iteration
* MOVE through the input string again from SECOND to PENULTIMATE but track index
* TRANSFORM to an array of characters and track index
* DETERMINE if each character is punctuation i.e. not alphabetic
    char.match?(/[!a-z]/)
* ACT upon the determination
  + IF the character is punctuation, then INSERT it into the sorted middle characters array at that index
--- end iteration

* SHOVEL on the first character of the input string to the output string
* JOIN array of middle characters and then SHOVEL onto output string
* SHOVEL last character of intput string onto output string
* RETURN output string

=end
require 'pry'
require 'pry-byebug'

def scramble_words(input_string)
  output = ''
  return input_string if input_string.length <= 1
  
  middle_characters = []
  
  1.upto(input_string.length - 2) do |index|
    if input_string[index].match?(/[a-z]/)
      middle_characters << input_string[index]
    end
  end
  
  sorted_middle_characters = middle_characters.sort
  
  # index = 1
  # loop do 
  #   if input_string[index].match?(/[^a-z]/)
  #     sorted_middle_characters.insert(index, input_string[index])
  #     # index += 1
  #   end
  #   p input_string[index]
  #   index += 1
  #   break if index == input_string.length - 1
  # end
  binding.pry
  
  1.upto(input_string.length - 2) do |index|
    if input_string[index].match?(/[^a-z]/)
      sorted_middle_characters.insert(index - 1, input_string[index])
    end
  end
  
  output << input_string[0]
  output << sorted_middle_characters.join
  output << input_string[-1]
  output
end

# test cases

# p scramble_words('professionals') == 'paefilnoorsss' 
# p scramble_words('i') == 'i'
# p scramble_words('') == ''
# p scramble_words('me') == 'me'
# p scramble_words('you') == 'you'
# p scramble_words('card-carrying') == 'caac-dinrrryg' 
# p scramble_words("shan't") == "sahn't"
p scramble_words('-dcba') #== '-dbca'
# p scramble_words('dcba.') #== 'dbca.'

p scramble_words("you've gotta dance like there's nobody watching, love like you'll never be hurt, sing like there's nobody listening, and live like it's heaven on earth.") == "you've gotta dacne like teehr's nbdooy wachintg, love like ylo'ul neevr be hrut, sing like teehr's nbdooy leiinnstg, and live like it's haeevn on earth."