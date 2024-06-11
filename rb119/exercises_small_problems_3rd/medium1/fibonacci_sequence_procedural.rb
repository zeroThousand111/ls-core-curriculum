=begin
In the previous exercise, we developed a recursive solution to calculating the nth Fibonacci number. In a language that is not optimized for recursion, some (not all) recursive methods can be extremely slow and require massive quantities of memory and/or stack space.

Ruby does a reasonably good job of handling recursion, but it isn't designed for heavy recursion; as a result, the Fibonacci solution is only useful up to about fibonacci(40). With higher values of nth, the recursive solution is impractical. (Our tail recursive solution did much better, but even that failed at around fibonacci(8200).)

Fortunately, every recursive method can be rewritten as a non-recursive (procedural) method.

Rewrite your recursive fibonacci method so that it computes its results without recursion.

# UNDERSTAND THE PROBLEM

## Input: an integer, n, representing the nth number in the fibonacci sequence
## Output: an integer, the value of that nth number in the sequence
## Rules
### Explicit requirements:
  - a method
  - use a procedural algorithm, not a recursive one
### Implicit requirements:
  - higher values of n might put a strain on the SystemStack, depending upon what choices you make, so account for that in code choices
  - the fibonacci sequence is the addition of the previous two numbers in the sequence, beginning at [0, 1, 1, 2, 3, 5, 8]
  - n will be positive integer above zero
  - according to Wikipedia, when n is zero, that is the 0 in the sequence, in other words, 

# TEST CASES / EXAMPLES

Examples:
fibonacci(20) == 6765
fibonacci(100) == 354224848179261915075
fibonacci(100_001) # => 4202692702.....8285979669707537501

# ALGORITHM

* RETURN 0, if n is 0
* RETURN 1, if n is 1
* RETURN 1, if n is 2
* CREATE two local variables to track the last two numbers in the sequence
  + penultimate = 1
  + last = 1
* REPEAT addition process n - 2 times
* REASSIGN local variables
  + CREATE temp local variable sum
  + sum = penultimate + last
  + reassign penultimate = last
  + reassign last = sum
* STOP iteration
* RETURN value of last local variable (or sum)
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

p fibonacci(0) == 0
p fibonacci(1) == 1
p fibonacci(2) == 1
p fibonacci(3) == 2
p fibonacci(4) == 3
p fibonacci(5) == 5
p fibonacci(6) == 8
p fibonacci(7) == 13

p fibonacci(20)  ==  6765
p fibonacci(100)  == 354224848179261915075