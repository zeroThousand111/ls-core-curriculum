=begin
34. Sherlock on pockets
(​https://www.codewars.com/kata/53bb1201392478fefc000746​)
6 kyu
Sherlock has to find suspects on his latest case. He will use your method, dear Watson. Suspect in this case is a person which has something not allowed in his/her pockets.

Allowed items are defined by array of numbers.

Pockets contents are defined by map entries where key is a person and value is one or few things represented by an array of numbers (can be nil or empty array if empty), example:
pockets = { bob: [1], tom: [2, 5], jane: [7] }

Write a method which helps Sherlock to find suspects. If no suspect is found or there are no pockets (pockets == nil), the method should return nil.

# UNDERSTAND THE PROBLEM
## INPUT: a hash, and an array
## OUTPUT: an array or nil
## RULES
### Explicit requirements:
  - pocket content hash has keys as persons (symbols) and value is "things"
  - "things" are represented in the value array as Integers
  - in other words, return an array containing those keys that are NOT associated with values input in the second argument array
### Implicit requirements:
  - I'll assume that the second argument are things "not allowed" in the pockets of potential suspects
  - 

# EXAMPLES
  
pockets = { bob: [1], tom: [2, 5], jane: [7] }
p find_suspects(pockets, [1, 2]) == [:tom, :jane] 
p find_suspects(pockets, [1, 7, 5, 2]) == nil
p find_suspects(pockets, []) == [:bob, :tom, :jane] 
p find_suspects(pockets, [7]) == [:bob, :tom]

# DATA STRUCTURES
INPUT:
  - a hash containing symbol names and an array value, containing Integers
  - an array containing Integers
INTERMEDIATE:
  - maybe not necessary
OUTPUT:
  - an array of symbol names

# ALGORITHM
1. DELETE those values input from second argument from pockets hash
2. COLLECT those keys that still have an argument in an array
3. RETURN an array of those keys, or nil if the array is empty


1. DELETE those values input from second argument from pockets hash
* MOVE through the array of Integers (argument 2)
  + use Array#each
* DELETE 
  + use Hash#delete_if
    - pockets.delete_if do |name, array|
        array.include?(num)
2. COLLECT those keys that still have an argument in an array
* MOVE through the modified hash from first item to the last
* SELECT those keys that don't have empty arrays
3. RETURN an array of those keys, or nil if the array is empty
=end

def remove_items(pockets, items)
  items.each do |item|
    pockets.each do |name, array|
      array.delete_if do |num|
        num == item
      end
    end
  end
  pockets
end

def select_suspects(hash)
  hash.select do |name, array|
    !array.empty?
  end
end

def find_suspects(pockets, items)
  mod_hash = remove_items(pockets, items)
  selected_hash = select_suspects(mod_hash).keys
  return selected_hash unless selected_hash.empty?
  nil
end

pockets = { bob: [1], tom: [2, 5], jane: [7] }

p find_suspects(pockets, [1, 2]) == [:tom, :jane]
pockets = { bob: [1], tom: [2, 5], jane: [7] }
p find_suspects(pockets, [1, 7, 5, 2]) == nil
pockets = { bob: [1], tom: [2, 5], jane: [7] }
p find_suspects(pockets, []) == [:bob, :tom, :jane] 
pockets = { bob: [1], tom: [2, 5], jane: [7] }
p find_suspects(pockets, [7]) == [:bob, :tom]