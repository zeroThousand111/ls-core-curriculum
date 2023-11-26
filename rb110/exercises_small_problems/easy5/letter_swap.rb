=begin
Given a string of words separated by spaces, write a method that takes this string of words and returns a string in which the first and last letters of every word are swapped.

You may assume that every word contains at least one letter, and that the string will always contain at least one word. You may also assume that each string contains nothing but words and spaces.

Examples:

swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
swap('Abcde') == 'ebcdA'
swap('a') == 'a'

----

Understand the Problem
Input: String
Output: String
Rules:
- Explicit Requirements:
  - Every word will contain at least one letter
  - Each input string will contain nothing but words and spaces
- Implicit Requirements:
  - No empty strings
  - Input is always a string
  - Case of characters remains the same when reversed
  - The problem doesn't clearly specify if the original string should be retained or mutated
  - I'm going to assume a new string should be returned i.e. the method isn't destructive
  
----

Test Cases

swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
swap('Abcde') == 'ebcdA'
swap('a') == 'a'

----

Data Structures

Strings and an Array of Strings to reverse each sub-string

----

Algorithm

1. Split input into a NEW array of words
2. For EACH word sub-string
    a. Note the first character (word[0])
    b. Note the last character (word[-1])
    c. Reassign the first character to be the last
    d. Reassign the last character to be the first
3. Join the words in the same order that they were

=end

# first attempt using String Element (Re)Assignment (therefore destructive)

# def swap(string)
#   array_of_words = string.split(' ')
#   rev_array_of_words = array_of_words.each do |word|
#                           first = word[0]
#                           last = word[-1]
#                           word[0] = last
#                           word[-1] = first
#                         end
#   rev_array_of_words.join(' ')
# end


# refactor of first attempt (still destructive)

# def swap(string)
#   string.split(' ').each { |word| word[0], word[-1] = word[-1], word[0]}.join(' ')
# end

# same idea as above but using simple Loop

# def swap(string)
#   counter = 0 
#   array_of_words = string.split(' ')
  
#   loop do
#     array_of_words[counter][0], array_of_words[counter][-1] = array_of_words[counter][-1], array_of_words[counter][0]
#     counter += 1
#     break if counter == array_of_words.size
#   end
  
#   array_of_words.join(' ')
# end

# non-destructive method using Array#map

def swap(string)
  string.split(' ').map { |word|
    word[0], word[-1] = word[-1], word[0]
    word
  }.join(' ')
end

# 

# print tests

p swap('Oh what a wonderful day it is') # => 'hO thaw a londerfuw yad ti si'
p swap('Abcde') # => 'ebcdA'
p swap('a') # =>'a'

# truth tests

p swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
p swap('Abcde') == 'ebcdA'
p swap('a') == 'a'
