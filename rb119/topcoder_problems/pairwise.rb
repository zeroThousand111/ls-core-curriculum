=begin
Given an array `arr`, find element pairs whose sum equal the second argument `arg` and return the sum of their indices.

You may use multiple pairs that have the same numeric elements but different indices. Each pair should use the lowest possible available indices. Once an element has been used it cannot be reused to pair with another element. For instance, `pairwise([1, 1, 2], 3)` creates a pair `[2, 1]` using the 1 at index 0 rather than the 1 at index 1, because 0+2 < 1+2.

# UNDERSTAND THE PROBLEM
## INPUT: an array of integers, and an integer
## OUTPUT: an integer
## RULES
### Explicit requirements
  - find element pairs whose sum equal the second argument (the target value);
  - identify the indices of those pairs
  - sum the pair of indices
  - return the sum of all the index pairs that have matched the target value
  + Once an element has been used it cannot be reused to pair with another element
  
### Implicit requirements
  - the array can contain any number of integers, even zero elements
  - what is a "pair"?
    - it will be necessary to create all possible pairs and compare the sum of their values with the target value
  - only one permutation of the pair are compared e.g. in the array [7, 9, 11, 13, 15], from the example below, the pairs [7, 13] and [9, 11] add up to 20, but the pairs [13, 7] and [11, 9] are not included in the comparison
  - duplicate values are allowed in the input array e.g [1, 1, 1]

# EXAMPLES

For example `pairwise([7, 9, 11, 13, 15], 20)` returns `6`. The pairs that sum to 20 are `[7, 13]` and `[9, 11]`. We can then write out the array with their indices and values.

|Index|0|1|2|3|4|
|---|---|---|---|---|---|
|Value|7|9|11|13|15|

Below we'll take their corresponding indices and add them.

7 + 13 = 20 → Indices 0 + 3 = 3  
9 + 11 = 20 → Indices 1 + 2 = 3  
3 + 3 = 6 → Return `6`

# TEST CASES 

pairwise([1, 4, 2, 3, 0, 5], 7) == 11
pairwise([1, 3, 2, 4], 4) == 1
pairwise([1, 1, 1], 2) == 1
pairwise([0, 0, 0, 0, 1, 1], 1) == 10
pairwise([], 100) == 0

# DATA STRUCTURES
Input: Array of integers
Intermediate: arrays of pairs, maybe even a Hash 
Which way around to store value and index?  { value => index} or {index => value }?  I think I prefer {index => value }
e.g. [9, 5]  => [{0 => 9, 1 => 5}]


# ALGORITHM

* DON'T CREATE an array of all possible pairs from the input array - it becomes too complex and unwieldy to track values and indices

* MOVE through the input array of integers and select each pair in turn
  + simplest with two nested iterators (two nested #upto arrays)
  + outer loop is the first integer of the pair, going from index 0 to index -2
  + inner loop is the second integer of the pair, going from index 1 to index- -1
  + stop when all pairs have been compared
  + skip if a pair is matched (see step below)

* COMPARE the sum of values of each pair with the target integer
  + use Array#sum
    - if input_array[index1] + input_array[index2] == target

* ACT on the comparision
  + IF the sum of values don't match the target, move on
  + IF the sum of values does match the target AND the numbers at those indices haven't been used before
    + sum the indices and store in a sum of sums variable
        - sums_array << [index1, index2].sum
    + store the indices in a used array
        - used << index1, used << index2
* STOP moving through the array of all possible pairs
* RETURN the sum of the sums array
=end

require 'pry'
require 'pry-byebug'

def pairwise(input_array, target)
  sums_array = []
  used_indices = []
  0.upto(input_array.size - 2) do |index1|
    (index1 + 1).upto(input_array.size - 1) do |index2|
      # p [input_array[index1], input_array[index2]] # all pairs
      if input_array[index1] + input_array[index2] == target && !used_indices.include?(index1) && !used_indices.include?(index2)
        sums_array << [index1, index2].sum
        used_indices << index1 << index2
        # p [input_array[index1], input_array[index2]] # selected pairs
      end
    end
  end
  sums_array.sum
end

# MAIN TEST CASES

p pairwise([1, 4, 2, 3, 0, 5], 7) == 11
p pairwise([1, 3, 2, 4], 4) == 1
p pairwise([1, 1, 1], 2)  == 1
p pairwise([0, 0, 0, 0, 1, 1], 1)  == 10
p pairwise([], 100) == 0