=begin
______________________________________________________________________________
*****Understand the PROBLEM*****
______________________________________________________________________________
THE PROBLEM:
Write a method that counts the number of occurrences of each element in a given array.

The words in the array are case-sensitive: 'suv' != 'SUV'. Once counted, print each element alongside the number of occurrences.



INPUT: an Array of strings

OUTPUT: a hash of string keys and number values

RULES
EXPLICIT REQUIREMENTS:
  - A method;
  - Count the number of occurrences of each element in the input array;
  - The words in the array are case-sensitive: 'suv' != 'SUV';
  - Once counted, print each element alongside the number of occurrences.
  -
  
IMPLICIT REQUIREMENTS:
  - Output are the keys and values of a Hash;
  - Keys will be strings (not symbols);
  -

______________________________________________________________________________
*****EXAMPLES/TEST CASES*****
______________________________________________________________________________

vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

count_occurrences(vehicles)

Expected output:

car => 4
truck => 3
SUV => 1
motorcycle => 2
______________________________________________________________________________
*****DATA STRUCTURES*****
______________________________________________________________________________

Input - an Array of strings
Output - a hash of string keys and number values
______________________________________________________________________________
*****ALGORITHM*****
______________________________________________________________________________

1.Create empty hash?
2.Take first item of input array:
  a.Turn name of element into a hash key and assign it a count value of 1;
  b.If name of element already exists as a hash key, increment the value of that existing hash key by 1;
3.Repeat step 2 for all elements of input array, until all counted
4.Output hash
5.
______________________________________________________________________________

Now CODE with intent!
=end

# solution 1 - a simple loop counting strings in array and building a hash

# def count_occurrences(array)
#   hash = {}
  
#   counter = 0
#   loop do
#     if hash.has_key?(array[counter])
#       hash[array[counter]] += 1
#     else 
#       hash[array[counter]] = 1
#     end
    
#     counter += 1
#     break if counter == array.size
#   end
  
#   hash.each { |key, value| puts "#{key} => #{value}"}
# end

# solution 2 - using #each to do the same as solution 1

# def count_occurrences(array)
#   hash = {}
  
#   array.each do |word|
#     if hash.has_key?(word)
#       hash[word] += 1
#     else 
#       hash[word] = 1
#     end
#   end
  
#   hash.each { |key, value| puts "#{key} => #{value}"}
# end

# solution 3 - official LS solution

def count_occurrences(array)
  occurrences = {}

  array.uniq.each do |element|
    occurrences[element] = array.count(element)
  end

  occurrences.each do |element, count|
    puts "#{element} => #{count}"
  end
end

# Print Tests

# Test Cases

vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

count_occurrences(vehicles)

=begin
Expected output:

car => 4
truck => 3
SUV => 1
motorcycle => 2
=end