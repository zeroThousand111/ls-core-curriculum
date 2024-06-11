=begin
In the previous exercise, we developed a procedural method for computing the value of the nth Fibonacci numbers. This method was really fast, computing the 20899 digit 100,001st Fibonacci sequence almost instantly.

In this exercise, you are going to compute a method that returns the last digit of the nth Fibonacci number.

# UNDERSTAND THE PROBLEM
## Input: an Integer, n, representing the last digit of the nth Fibonacci number 
## Output: an Integer that is the last digit of the nth Fibonacci number
## Rules
### Explicit requirements
  - a method;
  - return is the last digit of the nth Fibonacci number
### Implicit requirements
  - input will be an integer, possibly a very high number
  - method must be able to generate very large numbers, without causing a SystemStackError
  - I could use my previous method to generate the nth Fibonacci number!
  -
  
# EXAMPLES / TEST CASES

fibonacci_last(15)        # -> 0  (the 15th Fibonacci number is 610)
fibonacci_last(20)        # -> 5 (the 20th Fibonacci number is 6765)
fibonacci_last(100)       # -> 5 (the 100th Fibonacci number is 354224848179261915075)
fibonacci_last(100_001)   # -> 1 (this is a 20899 digit number)
fibonacci_last(1_000_007) # -> 3 (this is a 208989 digit number)
fibonacci_last(123456789) # -> 4

# DATA STRUCTURE
A numeric string?
An array of digits?

# ALGORITHM

* Calculate nth Fibonacci number using my previous method
* TRANSFORM the Integer to a numeric String
  + use Integer_to.s
* SLICE the last character of the numeric string and assign it to a local variable
    - last_digit = numeric_string[-1]
* TRANSFORM last digit from a string character to an Integer
    - last_digit.to_i
* RETURN last digit


=end
def fibonacci(n)
  if n <= 2
    case n
    when 2 then return 1
    when 1 then return 1
    when 0 then return 0
    end
  else
    penultimate = 1
    last = 1
    sum = 0
    (n - 2).times do
      sum = penultimate + last
      penultimate = last
      last = sum
    end
    return last
  end
end

def fibonacci_last(n)
  number = fibonacci(n)
  numeric_string = number.to_s
  last_digit = numeric_string[-1]
  return last_digit.to_i
end

# refactored to be smart ass
def fibonacci_last(n)
  fibonacci(n).to_s.slice(-1).to_i
end

p fibonacci_last(15)        # -> 0  (the 15th Fibonacci number is 610)
p fibonacci_last(20)        # -> 5 (the 20th Fibonacci number is 6765)
p fibonacci_last(100)       # -> 5 (the 100th Fibonacci number is 354224848179261915075)
p fibonacci_last(100_001)   # -> 1 (this is a 20899 digit number)
# p fibonacci_last(1_000_007) # -> 3 (this is a 208989 digit number)
# p fibonacci_last(123456789) # -> 4

# truth tests
p fibonacci_last(15) == 0
p fibonacci_last(20) == 5
p fibonacci_last(100) == 5
