=begin
54. Are they the "same"?
(​https://www.codewars.com/kata/550498447451fbbd7600041c​)
6 kyu
Given two arrays a and b write a function comp(a, b) that checks whether the two arrays have the "same" elements, with the same multiplicities. "Same" means, here, that the elements in b are the elements in a squared, regardless of the order.

# UNDERSTAND THE PROBLEM
## INPUT: two arrays of integers.  integers are positive.  arrays
## OUTPUT: a boolean true or false
## RULES
### Explicit requirements:
  - return true if the arrays are the "same"
  - "same" means that the integers of array b are the squares of the integers in array a
### Implicit requirements:
  - An empty array may be input
  - To return true, there should be the same number of elements in a and b
  
# EXAMPLES

Examples
Valid arrays
a = [121, 144, 19, 161, 19, 144, 19, 11]
b = [121, 14641, 20736, 361, 25921, 361, 20736, 361]
comp(a, b) returns true because in b 121 is the square of 11, 14641 is the square of 121, 20736 the square of 144, 361 the square of 19, 25921 the square of 161, and so on. It gets obvious if we write b's elements in terms of squares:
a = [121, 144, 19, 161, 19, 144, 19, 11]
b = [11*11, 121*121, 144*144, 19*19, 161*161, 19*19, 144*144, 19*19]
Invalid arrays
If we change the first number to something else, comp may not return true anymore:
a = [121, 144, 19, 161, 19, 144, 19, 11]
b = [132, 14641, 20736, 361, 25921, 361, 20736, 361]
comp(a,b) returns false because in b 132 is not the square of any number of a.
  
a = [121, 144, 19, 161, 19, 144, 19, 11]
b = [121, 14641, 20736, 36100, 25921, 361, 20736, 361]
comp(a,b) returns false because in b 36100 is not the square of any number of a.
Remarks
a or b might be [] (all languages except R, Shell).
a or b might be nil or null or None or nothing (except in Haskell, Elixir, C++, Rust, R, Shell, PureScript). If a or b are nil (or null or None), the problem doesn't make sense so return false.
Note for C
The two arrays have the same size (> 0) given as parameter in function comp.

# DATA STRUCTURES
INPUT: two arrays of integers
OUTPUT: a boolean value
INTERMEDIATE: maybe not needed

# ALGORITHM
## HIGH LEVEL
1. Return false if the number of elements in arrays a and b is not the same
2. Check that array b contains every squared value of elements in array a, else return false
3. Check that array a contains every square root value of elements in array a, else return false
4. Return true if steps 2 and 3 haven't returned false

1. Return false if the number of elements in arrays a and b is not the same
* RETURN false if either a or b are nil
* COMPARE sizes of arrays a and b
    - return false if a.size != b.size
2. Check that array b contains every squared value of elements in array a, else return false
* SORT arrays a and b into increasing value
  + use #sort
    - a_sorted = a.sort
    - b_sorted = b.sort
* MOVE through every element in array a from first element to the last
  + use #each_with_index
* CALCULATE the square of current element
* CHECK that the square value is included in array b
    - 
* ACT upon above check
  + return false if square value is not include in array b
  + else move on 
3. Check that array a contains every square root value of elements in array a, else return false
4. Return true if steps 2 and 3 haven't returned false
=end

require 'pry'
require 'pry-byebug'

def comp(a, b)
  
  return false if a.is_a?(Array) == false || b.is_a?(Array) == false
  return false if a.size != b.size
  
  a_sorted = a.sort
  b_sorted = b.sort

  a_sorted.each_with_index do |anum, index|
    return false unless b_sorted[index] == anum ** 2
  end
  
  true
end

p comp([121, 144, 19, 161, 19, 144, 19, 11], [121, 14641, 20736, 361, 25921, 361, 20736, 361]) == true
p comp([121, 144, 19, 161, 19, 144, 19, 11] , [132, 14641, 20736, 361, 25921, 361, 20736, 361]) == false
p comp(nil, [1, 2, 3]) == false
p comp([1, 2], []) == false
p comp([1, 2], [1, 4, 4]) == false