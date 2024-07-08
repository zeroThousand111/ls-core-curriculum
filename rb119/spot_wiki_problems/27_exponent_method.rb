=begin
27. Exponent method
(​https://www.codewars.com/kata/5251f63bdc71af49250002d8​)
5 kyu
Create a method called "power" that takes two integers and returns the value of the first argument raised to the power of the second. Return nil if the second argument is negative.
Note: The ** operator has been disabled. 

# PROBLEM
## INPUT: two Integers
## OUTPUT: a single Integer, the first argument raised to the power of the second, or nil
## RULES
### Explicit requirements:
  - a method called power;
  - can't use the ** operator 
  - return nil if the second argument is negative

### Implicit requirements:
  - either or both arguments can be negative
  - 
  

## EXAMPLES:
p power(2, 3) == 8
p power(10, 0) == 1
p power(-5, 3) == -125 
p power(-4, 2) == 16
p power(10, 0) == 1
p power(2, 3) == 8
p power(3, 2) == 9
p power(-5, 3) == -125 
p power(-4, 2) == 16
p power(8, -2) == nil

# DATA STRUCTURES
Not sure if any are required for intermediate steps

# ALGORITHM

* DETERMINE if the second argument is negative
* ACT on above determination and return `nil` if second argument is negative
  + i.e. if int2 < 0
* DETERMINE if the second argument is more than 1
* ACT on above determination
  + if Yes, then multiply by int2 - 1 times
  + if no, i.e. int2 == 1, then return int1
* DETERMINE if second argument is 0
  + if Yes, return 1
* MULTIPLY the first int1 by itself the number of times of second int2
  + use #times method
  + normally you would use int1 ** int2, but ** not allowed
    - int2.times { int1 = int1 * int1 }
* RETURN int1 after reassignment and calculation above
=end

def power(int1, int2)
  constant = int1
  case
  when int2 == 0 then return 1
  when int2 == 1 then return int1
  when int2 < 0
    return nil
  when int2 > 1
    (int2 - 1).times do |_|
      int1 = int1 * constant
    end
  end
  int1
end

p power(2, 3) == 8
p power(-4, 2) == 16
p power(10, 0) == 1
p power(3, 2) == 9
p power(-5, 3) == -125 
p power(8, -2) == nil