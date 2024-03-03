=begin
______________________________________________________________________________
*****Understand the PROBLEM*****
______________________________________________________________________________
THE PROBLEM:
Write a method that counts the number of occurrences of each element in a given array.

The words in the array are case-sensitive: 'suv' != 'SUV'. Once counted, print each element alongside the number of occurrences.

FURTHER EXPLORATION

Try to solve the problem when words are case insensitive, e.g. "suv" == "SUV".

INPUT: An Array of strings

OUTPUT: Multiple string output

RULES
EXPLICIT REQUIREMENTS:
  - words are case sensitive
  -
  -
  
IMPLICIT REQUIREMENTS:
  -
  -
  -

______________________________________________________________________________
*****EXAMPLES/TEST CASES*****
______________________________________________________________________________



______________________________________________________________________________
*****DATA STRUCTURES*****
______________________________________________________________________________

Hashes
______________________________________________________________________________
*****ALGORITHM*****
______________________________________________________________________________
1. Requirement — The important, generalized steps required to navigate from the input to the desired output.
  a. Approach — The process that will be utilized to accomplish each Requirement.
    i. Procedure — Specific details to implement the Approach.


1.Create an empty Hash
  a.
    i.count_hash
2.MOVE through the argument array
  a.Simple Loop
  b.#each
  c.FOR loop
    i.
3.CHECK if value at index is already a string key in the hash
  a.
    i. count_hash.include?(array[index])
4.IF key already present, then increment count value by 1
  a.
    i. count_hash["key"] += 1 
    ii. count_hash[array[index]] += 1
5.IF no key present, CREATE new key-value pair 
  a.key is a string of value in array at that index
  b.value is 1
    i.count_hash[array[index]] = 1
4.SORT completed hash
  a.
    i.
5.OUTPUT
  a.
    i.
______________________________________________________________________________

Now CODE with intent!
=end

require 'pry'
require 'pry-byebug'

vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck', 'suv'
]

# solution 1 - using a simple loop 

def count_occurrences(array)
  count_hash = {}
  
  index = 0
  loop do
    if count_hash.include?(array[index])
      count_hash[array[index]] += 1
    else
      count_hash[array[index]] = 1
    end
    
    index += 1
    break if index == array.size
  end

  count_hash.each do |k,v|
    puts "#{k} => #{v}"
  end
end

# -------------------

# solution 2 - using a FOR loop

# def count_occurrences(array)
#   count_hash = {}
  
#   for element in array do
#     if count_hash.include?(element)
#       count_hash[element] += 1
#     else
#       count_hash[element] = 1
#     end
#   end

#   count_hash.each do |k,v|
#     puts "#{k} => #{v}"
#   end
# end


# p 

# -------------------

# solution 3 - using #each and sorting the hash just for the hell of it

# def count_occurrences(array)
#   count_hash = {}
  
#   array.each do |element|
#     if count_hash.include?(element)
#       count_hash[element] += 1
#     else
#       count_hash[element] = 1
#     end
#   end
  
#   sorted_hash = count_hash.sort_by { |k,v| v }.to_h

#   sorted_hash.each do |k,v|
#     puts "#{k} => #{v}"
#   end
# end

# -------------------

# solution 4 - FURTHER EXPLORATION

def count_occurrences(array)
  count_hash = {}
  
  array.each do |element|
    if count_hash.include?(element.downcase)
      count_hash[element.downcase] += 1
    else
      count_hash[element.downcase] = 1
    end
  end
  
  sorted_hash = count_hash.sort_by { |k,v| v }.to_h

  sorted_hash.each do |k,v|
    puts "#{k} => #{v}"
  end
end

# -------------------

# solution 5 - 

# -------------------

# Print Tests
count_occurrences(vehicles)
=begin
car => 4
truck => 3
SUV => 1
motorcycle => 2
=end

# Test Cases