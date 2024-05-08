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

## Input:
## Output:
## Rules:
### Explicit requirements
  - 
  -
### Implicit requirements
  -
  -
# Examples/Test Cases

egyptian(Rational(2, 1))    # -> [1, 2, 3, 6]
egyptian(Rational(137, 60)) # -> [1, 2, 3, 4, 5]
egyptian(Rational(3, 1))    # -> [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 15, 230, 57960]

unegyptian(egyptian(Rational(1, 2))) == Rational(1, 2)
unegyptian(egyptian(Rational(3, 4))) == Rational(3, 4)
unegyptian(egyptian(Rational(39, 20))) == Rational(39, 20)
unegyptian(egyptian(Rational(127, 130))) == Rational(127, 130)
unegyptian(egyptian(Rational(5, 7))) == Rational(5, 7)
unegyptian(egyptian(Rational(1, 1))) == Rational(1, 1)
unegyptian(egyptian(Rational(2, 1))) == Rational(2, 1)
unegyptian(egyptian(Rational(3, 1))) == Rational(3, 1)

# Data Structures

# Algorithm
* STEP
  + approach
    - procedure

=end

# Code
require 'pry'
require 'pry-byebug'
