=begin
Create a method that takes an array of integers as an argument. The method should determine the minimum integer value that can be appended to the array so the sum of all the elements equal the closest prime number that is greater than the current sum of the numbers. For example, the numbers in [1, 2, 3] sum to 6. The nearest prime number greater than 6 is 7. Thus, we can add 1 to the array to sum to 7.

Notes:

The array will always contain at least 2 integers.
All values in the array must be positive (> 0).
There may be multiple occurrences of the various numbers in the array.

# UNDERSTAND THE PROBLEM
## INPUT: an array of integers
## OUTPUT: an integer
## RULES
### Explicit requirements:
  - a method;
  - return the integer required to add to the sum of integers to get to the next highest prime number
  - in other words, return the integer that is the difference between the sum of the array and the next highest prime number
  
### Implicit requirements:
  - what is a prime number?  
  - a number that can only be divided by itself and 1
  
Examples

p nearest_prime_sum([1, 2, 3]) == 1        # Nearest prime to 6 is 7
p nearest_prime_sum([5, 2]) == 4           # Nearest prime to 7 is 11
p nearest_prime_sum([1, 1, 1]) == 2        # Nearest prime to 3 is 5
p nearest_prime_sum([2, 12, 8, 4, 6]) == 5 # Nearest prime to 32 is 37

# Nearest prime to 163 is 167
p nearest_prime_sum([50, 39, 49, 6, 17, 2]) == 4
The above tests should each print true.

# DATA STRUCTURES
INPUT: an array of integers
OUPUT: an integer
INTERMEDIATE: none required

# ALGORITHM
## HIGH LEVEL
1. SUM the array of integers
2. Find the first prime number with a value higher than the sum
3. RETURN the difference between that prime and the sum

1. SUM the array of integers
  + use #sum
2. Find the first prime number with a value higher than the sum
  + check the next number above the value of sum
  + find out if current num is a prime number
    + create a helper method
    + a prime number cannot be divided equally into any divisor between 2 and itself - 1
    + IF number is prime, then store that value as prime
    + ELSE move on to the next number i.e. current num += 1
3. RETURN the difference between that prime and the sum
  + prime value - sum = return
=end

def is_prime?(current_num)
  2.upto(current_num - 1) do |divisor|
    return false if current_num % divisor == 0
  end
  true
end

# p is_prime?(2) == true
# p is_prime?(11) == true
# p is_prime?(6) == false
# p is_prime?(12) == false

def nearest_prime_sum(array)
  sum = array.sum
  current_num = sum + 1
  loop do 
    break if is_prime?(current_num)
    current_num += 1
  end
  current_num - sum
end

p nearest_prime_sum([1, 2, 3]) == 1        # Nearest prime to 6 is 7
p nearest_prime_sum([5, 2]) == 4           # Nearest prime to 7 is 11
p nearest_prime_sum([1, 1, 1]) == 2        # Nearest prime to 3 is 5
p nearest_prime_sum([2, 12, 8, 4, 6]) == 5 # Nearest prime to 32 is 37
p nearest_prime_sum([50, 39, 49, 6, 17, 2]) == 4

