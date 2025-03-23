=begin
# Problem
Iterators: True for Any?
A great way to learn about blocks is to implement some of the core Ruby methods that use blocks using your own code. Over this exercise and the next several exercises, we will do this for a variety of different standard methods.

The Enumerable#any? method processes elements in a collection by passing each element value to a block that is provided in the method call. If the block returns a truthy value for any element, then #any? returns true. Otherwise, #any? returns false. Note in particular that #any? will stop searching the collection the first time the block returns true.

Write a method called any? that behaves similarly for Arrays. It should take an Array as an argument, and a block. It should return true if the block returns true for any of the element values. Otherwise, it should return false.

Your method should stop processing elements of the Array as soon as the block returns true.

If the Array is empty, any? should return false, regardless of how the block is defined.

Your method may not use any standard Ruby method that is named all?, any?, none?, or one?.

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

any?([1, 3, 5, 6]) { |value| value.even? } == true
any?([1, 3, 5, 7]) { |value| value.even? } == false
any?([2, 4, 6, 8]) { |value| value.odd? } == false
any?([1, 3, 5, 7]) { |value| value % 5 == 0 } == true
any?([1, 3, 5, 7]) { |value| true } == true
any?([1, 3, 5, 7]) { |value| false } == false
any?([]) { |value| true } == false
# Data Structures

# Algorithm
* STEP
  + approach
    - procedure

=end

# Code
require 'pry'
require 'pry-byebug'

# My Solution - I was proud of this and did it in under a minute

def any?(array)
  for i in array do 
    return true if yield(i)
  end
  false
end

## LS Solution

# def any?(collection)
#   collection.each { |item| return true if yield(item) }
#   false
# end

# test cases
p any?([1, 3, 5, 6]) { |value| value.even? } == true
p any?([1, 3, 5, 7]) { |value| value.even? } == false
p any?([2, 4, 6, 8]) { |value| value.odd? } == false
p any?([1, 3, 5, 7]) { |value| value % 5 == 0 } == true
p any?([1, 3, 5, 7]) { |value| true } == true
p any?([1, 3, 5, 7]) { |value| false } == false
p any?([]) { |value| true } == false

# my test cases - hashes also work with both my solution and LS solution!

p any?({a: 1, b: 2}) { |key, value| value.even? } == true

=begin
Discussion
Our solution simply iterates through our collection, and returns true the first time it encounters an item that produces a true result when it is yielded to the block. If no such item is encountered, we return false.

Further Exploration
Our solution uses #each for the main loop. The advantage of doing this is that any? will work with any Enumerable collection, including Arrays, Hashes, Sets, and more. So, even though we only need any? to work with Arrays, we get additional functionality for free.

Does your solution work with other collections like Hashes or Sets?
=end


