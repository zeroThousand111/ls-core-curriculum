=begin
# Problem

A Rational Number is any number that can be represented as the result of the division between two integers, e.g., 1/3, 3/2, 22/7, etc. The number to the left is called the numerator, and the number to the right is called the denominator.

A Unit Fraction is a rational number where the numerator is 1.

An Egyptian Fraction is the sum of a series of distinct unit fractions (no two are the same), such as:

1   1    1    1
- + - + -- + --
2   3   13   15

Every positive rational number can be written as an Egyptian fraction. For example:

    1   1   1   1
2 = - + - + - + -
    1   2   3   6

Write two methods: one that takes a Rational number as an argument, and returns an Array of the denominators that are part of an Egyptian Fraction representation of the number, and another that takes an Array of numbers in the same format, and calculates the resulting Rational number. You will need to use the Rational class provided by Ruby.

Every rational number can be expressed as an Egyptian Fraction. In fact, every rational number can be expressed as an Egyptian Fraction in an infinite number of different ways. Thus, the first group of examples may not show the same values as your solution. They do, however, show the expected form of the solution. The remaining examples merely demonstrate that the output of egyptian can be reversed by unegyptian.

HINT:

You will need to read about the Rational class. This is part of ruby's core library.

Note that the techniques for calculating Egyptian Fractions shown on the Wikipedia page may not be the easiest to understand or implement -- the methods described there are generally meant to arrive at a solution as quickly as possible or to arrive at a specific solution (such as the shortest solution). Feel free to use a simpler method: check whether 1 / 1 can be part of the solution, then 1 / 2, then 1 / 3, then 1 / 4, and so on. This is relatively easy to implement compared to some other techniques.

# UNDERSTAND THE PROBLEM
There are two problems, not one.

# PROBLEM 1 - EGYPTIAN
## Input: two Integers, representing the numerator and denominator of a rational number (i.e. a fraction!)
## Output: an array of Integers, representing the denominators of the unit fractions (1/1, 1/2, 1/3, etc) that can describe the input rational number as Egyptian fractions
## Rules:
### Explicit requirements
  - use the Rational class of Ruby objects
  - rather than using a complicated algorithm (such as the Greedy Algorithm), just check whether 1 / 1 can be part of the solution, then 1 / 2, then 1 / 3, then 1 / 4, and so on.
### Implicit requirements
  - a rational number is any number that can be described as a fraction
  - an Egyptian fraction is made up of unit fractions, which are fractions that have 1 as the numerator i.e. (1/something)
  - the sum of the unit fractions equate to the rational number
  - an infinite number (really?) of Egyptian fractions could be used to describe a given rational number, so there won't be one definitive answer to test against, but use the above simple algorithm

# Examples/Test Cases

egyptian(Rational(2, 1))    # -> [1, 2, 3, 6]
egyptian(Rational(137, 60)) # -> [1, 2, 3, 4, 5]
egyptian(Rational(3, 1))    # -> [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 15, 230, 57960]

# DATA STRUCTURES
An array of integers, representing the denominators of the Egyptian fractions

# ALGORITHM
* CREATE a rational number from the two arguments
  + have to do this to be able to use Rational class methods
    - Rational(numerator, denominator)
* CREATE a total local variable to track the sum of the unit fractions remaining to match against the target i.e. the input rational number.  Set total as zero initially but as a rational number
  + track remainder as a Float value
    - total = 0r
* CREATE an array of denominators, that will be returned at the end
    - array_of_denominators = []
--- start loop
* ITERATE through a decreasing list of potential unit fractions, starting at 1/1, then 1/2, then 1/3, etc.
  + use an until loop
  + each iteration is 1/x, 1/(x+1), 1/(x+2)
  + transform each unit fraction to a rational number
    - unit_fraction = Rationa(1, interation)
    - iteration += 1
* DETERMINE if the current unit fraction will fit in the remainder
  + rational - total
  + condition will be:
    - total + Rational(1, iteration) < rational
* ACT on the result of the determination
  + IF it does fit, SHOVEL the denominator into the array of denominators AND subtract that unit fraction from the rational number
  + IF not, move on
* STOP iterating if remaining variable == 0
--- end loop
* RETURN array of denominators

-----

# PROBLEM 2 - UNEGYPTIAN

## Input: an array of Integers, representing an array of denominators of unit fractions e.g. (1/1, 1/2, etc.), representing an Egyptian fraction
## Output: a Rational number
## Rules:
### Explicit requirements
  - use the Rational class of Ruby objects
  -rather than using a complicated algorithm (such as the Greedy Algorithm), just check whether 1 / 1 can be part of the solution, then 1 / 2, then 1 / 3, then 1 / 4, and so on.
### Implicit requirements
  -
  -
# Examples/Test Cases

unegyptian(egyptian(Rational(1, 2))) == Rational(1, 2)
unegyptian(egyptian(Rational(3, 4))) == Rational(3, 4)
unegyptian(egyptian(Rational(39, 20))) == Rational(39, 20)
unegyptian(egyptian(Rational(127, 130))) == Rational(127, 130)
unegyptian(egyptian(Rational(5, 7))) == Rational(5, 7)
unegyptian(egyptian(Rational(1, 1))) == Rational(1, 1)
unegyptian(egyptian(Rational(2, 1))) == Rational(2, 1)
unegyptian(egyptian(Rational(3, 1))) == Rational(3, 1)

# Data Structures
An array of Integers, representing an array of unit fractions

# Algorithm
* CREATE a local variable to track the total
 + this will be a Rational number in ruby
   - total = 0r
* ITERATE through the input array of denominators from first to last
  + use #each
* SUM the total with the current unit fraction (1/denominator)
  + 
    - total += Rational(1, denominator)
* STOP iterating through the input array
(* REDUCE instead of the above two steps?)
* RETURN total
=end

# Code
require 'pry'
require 'pry-byebug'

def egyptian(rational)
  total = 0r
  array_of_denominators = []
  iteration = 1
  until total == rational
    if total + Rational(1, iteration) <= rational
      array_of_denominators << iteration
      total += Rational(1, iteration)
    end
    iteration += 1
  end
  array_of_denominators
end

# p egyptian(Rational(2, 1))    # -> [1, 2, 3, 6]
# p egyptian(Rational(137, 60)) # -> [1, 2, 3, 4, 5]
# p egyptian(Rational(3, 1))    # -> [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 15, 230, 57960]

def unegyptian(array_of_denominators) # using #each
  total = 0r
  array_of_denominators.each do |denominator|
    p total += Rational(1, denominator)
  end
  total
end

def unegyptian(array_of_denominators) # using #reduce
  array_of_denominators.reduce(0r) do |concat, denominator|
      concat += Rational(1, denominator)
  end
end

# my tests for unegyptian
p unegyptian([2]) == Rational(1, 2)
p unegyptian([2, 4]) == Rational(3, 4)
p unegyptian([1, 2, 3, 6]) == Rational(2, 1) 
p unegyptian([1]) == Rational(1, 1)
p unegyptian([1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 15, 230, 57960]) == Rational(3, 1)

# official tests for unegyptian - they all pass!
p unegyptian(egyptian(Rational(1, 2))) == Rational(1, 2) 
p unegyptian(egyptian(Rational(3, 4))) == Rational(3, 4)
p unegyptian(egyptian(Rational(39, 20))) == Rational(39, 20)
p unegyptian(egyptian(Rational(127, 130))) == Rational(127, 130)
p unegyptian(egyptian(Rational(5, 7))) == Rational(5, 7)
p unegyptian(egyptian(Rational(1, 1))) == Rational(1, 1)
p unegyptian(egyptian(Rational(2, 1))) == Rational(2, 1)
p unegyptian(egyptian(Rational(3, 1))) == Rational(3, 1)