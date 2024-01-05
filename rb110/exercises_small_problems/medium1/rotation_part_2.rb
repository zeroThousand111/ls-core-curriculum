=begin
______________________________________________________________________________
*****Understand the PROBLEM*****
______________________________________________________________________________
THE PROBLEM:

Write a method that can rotate the last n digits of a number. For example:

Note that rotating just 1 digit results in the original number being returned.

You may use the rotate_array method from the previous exercise if you want. (Recommended!)

You may assume that n is always a positive integer.

INPUT: Two arguments: each an Integer 

OUTPUT: An Integer

RULES
EXPLICIT REQUIREMENTS:
  - The first argument is the object to be manipulated;
  - The second argument is how many of the last digits should be rotated;
  - e.g. (12345, 3) == 12453
  - 
  
IMPLICIT REQUIREMENTS:
  - One rotation appears to be the same as deleting the -n digit and placing it at the end of the digit as the last number;
  -
  -

______________________________________________________________________________
*****EXAMPLES/TEST CASES*****
______________________________________________________________________________

rotate_rightmost_digits(735291, 1) == 735291
rotate_rightmost_digits(735291, 2) == 735219
rotate_rightmost_digits(735291, 3) == 735912
rotate_rightmost_digits(735291, 4) == 732915
rotate_rightmost_digits(735291, 5) == 752913
rotate_rightmost_digits(735291, 6) == 352917

______________________________________________________________________________
*****DATA STRUCTURES*****
______________________________________________________________________________

Arrays and Integers
______________________________________________________________________________
*****ALGORITHM*****
______________________________________________________________________________

Strategy A: delete digit -n and insert at end of number

1. Turn digit into an array of numbers;
2. Delete digit -n and capture it as a local variable;
3. Push captured digit to end of array of numbers;
4. Join array of numbers back to a digit and return.

Strategy B: create two sub-arrays and rotate last sub-array with rotate_array method from part 1

1. Turn digit into an array of numbers;
2. Create sub-array `rotated_array` comprised of last n digits;
3. Create sub-array `unrotated_array` of elements to the left of the last n digits;
4. Send `rotated_array` to rotate_array method to change order of elements;
5. Create new_array using unrotated_array + rotated_array;
6. Join new_array back to a digit and return. 
______________________________________________________________________________

Now CODE with intent!
=end

# solution 1 - Strategy A: delete digit -n and insert at end of number

# def rotate_rightmost_digits(num, n)
#   # Turn digit into an array of numbers
#   array = num.digits.reverse
#   # Delete digit -n and capture it as a local variable
#   captured_num = array.delete(array[-n])
#   # Push captured digit to end of array of numbers
#   array.push(captured_num)
#   # Join array of numbers back to a digit and return
#   array.join.to_i
# end

# -------------------

# solution 2 - strategy B: create two sub-arrays and rotate last sub-array with rotate_array method from part 1

# # From Part 1:
# def rotate_array(array)
#   array[1..-1] + [array[0]]
# end

# # New method for Part 2:
# def rotate_rightmost_digits(num, n)
#   # Turn digit into an array of numbers
#   array = num.digits.reverse
#   # Create sub-array `rotated_array` comprised of last n digits;
#   rotated_array = rotate_array(array[-n..-1]) # n.b. exclusive range
  
#   # Create sub-array unrotated_array of elements to the left of 
#   unrotated_array = array[0...(-n)] # n.b. inclusive range
  
#   # Create new array using unrotated_array + rotated_array;
#   new_array = unrotated_array.concat(rotated_array)

#   # Join array of numbers back to a digit and return
#   new_array.join.to_i
# end

# -------------------

# solution 3 - refactor of strategy B in solution 2 above

def rotate_array(array)
  array[1..-1] + [array[0]]
end

def rotate_rightmost_digits(num, n)
  array = num.digits.reverse
  
  rotated_array, unrotated_array  = rotate_array(array[-n..-1]), array[0...(-n)]

  new_array = unrotated_array.concat(rotated_array)


  new_array.join.to_i
end


# Print Tests
# p rotate_rightmost_digits(735291, 2) # 735219

# Test Cases
p rotate_rightmost_digits(735291, 1) == 735291
p rotate_rightmost_digits(735291, 2) == 735219
p rotate_rightmost_digits(735291, 3) == 735912
p rotate_rightmost_digits(735291, 4) == 732915
p rotate_rightmost_digits(735291, 5) == 752913
p rotate_rightmost_digits(735291, 6) == 352917


