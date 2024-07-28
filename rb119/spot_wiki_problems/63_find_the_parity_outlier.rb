=begin
63. Find The Parity Outlier
(​https://www.codewars.com/kata/5526fc09a1bbd946250002dc)

6 kyu
You are given an array (which will have a length of at least 3, but could be very large) containing integers. The array is either entirely comprised of odd integers or entirely comprised of even integers except for a single integer N. Write a method that takes the array as an argument and returns this "outlier" N.

# UNDERSTAND THE PROBLEM
## INPUT: an array of integers of at least 3 elements
## OUTPUT: an integer, the outlier
## RULES
### EXPLICIT REQUIREMENTS
  - find the outlier integer and return it
  - length of array will be minimum 3 elements
  - only one integer will be an outlier
### IMPLICIT REQUIREMENTS
  - integers can be positive or negative
  
# EXAMPLES
Examples
[2, 4, 0, 100, 4, 11, 2602, 36]
Should return: 11 (the only odd number)
[160, 3, 1719, 19, 11, 13, -21]
Should return: 160 (the only even number)

# DATA STRUCTURES
## INPUT: an array of integers
## OUTPUT: an integer
## INTERMEDIATE: not necessary

# ALGORITHM
## HIGH-LEVEL
1. Determine if the array is filled with mostly odd or even integers
2. Hunt for the outlier based on knowing that the array is full of mostly odd or even integers

## DETAIL
1. Determine if the array is filled with mostly odd or even integers
* MOVE through the input array from the first element until the below condition is fulfilled
* CREATE a local variable to track even and odd elements
    - even_count, odd_count
* TEST each element if they are even or not
  + if they are even, increment even_count, else increment odd_count
* RETURN "even" when even_count is 2, return "odd" when odd_count is 2

2. Hunt for the outlier based on knowing that the array is full of mostly odd or even integers
* CHOOSE which helper method to use, based on determination of which kind of array has been input
  + use an if statement
* INVOKE correct helper method
* 

=end



def find_the_odd_element(input_array)
  input_array.each do |element|
    return element if element.odd?
  end
end

def find_the_even_element(input_array)
  input_array.each do |element|
    return element if element.even?
  end
end

def which_type(input_array)
  even_count = 0
  odd_count = 0
  
  input_array.each do |element|
    if element.even?
      even_count += 1
    else
      odd_count += 1
    end
    
    if even_count == 2
      return "even"
    end
    if odd_count == 2
      return "odd"
    end
  end
end

def find_parity_outlier(input_array)
  if which_type(input_array) == "even"
    outlier = find_the_odd_element(input_array)
  else
    outlier = find_the_even_element(input_array)
  end
  outlier
end

p find_parity_outlier([2, 4, 0, 100, 4, 11, 2602, 36]) == 11
p find_parity_outlier([160, 3, 1719, 19, 11, 13, -21]) == 160
