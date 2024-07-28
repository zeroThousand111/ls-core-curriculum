=begin
65. Reversing and Combining Text (​https://www.codewars.com/kata/56b861671d36bb0aa8000819/train/ruby)

Your task is to Reverse and Combine Words

Input: String containing different "words" separated by spaces
1. More than one word? Reverse each word and combine first with second, third with fourth and so on... (odd number of words => last one stays alone, but has to be reversed too)
2. Start it again until there's only one word without spaces 
3. Return your result...

# UNDERSTAND THE PROBLEM
## INPUT: a string containing "words"
## OUTPUT: a string
## RULES
### EXPLICIT REQUIREMENTS
  - reverse each word
  - "combine" pairs of words; 1 with 2, 3 with 4, etc
  - if there are an odd number of words, leave the last one uncombined
  
### IMPLICIT REQUIREMENTS
  - "word" is a substring of alphabetic characters or numeric character separated by whitespace in the input string
  - "combine" means to put the "words" into adjacent positions not separated by whitespace
  - "reverse" means to change the order in which the "word" appears in the pair AND reverse the order of the characters in the "word"
  - the test cases are not consistent: some reverse the characters in the word and the order of the words, some only reverse the order of the words and not the characters
  - the test cases are ALL OVER THE PLACE, so I am going to assume that 
  
# EXAMPLES
p reverse_and_combine_text("abc def") == "cbafed" # two words, characters are reversed but not the order of pair
p reverse_and_combine_text("abc def ghi jkl") == "defabcjklghi" # four words, order of words reversed but not characters
p reverse_and_combine_text("dfghrtcbafed") == "dfghrtcbafed" # one word, charaacters are not reversed
p reverse_and_combine_text("234hh54 53455 sdfqwzrt rtteetrt hjhjh lllll12 44") == "trzwqfdstrteettr45hh4325543544hjhjh21lllll" # 7 words, result makes no sense whatsoever!
p reverse_and_combine_text("sdfsdf wee sdffg 342234 ftt") == "gffds432243fdsfdseewttf" # 5 words, characters of words reversed and all words reordered into 3-4-1-2-5 order!

# DATA STRUCTURES
## INPUT: a string
## OUTPUT: a new string
## INTERMEDIATE: an array of substrings aka "words"

# ALGORITHM
## HIGH-LEVEL
1. Split the input string into an array of words
2. Build a new string using elements from the array of words
3. Return the new string

## DETAIL
1. Split the input string into an array of words
* SPLIT the input string
  + use #split(" ")
2. Build a new string using elements from the array of words
* CREATE a new string
* MOVE through the array of words, tracking index from first word to the last
* COUNT the number of words in the array of words aka
  + use #size
* CREATE a new local variable `pair_string`
* IF count is > 1, SHOVEL the first pair
* IF count is odd number, stop moving through the array at -2

3. Return the new string


=end

def reverse_and_combine_text(input)
  array_of_words = input.split(" ")
  count = array_of_words.size
  return input if count == 1
  output = ""
  
  array_of_words.each_index do |index|
    next if index.odd?
    pair_string = ""
    pair_string << array_of_words[index + 1] << array_of_words[index]
    output << pair_string
  end
  
  if count.odd?
    output << array_of_words[-1]
  end
  output
end


p reverse_and_combine_text("abc def") #== "cbafed" # dont use
# p reverse_and_combine_text("abc def ghi jkl") == "defabcjklghi"
# p reverse_and_combine_text("dfghrtcbafed") == "dfghrtcbafed"
# # p reverse_and_combine_text("234hh54 53455 sdfqwzrt rtteetrt hjhjh lllll12 44") == "trzwqfdstrteettr45hh4325543544hjhjh21lllll" # dont use
# # p reverse_and_combine_text("sdfsdf wee sdffg 342234 ftt") == "gffds432243fdsfdseewttf" # don't use