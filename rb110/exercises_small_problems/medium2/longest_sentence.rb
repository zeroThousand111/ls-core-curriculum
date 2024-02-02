=begin
______________________________________________________________________________
*****Understand the PROBLEM*****
______________________________________________________________________________
THE PROBLEM:

Write a program that reads the content of a text file and then prints the longest sentence in the file based on number of words. Sentences may end with periods (.), exclamation points (!), or question marks (?). Any sequence of characters that are not spaces or sentence-ending characters should be treated as a word. You should also print the number of words in the longest sentence.

INPUT: A text file! How do I read it?!

OUTPUT: An integer

RULES
EXPLICIT REQUIREMENTS:
  - Sentences may end with periods (.), exclamation points (!), or question marks (?). 
  - Any sequence of characters that are not spaces or sentence-ending characters should be treated as a word.
  - You should also print the number of words in the longest sentence.
  
IMPLICIT REQUIREMENTS:
  -
  -
  -

______________________________________________________________________________
*****EXAMPLES/TEST CASES*****
______________________________________________________________________________



______________________________________________________________________________
*****DATA STRUCTURES*****
______________________________________________________________________________

Arrays
______________________________________________________________________________
*****ALGORITHM*****
______________________________________________________________________________

1.Import the file into the program (File.open);
2.Read the file data and assign it to a local variable;
3.Split the file data into sentences according to problem description and store them in an array;
4.For each sentence in turn:
  a. Split each sentence into words;
  b. Count the number of words;
  c. Store the count in a new array of counts.
5.Determine which count is the largest?;
6.Identify which index number this sentence is in the array of sentences;
7.Output the sentence from the array of sentences with the largest number of words using its index number;
8.Output the count of words of the longest sentence.
______________________________________________________________________________

Now CODE with intent!
=end

# solution 1 - My Solution

def longest_sentence(file_name)
  file = File.open(file_name)
  file_data = file.read
  sentence_array = file_data.split(/\.|\?|!/)
  size_array = sentence_array.map do |sentence|
    sentence.split(" ").size
  end
  sentence_array.each do |sentence| # clean up \n carriage returns
    sentence.gsub!("\n", " ")
  end
  puts "The longest sentence has #{size_array.max} words"
  puts "The longest sentence is:"
  puts sentence_array[size_array.index(size_array.max)]
end

# -------------------

# solution 2 - Official LS solution using Enumerable#max_by

# text = File.read('longest_sentence_read_file.txt')
# sentences = text.split(/\.|\?|!/)
# largest_sentence = sentences.max_by { |sentence| sentence.split.size }
# largest_sentence = largest_sentence.strip
# number_of_words = largest_sentence.split.size

# puts "#{largest_sentence}"
# puts "Containing #{number_of_words} words"

# -------------------

# Print Tests

# Test Cases

longest_sentence("longest_sentence_read_file.txt")
# longest_sentence("frankenstein.txt")