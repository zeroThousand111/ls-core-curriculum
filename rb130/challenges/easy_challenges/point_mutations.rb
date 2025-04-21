=begin
______________________________________________________________________________
*****Understand the PROBLEM*****
______________________________________________________________________________
THE PROBLEM:
Write a program that can calculate the Hamming distance between two DNA strands.

A mutation is simply a mistake that occurs during the creation or copying of a nucleic acid, in particular DNA. Because nucleic acids are vital to cellular functions, mutations tend to cause a ripple effect throughout the cell. Although mutations are technically mistakes, a very rare mutation may equip the cell with a beneficial attribute. In fact, the macro effects of evolution are attributable to the accumulated result of beneficial microscopic mutations over many generations.

The simplest and most common type of nucleic acid mutation is a point mutation, which replaces one base with another at a single nucleotide.

By counting the number of differences between two homologous DNA strands taken from different genomes with a common ancestor, we get a measure of the minimum number of point mutations that could have occurred on the evolutionary path between the two strands.

This is called the Hamming distance.

GAGCCTACTAACGGGAT
CATCGTAATGACGGCCT
^ ^ ^  ^ ^    ^^
The Hamming distance between these two DNA strands is 7.

The Hamming distance is only defined for sequences of equal length. If you have two sequences of unequal length, you should compute the Hamming distance over the shorter length.

For our program, the details we need to keep in mind are as follows:

- We will be given two strands of DNA.
- We need to count the differences between them.
- If one strand is shorter than the other, we only need to check for differences for the length of the shorter strand.

INPUT: two Strings of equal or unequal length, containing four characters, C, G A, T

OUTPUT: an Integer

RESTATE THE PROBLEM:
Compare the two characters at the same index position in both Strings:
  - Ignore if they are the same
  - If they are not the same, increment a count total
  - Return the count total after moving through both strings
  - If the strings are unequal length, stop moving at the end of the shorter one

RULES
EXPLICIT REQUIREMENTS:
  - Problem requires a DNA class
  - DNA class constructor accepts a String (the DNA sequence)
  - No validation required in DNA constructor
  - Instance method required (i.e. DNA#hamming_distance) to compare differences in the strings of two DNA class objects.
  - 
  
IMPLICIT REQUIREMENTS:
  - The comparison in the #hamming_distance method is NOT between two DNA objects, it is between one DNA object (self) and a String argument to the method
  -
  -

QUESTIONS:
  - do we need to validate against non-CGAT characters in the DNA?
  - Method for calculating Hamming distance:
    + How can we know which DNA strand is shorter?
    + How can we count the differences between them? What kind of iteration will help us do that?
______________________________________________________________________________
*****EXAMPLES/TEST CASES*****
______________________________________________________________________________
From the test cases shown above, we can see that we need to create a DNA class. The class should have 2 methods as follows:

A constructor that accepts a DNA strand string as argument. The constructor does not raise any errors.

A method that accepts a second DNA strand string as an argument and returns the differences between the two strands — the Hamming distance.

We may also want to create some helper methods to assist us, but those are optional.

______________________________________________________________________________
*****DATA STRUCTURES*****
______________________________________________________________________________
We're given the DNA strands as strings. Additionally, we may want to use a collection to help us iterate through each character of the DNA strand.

I could move through a String or move through an Array of characters
______________________________________________________________________________
*****ALGORITHM*****
______________________________________________________________________________
1. Requirement — The important, generalized steps required to navigate from the input to the desired output.
  a. Approach — The process that will be utilized to accomplish each Requirement.
    i. Procedure — Specific details to implement the Approach.

1. DETERMINE which string is shorter
  a.
    i.
2. MOVE through the shorter string one index position at a time from first to last
  a.
    i.
3. COMPARE if two characters at same index position are the same
  a.String#== would work to test equality
    i.
4. INCREMENT count total if two characters are not the same
  a.
    i.
5.
  a.
    i.
______________________________________________________________________________

Now CODE with intent!
=end

require 'pry'
require 'pry-byebug'

# solution 1 - First Draft

# class DNA
#   attr_reader :string

#   def initialize(string)
#     @string = string
#   end

#   def hamming_distance(other_string)
#     # determine shorter string and assign strings to local variables short and long
#     other = DNA.new(other_string)
#     if is_self_shorter_than_other?(other)
#       short, long = self.string.chars, other.string.chars
#     else
#       short, long = other.string.chars, self.string.chars
#     end

#     # move through the chars of the shorter strings 
#     count = 0
#     short.each_index do |index|
#       count +=1 if short[index] != long[index]
#     end

#     # return count total
#     count
#   end

#   protected

#   def is_self_shorter_than_other?(other)
#     other.string.length > self.string.length
#   end
# end

# -------------------

# solution 2 - Refactor with ternary statement to determine length of shortest string

class DNA
  attr_reader :string

  def initialize(string)
    @string = string
  end

  def hamming_distance(other_string)
    
    shortest_length = self.string.length < other_string.length ? self.string.length : other_string.length
   
    count = 0

    0.upto(shortest_length - 1) do |index|
      count +=1 if self.string[index] != other_string[index]
    end

    count
  end
  
end

# -------------------

# solution 3 - LS Solution

# class DNA
#   def initialize(strand)
#     @strand = strand
#   end

#   def hamming_distance(comparison)
#     shorter = @strand.length < comparison.length ? @strand : comparison
#     differences = 0

#     shorter.length.times do |index|
#       differences += 1 unless @strand[index] == comparison[index]
#     end

#     differences
#   end
# end

# -------------------

# solution 4 - 

# -------------------

# solution 5 - 

# -------------------

# Print Tests

# Test Cases

string1 = DNA.new("AAAAA")
string_arg = "AAAAG"

puts string1.hamming_distance(string_arg)