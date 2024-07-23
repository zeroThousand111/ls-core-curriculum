=begin
55. Grouping and Counting
(​https://www.codewars.com/kata/53a452dd0064085711001205​)
6 kyu

Your goal is to write the group_and_count method, which should receive an array as a unique parameter and return a hash. Empty or nil input must return nil instead of a hash. This hash returned must contain as keys the unique values of the array, and as values the counting of each value.

# UNDERSTAND THE PROBLEM
## INPUT: an array of integers, or empty array or nil
## OUTPUT: a tally hash, or nil
## RULES
### Explicit requirements:
  - return a hash of frequencies that Integers appear in the input array
  - keys are unique values
  - values are number of times that value appears in the array
  - can't use #count or #length methods

### Implicit requirements:
  - empty arrays are permitted and should return nil
  - nil value is permitted and should return nil

# EXAMPLES

Example usage: input = [1,1,2,2,2,3]
group_and_count(input)# == {1=>2, 2=>3, 3=>1} The following methods were disabled:
Array#count
Array#length

p group_and_count([1,1,2,2,2,3]) == {1=>2, 2=>3, 3=>1}
p group_and_count([]) == nil
p group_and_count(nil) == nil
p group_and_count([1, 7, 5, -1]) == {1=>1, 7=>1, 5=>1, -1=>1}

# DATA STRUCTURES
## INPUT: an array of Integers, an empty array or nil
## OUTPUT: nil, or a tally hash
## INTERMEDIATE: none needed

# ALGORITHM
* USE a default parameter of []
* RETURN nil if the input array is empty
* CREATE an empty output hash
* MOVE through the array of integers from the first number to the last
* DETERMINE if the current number is present in the output hash
* ACT upon the determination above
  + IF the number is not present, then add it
  + ELSE increment the value of the key number by 1
* STOP moving through the array after last number
* RETURN tally hash
=end

def group_and_count(array)
  return nil if array == nil
  return nil if array.empty?
  tally_hash = {}
  array.each do |num|
    if tally_hash.include?(num)
      tally_hash[num] += 1
    else
      tally_hash[num] = 1
    end
  end
    tally_hash
end


p group_and_count([1,1,2,2,2,3]) == {1=>2, 2=>3, 3=>1}
p group_and_count([]) == nil
p group_and_count(nil) == nil
p group_and_count([1, 7, 5, -1]) == {1=>1, 7=>1, 5=>1, -1=>1}