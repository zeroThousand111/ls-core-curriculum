=begin
10.Most frequently used words in a text]
(​https://www.codewars.com/kata/51e056fe544cf36c410000fb/train/ruby​)
4 kyu

Write a function that, given a string of text (possibly with punctuation and line-breaks), returns an array of the top-3 most occurring words, in descending order of the number of occurrences.
Assumptions:
  - A word is a string of letters (A to Z) optionally containing one or more apostrophes (') in ASCII. (No need to handle fancy punctuation.)
  - Matches should be case-insensitive, and the words in the result should be lowercased.
  - Ties may be broken arbitrarily.
  - If a text contains fewer than three unique words, then either the top-2 or top-1 words should be returned, or an empty array if a text contains no words.


Bonus points (not really, but just for fun):
Avoid creating an array whose memory footprint is roughly as big as the input text. Avoid sorting the entire array of unique words.


# UNDERSTAND THE PROBLEM
## INPUT: a string
## OUTPUT: an array of strings
## RULES
### Explicit requirements:
  - a method;
  - return an array of the top 3 most frequently occurring "words", in descending order of frequency
  - a "word" is a string of alphabetic characters that might include an apostrophe
  - no other punctuation will be included in words, but they will be included in the input string
  - Matches should be case-insensitive, and the words in the result should be lowercased
  - if there are fewer than 3 unique words, return an array of the top 2 or top 1 most frequent
  - return an empty array if the string contains no words
  
 ### Implicit requirements:
 
   - there IS lots of other punctation between words that should be ignored
   - words are separated by whitespace
   - words are CASE SENSITIVE

# TEST CASES / Examples:

top_3_words("In a village of La Mancha, the name of which I have no desire to call to mind, there lived not long since one of those gentlemen that keep a lance in the lance-rack, an old buckler, a lean hack, and a greyhound for coursing. An olla of rather more beef than mutton, a salad on most nights, scraps on Saturdays, lentils on Fridays, and a pigeon or so extra on Sundays, made away with three-quarters of his income.")
# => ["a", "of", "on"]
top_3_words("e e e e DDD ddd DdD: ddd ddd aa aA Aa, bb cc cC e e e") # => ["e", "ddd", "aa"]
top_3_words(" //wont won't won't")
# => ["won't", "wont"]

# DATA STRUCTURES

A Hash to tally words and their frequencies
An Array to return the top 3 words in descending order

# ALGORITHM

## BIG STEPS

1. Cut the input string into separate words
2. Count the frequencies of the words and tally the counts in a hash
3. Sort the tally hash into order by descending value (count frequencies)
4. Transform the nested 2D array of words and counts into an array of words
5. RETURN an array of the top 3 words 

## STEPS

1. Cut input string into separate words
* Use a helper method for this process
* REMOVE characters that are not:
  + whitespace
  + alphabetic characters OR
  + apostrophes
  + use String#delete() with appropriate character selectors
  + character selectors "^A-Za-z'"
* REMOVE any stand-alone apostrophes
  + use #delete_if
  + use block expression of word.match?(/'/)
* TRANSFORM any uppercase characters into lowercase characters
* SPLIT the cleaned up string into an array of substrings (words inc apostrophes) using whitespace
  + use String#split(' ')

2. Count the frequencies of the words and tally the counts in a hash
* CREATE an empty tally hash
* MOVE through the array of strings
  + use #each
* DETERMINE if current word is already in the tally hash
  + IF it is, then increment the value of the key that matches that word
  + ELSE CREATE a new key in the tally hash with a value of 1

3. Sort the tally hash into order by descending value (count frequencies)
* sort the tally hash by value in ascending order
  + use #sort_by
    - hash.sort_by { |word, count| count }
  + REVERSE the order using #reverse

4. Transform the nested 2D array of words and counts into an array of words
N.B. We currently have a nested 2D array containing subarrays of [word, count] in descending order of counts
* TRANSFORM the nested array of subarrays into an array of words only
  + use #map
  + transform using block expression pair.first


5. RETURN an array of the top 3 words 

* RETURN a new array of just the first 3 words
  + use #first
    - first(3)
=end

def create_array_of_strings(input_string)
  cleaned_string = input_string.delete("^A-Za-z' ").downcase
  array_of_strings = cleaned_string.split
  array_of_strings.delete_if do |word|
    word.match?(/^'/)
  end
end

# p create_array_of_strings(" //wont won't won't ")

def create_tally(array)
  tally_hash = {}
  array.each do |word|
    if tally_hash.include?(word)
      tally_hash[word] += 1
    else
      tally_hash[word] = 1
    end
  end
  tally_hash
end

# p create_tally(["won't", "won't", "wont"])

def sort_tally(hash)
  hash.sort_by { |word, count| count }.reverse
end

# p sort_tally({"won't"=>2, "wont"=>1, "hi"=>3, "top"=>99})

def transform_tally(nested_array)
  nested_array.map do |pair|
    pair.first
  end
end

def top_3_words(input_string)
    array_of_strings = create_array_of_strings(input_string)
    tally_hash = create_tally(array_of_strings)
    sorted_tally_array = sort_tally(tally_hash)
    array_of_words = transform_tally(sorted_tally_array)
    array_of_words.first(3)
end


p top_3_words("aaa b cc dddd eeeee") #== ["e","d","a"]
p top_3_words("e e e e DDD ddd DdD: ddd ddd aa aA Aa, bb cc cC e e e") == ["e", "ddd", "aa"]
p top_3_words(" //wont won't won't ") == ["won't", "wont"]
p top_3_words(" , e .. ") == ["e"]
p top_3_words(" ... ") == []
p top_3_words(" ' ") == []
p top_3_words(" ''' ") == []
p top_3_words("""In a village of La Mancha, the name of which I have no desire to call to mind, there lived not long since one of those gentlemen that keep a lance in the lance-rack, an old buckler, a lean hack, and a greyhound for coursing. An olla of rather more beef than mutton, a salad on most nights, scraps on Saturdays, lentils on Fridays, and a pigeon or so extra on Sundays, made away with three-quarters of his income.""") == ["a", "of", "on"]