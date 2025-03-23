=begin
# Problem
Write a method that takes an array as an argument, and a block that returns true or false depending on the value of the array element passed to it. The method should return a count of the number of times the block returns true.

You may not use Array#count or Enumerable#count in your solution.

# Examples/Test Cases
count([1,2,3,4,5]) { |value| value.odd? } == 3
count([1,2,3,4,5]) { |value| value % 3 == 1 } == 2
count([1,2,3,4,5]) { |value| true } == 5
count([1,2,3,4,5]) { |value| false } == 0
count([]) { |value| value.even? } == 0
count(%w(Four score and seven)) { |value| value.size == 5 } == 2

=end

# Code
require 'pry'
require 'pry-byebug'

# My solution

def count(array)
  truthy_count = 0
  array.each do |element|
    truthy_count += 1 if yield(element)
  end
  truthy_count
end

# LS Solution

def count(array)
  total = 0
  array.each { |value| total += 1 if yield value }
  total
end

# Further Exploration
# Don't use loop, #each, while or until

def count(array)
  truthy_count = 0
  for element in array do # i used a for loop: is this allowed?!
    truthy_count += 1 if yield(element)
  end
  truthy_count
end

p count([1,2,3,4,5]) { |value| value.odd? } == 3
p count([1,2,3,4,5]) { |value| value % 3 == 1 } == 2
p count([1,2,3,4,5]) { |value| true } == 5
p count([1,2,3,4,5]) { |value| false } == 0
p count([]) { |value| value.even? } == 0
p count(%w(Four score and seven)) { |value| value.size == 5 } == 2
