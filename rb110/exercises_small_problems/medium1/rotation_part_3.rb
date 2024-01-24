=begin
______________________________________________________________________________
*****Understand the PROBLEM*****
______________________________________________________________________________
THE PROBLEM:

If you take a number like 735291, and rotate it to the left, you get 352917. If you now keep the first digit fixed in place, and rotate the remaining digits, you get 329175. Keep the first 2 digits fixed in place and rotate again to 321759. Keep the first 3 digits fixed in place and rotate again to get 321597. Finally, keep the first 4 digits fixed in place and rotate the final 2 digits to get 321579. The resulting number is called the maximum rotation of the original number.

Write a method that takes an integer as argument, and returns the maximum rotation of that argument. You can (and probably should) use the rotate_rightmost_digits method from the previous exercise.

Note that you do not have to handle multiple 0s.

INPUT: An Integer

OUTPUT: An Integer

RULES
EXPLICIT REQUIREMENTS:
  - 
  -
  -
  
IMPLICIT REQUIREMENTS:
  -
  -
  -

THE STEPS OF MAXIMUM ROTATION
Using the integer in the problem description

Original Integer: 735291
1st Rotation:     352917
2nd Rotation:     329175 - freeze first digit
3rd rotation:     321759 - freeze two digits
4th rotation:     321597 - freeze three digits
5th rotation:     321579 - freeze four digits
6th rotation:     321579 - (the 9 rotates about itself)

Using the integer 12345
Original Integer: 12345
1st Rotation:     23451
2nd Rotation:     24513 - freeze first digit
3rd rotation:     24135 - freeze two digits
4th rotation:     24153 - freeze three digits
5th rotation:     24153 (the 3 rotates about itself)


______________________________________________________________________________
*****EXAMPLES/TEST CASES*****
______________________________________________________________________________

max_rotation(735291) == 321579
max_rotation(3) == 3
max_rotation(35) == 53
max_rotation(105) == 15 # the leading zero gets dropped
max_rotation(8_703_529_146) == 7_321_609_845

______________________________________________________________________________
*****DATA STRUCTURES*****
______________________________________________________________________________

Arrays
______________________________________________________________________________
*****ALGORITHM*****
______________________________________________________________________________

1.Rotate Integer with all digits and reassign `number` to the return value
2.Rotate `number` again with all digits - 1
3.Rotate `number` again with all digits - 2
4.etc until all the digits have been rotated
5.The above can be acheived with the two methods created in part 1 and part 2
______________________________________________________________________________



Now CODE with intent!
=end

def rotate_array(array)
  array[1..-1] + [array[0]]
end

def rotate_rightmost_digits(number, n)
  all_digits = number.to_s.chars
  all_digits[-n..-1] = rotate_array(all_digits[-n..-1])
  all_digits.join.to_i
end


# solution 1 - using a simple loop and previous helper methods

# def max_rotation(number)
#   counter = number.to_s.size
#   loop do
#     number = rotate_rightmost_digits(number, counter)
#     counter -= 1
#     break if counter == 0
#   end
#   number
# end

# -------------------

# solution 2 - using #each

def max_rotation(number)
  all_digits = number.to_s.chars
  all_digits.each do |digit|
    all_digits << all_digits.delete(digit)
  end
  all_digits.join.to_i
end

# -------------------

# solution 3 - official LS solution

# def max_rotation(number)
#   number_digits = number.to_s.size
#   number_digits.downto(2) do |n|
#     number = rotate_rightmost_digits(number, n)
#   end
#   number
# end

# Print Tests
# p rotate_rightmost_digits(12345, 5)
# p max_rotation(735291) # 321579
p max_rotation(110011) #100111, 101110, 100111, 100111

# Test Cases
# p max_rotation(735291) == 321579
# p max_rotation(3) == 3
# p max_rotation(35) == 53
# p max_rotation(105) == 15 # the leading zero gets dropped
# p max_rotation(8_703_529_146) == 7_321_609_845