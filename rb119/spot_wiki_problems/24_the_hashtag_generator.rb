=begin
24. The Hashtag Generator
(​https://www.codewars.com/kata/52449b062fb80683ec000024​)
5 kyu
The marketing team is spending way too much time typing in hashtags. Let's help them with our own Hashtag Generator!
Here's the deal:
It must start with a hashtag (#).
All words must have their first letter capitalized.
If the final result is longer than 140 chars it must return false.
If the input or the result is an empty string it must return false.

# PROBLEM
## INPUT: a string
## OUTPUT: a new string, or false
## RULES
### Explicit requireemnts:
  - returned string must start with a hashtag
  - if the returned string would be longer than 140 chars (i.e. 141 or more) then it must return false
  - if the input or new string is empty, return false
  - 
### Implicit requirements
  - remove whitespace
  - all "words" of the input string have their first letter upcased in the output string
  
Examples
" Hello there thanks for trying my Kata" => "#HelloThereThanksForTryingMyKata" " Hello World " => "#HelloWorld"
"" => false

# DATA STRUCTURES
An input string
Intermediate: Maybe an array of substrings (words)
An output string

# ALGORITHM

* SPLIT input string by "word" to create an array of words
* MOVE through the array of words from first word to last
* CAPITALISE each word
* JOIN array of strings into new string (no whitespace)
* Return false IF 
   + output string is > 140 characters long
   + input string or output string is empty
* SHOVEL a hash on to the front of the output string
* RETURN output string

=end

def generateHashtag(input_string)
  return false if input_string.empty?
  array_of_words = input_string.split.map { |word| word.capitalize}
  output_string = array_of_words.prepend("#").join
  return false if output_string.length > 140 || output_string.empty? || output_string == "#"
  output_string
end

p generateHashtag("") == false
p generateHashtag(" " * 200) == false
p generateHashtag("Do We have A Hashtag") == "#DoWeHaveAHashtag"
p generateHashtag("Codewars") == "#Codewars"
p generateHashtag("Codewars Is Nice") == "#CodewarsIsNice"
p generateHashtag("Codewars is nice") == "#CodewarsIsNice"
p generateHashtag("code" + " " * 140 + "wars") == "#CodeWars"
p generateHashtag("Looooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooong Cat") == false
p generateHashtag("a" * 139) == "#A" + "a" * 138
p generateHashtag("a" * 140) == false