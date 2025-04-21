=begin
# Problem
Write a program that, given a natural number and a set of one or more other numbers, can find the sum of all the multiples of the numbers in the set that are less than the first number. If the set of numbers is not given, use a default set of 3 and 5.

For instance, if we list all the natural numbers up to, but not including, 20 that are multiples of either 3 or 5, we get 3, 5, 6, 9, 10, 12, 15, and 18. The sum of these multiples is 78.

Some items from the instructions we want to keep in mind:

- We might be given a list of numbers for which we want to find the multiples, or we might not.
- If we are, we should use them as specified.
- If we are not given the list, use 3 and 5 as the default list.
- We are also given a limiting value. We need to sum all of the multiples of the numbers in the list up to, but not including, the limiting value.

We need two methods named to: one is an instance method, the other is a class or static method.

The to instance method should first determine and save the multiples, then compute the sum of the multiples. Two iterations are better than one.

The to class/static method can take advantage of the constructor and the to instance method.

## Input: a positive Integer, the limiting value, AND MAYBE a list of numbers to multiply (or use 3 and 5 by default)
## Output: an Integer
## Rules:
### Explicit requirements
  - collect all the multiples of the numbers given up to the limiting value and return their sum
  -
### Implicit requirements
  - a "multiple" is a positive Integer that is a one of the original numbers multiplied by an Integer that is less than the limiting value
  - don't count a multiple twice if it happens to be a multiple of two or more numbers, for example, 15 is a multiple of 3 and 5
  - 

# Examples/Test Cases

(20, 3, 5) => [3, 5, 6, 9, 10, 12, 15, 18] => 78

From the test cases shown above, we can see that we need to create a SumOfMultiples class. The class should have 3 methods as follows:

a constructor that takes the list of numbers for which we want to find the multiples. If the list is not specified, we should use 3 and 5.
an instance method named to that computes the sum of all multiples of the list numbers that are less than argument passed to to.
a class (or static) method that is also named to that does the same thing. However, this method has no way to define the list of numbers, so it always defaults to 3 and 5.
We may also want to create some helper methods to assist us, but those are optional.

# Data Structures

An array of multiples would be easy to sum with Array#sum

We're definitely interacting with numbers, no matter our language of choice. It will also help to keep the multiples, however many they are, stored in a collection. An array will work well.

# Algorithm

constructor

If one or more arguments are given, save them as the list of numbers for which we want the multiples.
If no arguments are given, save 3 and 5 as the list of numbers.
Method: to (instance method)

Create an empty result collection.
Takes one argument that gives the limiting value.
Iterate from 1 through one less than the limiting value.
Is the current number a multiple of one of the list of numbers?
Yes: append it to the result collection.
Initialize sum to 0.
Iterate through the result collection.
Add the current value to the sum.
Return the sum.
Method: to (class/static method)

Accept one argument that gives the limiting value
Create a new SumOfMultiples object with the default list of numbers.
Call the new object's to method with the limiting value as an argument.
Return the result of calling the new object's to method.

=end

# Code
require 'pry'
require 'pry-byebug'

# SOLUTION 1 - FIRST DRAFT

# class SumOfMultiples
#   attr_reader :list_of_numbers

#   def initialize(*list_of_numbers)
#     if list_of_numbers.empty?
#       @list_of_numbers = [3,5]
#     else
#       @list_of_numbers = list_of_numbers
#     end
#   end

#   def self.to(limiting_value)
#     object = SumOfMultiples.new
#     object.to(limiting_value)
#   end

#   def to(limiting_value)
#     result = []
#     1.upto(limiting_value - 1) do |candidate|
#       result << candidate if is_a_multiple?(candidate)
#     end
#     result.sum
#   end

#   private

#   def is_a_multiple?(candidate)
#     list_of_numbers.any? do |number|
#       candidate % number == 0
#     end
#   end
# end

# SOLUTION 2 - REFACTOR

class SumOfMultiples
  attr_reader :list_of_numbers

  def initialize(*list_of_numbers)
    @list_of_numbers = list_of_numbers.empty? ? [3,5] : list_of_numbers
  end

  def self.to(limiting_value)
    SumOfMultiples.new.to(limiting_value)
  end

  def to(limiting_value)
    result = []
    1.upto(limiting_value - 1) do |candidate|
      result << candidate if is_a_multiple?(candidate)
    end
    result.sum
  end

  private

  def is_a_multiple?(candidate)
    list_of_numbers.any? do |list_number|
      candidate % list_number == 0
    end
  end
end
