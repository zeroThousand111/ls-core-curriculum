=begin
# Problem
The diamond exercise takes as its input a letter, and outputs it in a diamond shape. Given a letter, it prints a diamond starting with 'A', with the supplied letter at the widest point.

The first row contains one 'A'.
The last row contains one 'A'.
All rows, except the first and last, have exactly two identical letters.
The diamond is horizontally symmetric.
The diamond is vertically symmetric.
The diamond has a square shape (width equals height).
The letters form a diamond shape.
The top half has the letters in ascending order.
The bottom half has the letters in descending order.
The four corners (containing the spaces) are triangles.

The method to make a diamond should first determine what letters are needed in each row of the diamond. Once that is done, iterate over the letters creating one row at a time.

## Input: a String character, a letter
## Output: a String or series of strings in a diamond pattern
## Rules:
### Explicit requirements
  - the letters in the output are capitals
  - 
  -
### Implicit requirements
  - to create the diamond shape, white spaces need to be inserted into:
    - the inside of the diamond, on lines from B onwards
    - the outside of the diamond, on all lines aside from the middle one
    - 
  -
# Examples/Test Cases
From the test cases shown above, we can see that we need to create a Diamond class. This class only needs one method:

A method that accepts one argument, a letter. This method should return a diamond based on the input letter.
This method is defined as a static or class method.
A few additional details to note:

The diamond always begins and ends with the letter A. The second row of B has one space between letters. All subsequent rows have an additional 2 spaces between letters compared to the previous row.

We need to preserve the width of the longest row in the shorter rows. That is, if "E" is the longest row and is 9 characters long, the A row needs to be 9 characters long also.

# Data Structures
Our input and output for the method are both strings. We may also want to use arrays to build our diamond, because its built-in methods may prove helpful.

# Algorithm

Method to make a diamond (Ruby: make_diamond; JavaScript: makeDiamond)

Create a range of letters: 'A' until the given letter and then back to 'A' in reverse. Note that the given letter only appears once in this range.
Calculate the width of the diamond. We will use a helper method.
Iterate over the range of letters, and create a row for each current letter. We will use a helper method.
Center the row with spaces
Join all rows with a newline and append a final newline.
Helper method: make a row

If current letter is 'A', return 'A'.
If current letter is 'B', return 'B B'.
Create and return a string consisting of the current letter separated by the appropriate number of spaces. A helper method is useful here.
Helper method: determine spaces between letters

If the letter is 'A', return "" (an empty string).
If the letter is 'B', return " " (a single space).
Starting with letter C, the amount of spaces needed between letters is 3. Every subsequent letter needs two more spaces: D needs 5, E needs 7, etc.
Use a loop to figure out the amount of spaces needed based on this formula
Return the correct amount of spaces as a string
Helper method: determine width of diamond

If the letter is 'A', return 1
Otherwise, determine number of spaces between letters and add 2 for the letters at either end.
Additional helpers may be needed.

* STEP
  + approach
    - procedure

=end

# Code
require 'pry'
require 'pry-byebug'

# solution 1 - first draft - before I read notes

# ALPHABET = ("A".."Z").to_a
# # ALPHABET = ("A".."Z").to_a.join # alternative to an array and use =~ with /regex/ argument to get the index

# class Diamond
#   attr_accessor :output, :index, :letter

#   def initialize(letter)
#     @letter = letter
#     @index = ALPHABET.index(letter)
#     # @index = ALPHABET~=/letter/ # alt method
#     @output = ''
#   end

#   def self.make_diamond(letter)
#     diamond = Diamond.new(letter)
#     diamond.build_top

#     diamond.output
#   end

#   # private

#   def build_top
#     outer_white_space = index
#     inner_white_space = 0
#     index = 0
#     until outer_white_space == -1
#       if ALPHABET[index] == "A"
#         output << "#{" " * outer_white_space}A\n"
#       else
#         output << "#{" " * outer_white_space}#{ALPHABET[index]}#{" " * (inner_white_space * 2 - 1)}#{ALPHABET[index]}\n"
#       end
      
#       index += 1
#       inner_white_space += 1
#       outer_white_space -= 1
#     end
#   end
# end

# solution 2 - second draft - after I read LS notes on algorithm

=begin                      width of diamond = 9 (E is index 4)
    string = "    A    \n"\ internal = 0 | external = 4 | letter_index = 0
             "   B B   \n"\ internal = 1 | external = 3 | letter_index = 1
             "  C   C  \n"\ internal = 3 | external = 2 | letter_index = 2
             " D     D \n"\ internal = 5 | external = 1 | letter_index = 3
             "E       E\n"\ internal = 7 | external = 0 | letter_index = 4
             " D     D \n"\ internal = 5 | external = 1 | letter_index = 3
             "  C   C  \n"\ internal = 3 | external = 2 | letter_index = 2
             "   B B   \n"\ internal = 1 | external = 3 | letter_index = 1
             "    A    \n"  internal = 0 | external = 4 | letter_index = 0
=end

class Diamond

  def self.make_diamond(letter)
    @letter = letter
    @range = (("A"..letter).to_a) + (("A"...letter).to_a.reverse)
    # @diamond_width = calc_diamond_width #range.index(letter)

    rows = @range.map do |current_letter|
      "#{leading_whitespace(current_letter)}#{make_row(current_letter)}#{leading_whitespace(current_letter)}"
    end.join("\n") + "\n"
    
    rows
  end

  private

  def self.make_row(current_letter)
    if current_letter == "A"
      "A"
    else
      "#{current_letter}#{" " * calc_internal_width(current_letter)}#{current_letter}"
    end
  end

  def self.leading_whitespace(current_letter)
    difference = @range.index(@letter) - @range.index(current_letter)
    " " * difference
  end

  def self.calc_internal_width(letter)
    (@range.index(letter) * 2) - 1 
  end

  # def self.calc_diamond_width
  #   (@range.index(@letter) * 2) + 1
  # end

end

# My Tests

# p Diamond.make_diamond("A")
# p Diamond.make_diamond("B")
# p Diamond.make_diamond("C")
# p Diamond.make_diamond("E")