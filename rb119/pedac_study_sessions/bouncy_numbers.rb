# BOUNCY NUMBERS
=begin
Some numbers have only ascending digits, like 123, 3445, 2489, etc.
Some numbers have only descending digits, like 321, 5443, 9842, etc.
A number is "bouncy" if it has both ascending and descending digits, like 313, 92543, etc.
Write a method that takes a list of numbers and counts how many of them are bouncy.

# PROBLEM
## INPUT: an array of integers
## OUTPUT: an integer, representing the number of "bouncy" numbers
## RULES
### Explicit requirements:
  - a method:
  - an array of integers is input;
  - returns a COUNT of the number of "bouncy numbers"
  - a number is considered "bouncy" if the digits have ascending and descending numbers
### Implicit requirements:
  - a bouncy number may have sequences that:
    - ascend then descend
    - descend then ascened
    - or both

# EXAMPLES / TEST CASES
p bouncyCount([]) == 0; # no input, so count is zero
p bouncyCount([11, 0, 345, 21]) == 0; # none are "bouncy"
p bouncyCount([121, 4114]) == 2; # both are bouncy in different ways
p bouncyCount([176, 442, 80701644]) == 2;

# DATA STRUCTURES
An array of integers
I will need to create arrays of digits for each number in the input array

# ALGORITHM

* CREATE a local variable to count the number of bouncy numbers
  - count = 0
* MOVE through the input array of integers from the first to the last
  + use #each 
    - input_array.each do |num| 

--- helper method
* SPLIT current number into an array of digits
  + use #digits and then #reverse in a chain
    - digits = num.digits.reverse
* CREATE two variables to track ascending and descending and initialise them as false
   - ascending = false
   - descending = false
* MOVE through digit array from second digit to the last
  + use an #upto iterator to track the index of the digit in the array
* COMPARE value of current digit and previous digit
* ACT on comparison
  + IF current digit > previous digit, reassign `ascending` to `true`
  + IF current digit < previous digit, reassign `descending` to `true`
* STOP moving through the array of digits
* IF both ascending and descending are assigned to `true`, return true, else return false
--- 

* TEST if current number is bouncy using helper method
* IF current number is bouncy, then increment count variable by 1
    - count += 1 if is_bouncy?(num)

* RETURN the value of count
=end

def is_bouncy?(num)
  array_of_digits = num.digits.reverse
  ascending = false
  descending = false
  1.upto(array_of_digits.size - 1) do |index|
    if array_of_digits[index] > array_of_digits[index - 1]
      ascending = true
    elsif array_of_digits[index] < array_of_digits[index - 1]
      descending = true
    end
  end
  return true if ascending == true && descending == true
  false
end

# p is_bouncy?(11) == false
# p is_bouncy?(123) == false
# p is_bouncy?(321) == false
# p is_bouncy?(121) == true

def bouncyCount(array_of_numbers)
  count = 0
  array_of_numbers.each do |num|
    count += 1 if is_bouncy?(num)
  end
  count
end

# EXAMPLES / TEST CASES
p bouncyCount([]) == 0;
p bouncyCount([11, 0, 345, 21]) == 0;
p bouncyCount([121, 4114]) == 2;
p bouncyCount([176, 442, 80701644]) == 2;