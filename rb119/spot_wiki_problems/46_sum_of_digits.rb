=begin
46. Sum of Digits / Digital Root
(​https://www.codewars.com/kata/541c8630095125aba6000c00/train/ruby​) 6 kyu
In this kata, you must create a digital root function.
A digital root is the recursive sum of all the digits in a number. Given n, take the sum of the digits of n. If that value has more than one digit, continue reducing in this way until a single-digit number is produced. This is only applicable to the natural numbers.


# UNDERSTAND THE PROBLEM
## INPUT: an integer
## OUTPUT: an integer
## RULES
### Explicit requirements:
  - return the "digital root" of the input integer
  - the digital root is the sum of the digits, down to 1 digit
  - if the digital root is a 2 digit number or more, then keep condensing down until you get to a 1 digit Integer
  
### Implicit requirements:
  - 

# EXAMPLES

Here's how it works:
digital_root(16) => 1 + 6
=> 7
digital_root(942) => 9 + 4 + 2
=> 15 ...
=> 1 + 5
=> 6
digital_root(132189)
=> 1 + 3 + 2 + 1 + 8 + 9 => 24 ...
=> 2 + 4
=> 6
digital_root(493193)
=> 4 + 9 + 3 + 1 + 9 + 3
=> 29 ...
=> 2 + 9
=> 11 ...
=> 1 + 1
=> 2

# DATA STRUCTURES
Input: an integer
Output: an integer
Intermediate: an array of digits?

# ALGORITHM
* SPLIT the input integer into an array digits
  + use #digits.reverse method chain
* SUM the digits
  + use #sum
* EVALUATE the sum; how many digits does it have?
  + use #digits.size chain
* ACT on above EVALUATION
  - IF the sum only has 1 digit, then return
  - ELSE repeat the steps above

=end

def digital_root(input_num)
  num = input_num
  loop do 
    array_of_digits = num.digits.reverse
    num = array_of_digits.sum
    break if num.digits.size == 1
  end
  num
end

p digital_root(16) == 7
p digital_root(942) == 6
p digital_root(132189) == 6
p digital_root(493193) == 2