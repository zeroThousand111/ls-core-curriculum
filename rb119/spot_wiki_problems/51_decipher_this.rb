=begin
https://www.codewars.com/kata/581e014b55f2c52bb00000f8
Decipher this!
6 kyu

You are given a secret message you need to decipher. Here are the things you need to know to decipher it:
For each word:
the second and the last letter is switched (e.g. Hello becomes Holle) the first letter is replaced by its character code (e.g. H becomes 72) Note: there are no special characters used, only letters and spaces

# UNDERSTAND THE PROBLEM
## INPUT: a string
## OUTPUT: a new string
## RULES
### Explicit requirements:
  - transform the input string;
      1. turn numeric characters into ASCII letters
      2. swap first and last letters
  - only letters and whitespace characters used
### Implicit requirements:
  - a character code is 2 or 3 consecutive numbers
  - all test cases use a numeric code at the front of the word


# EXAMPLES
Examples
decipherThis('72olle 103doo 100ya'); // 'Hello good day'
decipherThis('82yade 115te 103o'); // 'Ready set go'

decipher_this("65 119esi 111dl 111lw 108dvei 105n 97n 111ka") == "A wise old owl lived in an oak"
decipher_this("84eh 109ero 104e 115wa 116eh 108sse 104e 115eokp") == "The more he saw the less he spoke"
decipher_this("84eh 108sse 104e 115eokp 116eh 109ero 104e 104dare") == "The less he spoke the more he heard"
decipher_this("87yh 99na 119e 110to 97ll 98e 108eki 116tah 119esi 111dl 98dri") == "Why can we not all be like that wise old bird"
decipher_this("84kanh 121uo 80roti 102ro 97ll 121ruo 104ple") == "Thank you Piotr for all your help"

# DATA STRUCTURES
Input: a string
Output: a string
Intermediate: an array of substring words

# ALGORITHM
## HIGH-LEVEL
1. SPLIT the input string into an array of words (by whitespace)
2. TRANSFORM each word into an alphabetic only word
3. JOIN the array of transformed words into an output string

1. SPLIT the input string into an array of words (by whitespace)
* SPLIT the input string on whitespace
  + use #split
2. TRANSFORM each word into an alphabetic only word
* CREATE an empty output string
3. JOIN the array of transformed words into an output string

=end

def transform_word(word)
  new_word = ""
  num = ""
  alpha = ""
  
  word.chars.each do |char|
    if char.match?(/[0-9]/)
      num << char
    else
      alpha << char
    end
  end
  
  new_word.concat(num.to_i) # concats ASCII equivalent of num.to_i to new_word
  unless alpha.empty?
    alpha[0], alpha[-1] = alpha[-1], alpha[0]
    new_word << alpha
  end
  
  new_word
end

def decipher_this(input_string)
  array_of_words = input_string.split
  array_of_words.map do |word|
    transform_word(word)
  end.join(" ")
end

p decipher_this("65 119esi 111dl 111lw 108dvei 105n 97n 111ka") == "A wise old owl lived in an oak"
p decipher_this("84eh 109ero 104e 115wa 116eh 108sse 104e 115eokp") == "The more he saw the less he spoke"
p decipher_this("84eh 108sse 104e 115eokp 116eh 109ero 104e 104dare") == "The less he spoke the more he heard"
p decipher_this("87yh 99na 119e 110to 97ll 98e 108eki 116tah 119esi 111dl 98dri") == "Why can we not all be like that wise old bird"
p decipher_this("84kanh 121uo 80roti 102ro 97ll 121ruo 104ple") == "Thank you Piotr for all your help"
