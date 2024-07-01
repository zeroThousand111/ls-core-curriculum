=begin
19. Title Case
(​https://www.codewars.com/kata/5202ef17a402dd033c000009​)
6 kyu

A string is considered to be in title case if each word in the string is either (a) capitalised (that is, only the first letter of the word is in upper case) or (b) considered to be an exception and put entirely into lower case unless it is the first word, which is always capitalised.

Write a function that will convert a string into title case, given an optional list of exceptions (minor words). The list of minor words will be given as a string with each word separated by a space. Your function should ignore the case of the minor words string -- it should behave in the same way even if the case of the minor word string is changed.

# UNDERSTAND THE PROBLEM
## INPUT: a string, or two strings
## OUTPUT: a string,
## RULES
### Explicit requirements:
  - a method,
  - return the input string, but in title case
  - any words given in an optional second argument should be exempt from title case
  - the case of any words in the optional argument doesn't matter
  
  
### Implicit requirements:
  - all characters in the examples and test cases are alphabetic or white space
  - the first test case breaks the rules, because "a" is capitalised despite it being a word in the second string
  
## EXAMPLES
p title_case('a clash of KINGS', 'a an the of') == 'A Clash of Kings' some words in the second string don't exist in the main string and don't affect things, but the first A is still capitalised

p title_case('THE WIND IN THE WILLOWS', 'The In') == 'The Wind in the Willows'
p title_case('the quick brown fox') == 'The Quick Brown Fox'

## DATA STRUCTURES
Arrays of "words": an array of words

# ALGORITHM
* INCORPORATE a default parameter for the second argument
  + default argument is an empty string ""

* CREATE an array of main words from first string argument and downcase them all to standardise them
  + use String#split(" ")
  + then in method chain use #map(&:downcase)

* CREATE an array of exception words from the second string argument and downcase them all (if there is one)
  + use String#split(" ")
  + then in method chain use #map(&:downcase)

* TRANSFORM each word in the array of words UNLESS they appear in the exception words array
  + use an IF statement
  + use #map
  + use #include? in the block
  + use #downcase on words in the exception word list
  + use #capitalize on the words not in the exception list
  + the FIRST word of the string must be a capital, even if it is in the exception list

* JOIN the transformed elements of the array into a new string
  + use #join with one space (" ") as argument

=end

def title_case(main_string, exception_string="")
    array_of_words = main_string.split(" ").map(&:downcase)
    exception_words = exception_string.split(" ").map(&:downcase)
    array_of_words.map.with_index do |word, index|
      if index == 0
        word.capitalize
      elsif exception_words.include?(word)
        word.downcase
      else
        word.capitalize
      end
    end.join(" ")
end

p title_case('a clash of KINGS', 'a an the of') == 'A Clash of Kings'
p title_case('THE WIND IN THE WILLOWS', 'The In') == 'The Wind in the Willows'
p title_case('the quick brown fox') == 'The Quick Brown Fox'
