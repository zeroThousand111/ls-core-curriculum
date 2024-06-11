=begin
Return the number of total permutations of the provided string that don't have repeated consecutive letters. Assume that all characters in the provided string are each unique.

For example, aab should return 2 because it has 6 total permutations (aab, aab, aba, aba, baa, baa), but only 2 of them (aba and aba) don't have the same letter (in this case a) repeating.

# UNDERSTAND THE PROBLEM

## Input: a String of characters
## Output: an Integer
## Rules:
### Explicit requirements:
  - return an integer, representing the number of permutations of the input string that don't have repeating characters
  - assume that characters in the provided string are unique?? But they aren't, because there are repeating characters in the input string!
  - 
### Implicit requirements:
  - assume no whitespace, numbers or non-alphabetic characters in the input string
  - storing a collection of permutations to then examine will cost a lot of memory when input string is longer, so avoid this approach
  - an input string of one character is allowed;
  - a given permutation uses ALL the characters of the input string

# EXAMPLES / TEST CASES

p perm_alone("aab") == 2
p perm_alone("aaa") == 0
p perm_alone("aabb") == 8
p perm_alone("abcdefa") == 3600
p perm_alone("abfdefa") == 2640
p perm_alone("zzzzzzzz") == 0
p perm_alone("a") == 1
p perm_alone("aaab") == 0
p perm_alone("aaabb") == 12

# DATA STRUCTURES

Strings
An array of characters for the input string

# ALGORITHM
* TRANSFORM input string into an array of characters
  + #split(//)
* FIND all of the possible permutations of the input string
  + not necessarily store them in a collection, can find and judge at the same time, then just increment a counter
  + could use Array#permutation
  + 
* JUDGE if each permutation has any repeating characters
  + use a helper method
    - is_string_without_repeating_characters?(array)
  + iterate through the array of characters, tracking the index of each char, but stop at index - 2
    - 0.upto(array.size - 2) do |index|
  + compare current char with char of index + 1
    - array[index] == array[index + 1]
  + IF char == array[index + 1], then return false (its a repeating character)
* COUNT the number of permutations that don't have repeating characters
  + create a local variable to count and increment it when I find a permutation with no repeating strings
* RETURN the sum
=end

def is_string_without_repeating_characters?(array)
  0.upto(array.size - 2) do |index|
    # p [array[index], array[index + 1]]
    return false if array[index] == array[index + 1]
  end
  true
end

def perm_alone(input_string)
  count = 0
  input_string.split(//).permutation(input_string.size) do |perm|
    # p perm
    count += 1 if is_string_without_repeating_characters?(perm)
  end
  count
end

p perm_alone("aab") == 2
p perm_alone("aaa") == 0
p perm_alone("aabb") == 8
p perm_alone("abcdefa") == 3600
p perm_alone("abfdefa") == 2640
p perm_alone("zzzzzzzz") == 0
p perm_alone("a") == 1
p perm_alone("aaab") == 0
p perm_alone("aaabb") == 12