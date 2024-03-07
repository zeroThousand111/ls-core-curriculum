=begin
# Problem
>In this kata, your goal is to write a function which will reverse the vowels in a string. Any characters which are not vowels should remain in their original position. Here are some examples:
> 
> "Hello!" => "Holle!"
> 
> "Tomatoes" => "Temotaos"
> 
> "Reverse Vowels In A String" => "RivArsI Vewols en e Streng"
> 
> For simplicity, you can treat the letter y as a consonant, not a vowel.

# Examples
"Hello!" => "Holle!"

"Tomatoes" => "Temotaos"
 
"Reverse Vowels In A String" => "RivArsI Vewols en e Streng"

# Rules
## Input: A String, which could be one or more words with whitespace and non-alphabetic characters

## Output:
- a string
- a new string or the same string?  Doesn't say
- only the vowels have reversed order, other characters stay the same

"Hello!" => "Holle!"
["]

# Data Structures

Arrays

# Algorithm

1. TRANSFORM the string into an array of characters
  a. Split the string
    i. String#split(//)
2. IDENTIFY which characters are vowels
  a. vowels also include 'y'
  b. use #match? and can use regex
    i. char.match?(/['aeiouy']/)
  c. use #include? but can't use regex
    i.
  d. use #count? == 1
    i.  char.count?('aeiouy') == 1
3. CREATE a vowel array and COPY the vowels into a new array 
  a.copying is easy
    i. vowel_array << vowel
4. CREATE a new placeholder array them in the main array with placeholders e.g. strings.  This will be simpler than modifying the main array?
  a. IF char is a vowel, copy vowel to vowel_array AND copy string placeholder to placeholder array
  b. IF char is not a vowel, just copy it to the placeholder array
    i. 
5. REVERSE the order of the vowel array
. a. use Array#reverse
  b. use Array#sort (with a block in reverse)
6. INSERT the reordered vowels back into the placeholder array at the index positions with placeholders (or INSERT them from the non-sorted vowel array in reverse order)
  a. move through the place holder array
  b. when a placeholder is encountered, the next char from vowel array is inserted at that point
    i. either #pop (if vowel array not reversed) OR
    ii. #unshift (if vowel array was reversed)
7. JOIN the placeholder array of characters back into a string

=end

require 'pry'
require 'pry-byebug'

# solution 1 - using #each to build new arrays

def reverse_vowels(string)
  array = string.split(//)
  placeholder_array = []
  vowel_array = []
  output_array = []
  
  array.each do |char|
    if char.match?(/[aeiouyAEIOUY]/)
      placeholder_array << "X"
      vowel_array << char
    else
      placeholder_array << char
    end
  end
  
  placeholder_array.each do |char|
    if char.match?('X')
      output_array << vowel_array.pop
    else
      output_array << char
    end
  end
  
  output_array.join
end

# solution 2 - using #count to find vowels and #map to create output array at the end

def reverse_vowels(string)
  array = string.split(//)
  placeholder_array = []
  vowel_array = []
  
  array.each do |char|
    if char.count('aeiouyAEIOUY') == 1
      placeholder_array << "X"
      vowel_array << char
    else
      placeholder_array << char
    end
  end
  
  placeholder_array.map { |char| char.match?('X') ? vowel_array.pop : char }.join
end

# print tests
# p reverse_vowels('Hello!')
# p reverse_vowels('Tomatoes')
# p reverse_vowels('Reverse Vowels In A String')

# test cases
p reverse_vowels('Hello!') == "Holle!"
p reverse_vowels('Tomatoes') == "Temotaos"
p reverse_vowels('Reverse Vowels In A String') == "RivArsI Vewols en e Streng"