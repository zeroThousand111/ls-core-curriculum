=begin
12. Detect Pangram
(​https://www.codewars.com/kata/545cedaa9943f7fe7b000048/train/ruby​)

6 kyu

A pangram is a sentence that contains every single letter of the alphabet at least once. For example, the sentence "The quick brown fox jumps over the lazy dog" is a pangram, because it uses the letters A-Z at least once (case is irrelevant).

Given a string, detect whether or not it is a pangram. Return True if it is, False if not. Ignore numbers and punctuation.

p panagram?("The quick brown fox jumps over the lazy dog.") == true
p panagram?("This is not a pangram.") == false

# ALGORITHM
* CREATE an array of every character in the alphabet
* MOVE through the input string, character by character, from the first character to the last
* DELETE the downcased current character in the array of characters
* STOP moving through the input string
* DETERMINE if the alphabet array is empty
  + IF it is empty, then return true, the input string is a pangram
  + ELSE return false, the input string is not a pangram
=end

def panagram?(string)
  alphabet = ("a".."z").to_a
  string.each_char do |char|
    alphabet.delete_if { |letter| letter == char.downcase }
  end
  alphabet.empty?
end

p panagram?("The quick brown fox jumps over the lazy dog.") == true
p panagram?("This is not a pangram.") == false