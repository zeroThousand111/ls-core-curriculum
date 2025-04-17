=begin
# Problem

Write a program that, given a word, computes the Scrabble score for that word.

Letter Values
You'll need the following tile scores:

Letter	Value
A, E, I, O, U, L, N, R, S, T	1
D, G	2
B, C, M, P	3
F, H, V, W, Y	4
K	5
J, X	8
Q, Z	10
How to Score

Sum the values of all the tiles used in each word. For instance, lets consider the word CABBAGE which has the following letters and point values:

3 points for C
1 point for each A (there are two)
3 points for B (there are two)
2 points for G
1 point for E
Thus, to compute the final total (14 points), we count:

3 + 2*1 + 2*3 + 2 + 1
=> 3 + 2 + 6 + 3
=> 5 + 9
=> 14

## Input: A string, a "word"
## Output: A positive Integer
## Rules:
### Explicit requirements
  - Grading given for each letter
  -
### Implicit requirements
  - Multiples of the same letter should be multiplied with the score, but tests don't bear this out; can arrive at same total by dealing with each character separately
  -
### Requirements inferred by tests
  - a Scrabble object is initialized with the word string passed as an argument
  - a Scrabble#score method needs to be created to output the total score
  - strings may contain control characters e.g. \t
  - no leading or trailing whitespace in the "word"
  - only one "word" passed to method, not a phrase
  - characters may be uppercase or lowercase
  - a `nil` may be present instead of a String

# Examples/Test Cases

# Data Structures

The values of letters could be described by a Hash:
e.g. {2=>[D, G], 3=> [B, C, M, P], etc.} OR
e.g. {[D, G]=>2, [B, C, M, P]=>3, etc.}

OR Regex e.g. score += 3 if char.match?(/[BCMP]/)

# Algorithm
* STEP
  + approach
    - procedure

* CREATE a total score variable and initialise as value of 0
* MOVE through string from first character to last
* EVALUATE value of each letter
  + use series of conditional logic with String#match? or String#=~ on each individual character to increment the value of total score according to grading scheme
* RETURN value of total score

=end

# Code
require 'pry'
require 'pry-byebug'

class Scrabble
  def initialize(string)
    @string = string
  end

  def self.score(string)
    Scrabble.new(string).score
  end

  def score
    score = 0
    return score if @string.nil?

    @string.chars do |char|
      score += 1 if char.match?(/[AEIOULNRST]/i)
      score += 2 if char.match?(/[DG]/i)
      score += 3 if char.match?(/[BCMP]/i)
      score += 4 if char.match?(/[FHVWY]/i)
      score += 5 if char.match?(/K/i)
      score += 8 if char.match?(/[JX]/i)
      score += 10 if char.match?(/[QZ]/i)
    end
    score
  end
end
