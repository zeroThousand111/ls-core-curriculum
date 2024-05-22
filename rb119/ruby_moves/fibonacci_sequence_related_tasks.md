## Fibonacci Sequence Related Tasks

### Create An Array of N numbers of the Fibonacci Sequence

**The task:**  Create an array containing `n` numbers in the Fibonacci sequence, starting at zero for the first number in the sequence (where `n = 1`).

**Expected output:**
```
# => 
p create_fibonacci_sequence(0)  # => []
p create_fibonacci_sequence(1)  # => [0]
p create_fibonacci_sequence(2)  # => [0, 1]
p create_fibonacci_sequence(3)  # => [0, 1, 1]
p create_fibonacci_sequence(4)  # => [0, 1, 1, 2]
p create_fibonacci_sequence(10) # => [0, 1, 1, 2, 3, 5, 8, 13, 21, 34]
```

```ruby
def create_fibonacci_sequence(n)
  case n
  when 0
    sequence_array = []
  when 1
    sequence_array = [0]
  when 2
    sequence_array = [0, 1]
  when 3
    sequence_array = [0, 1, 1]
  end
  
  if n > 3
    sequence_array = [0, 1, 1]
      (n - 3).times do |_|
      sequence_array << sequence_array[-2] + sequence_array[-1]
    end
  end
  sequence_array
end

p create_fibonacci_sequence(0)
p create_fibonacci_sequence(1)
p create_fibonacci_sequence(2)
p create_fibonacci_sequence(3)
p create_fibonacci_sequence(4)
p create_fibonacci_sequence(10)
```

### Check If An Integer Is Within The Fibonacci Sequence

**Task:**  Check if any given integer is also in the Fibonacci sequence and return `true` if it is, `false` otherwise.

**Expected output:**
```
p is_in_the_fibonacci_sequence?(0) == true
p is_in_the_fibonacci_sequence?(1) == true
p is_in_the_fibonacci_sequence?(2) == true
p is_in_the_fibonacci_sequence?(3) == true
p is_in_the_fibonacci_sequence?(4) == false
p is_in_the_fibonacci_sequence?(5) == true
p is_in_the_fibonacci_sequence?(10) == false
p is_in_the_fibonacci_sequence?(22) == false
```

The main method of the solution below creates an array of the fibonacci series, using the method in the section above, that is two numbers higher in the series and then checks to see if `n`  is in that array.  If the Integer being evaluated is small, then this creates an array that is just big enough to give an answer.  If the Integer is large, then it creates a *very* large array of numbers in the sequence; way more than is necessary.  So this is not a very refined solution and with very large numbers may cause memory problems and raise `SystemStackError` exceptions.

```ruby
# helper method to create an array of the fibonacci sequence
def create_fibonacci_sequence(n)
  case n
  when 0
    sequence_array = []
  when 1
    sequence_array = [0]
  when 2
    sequence_array = [0, 1]
  when 3
    sequence_array = [0, 1, 1]
  end
  
  if n > 3
    sequence_array = [0, 1, 1]
      (n - 3).times do |_|
      sequence_array << sequence_array[-2] + sequence_array[-1]
    end
  end
  sequence_array
end

# main method to determine if n is within the array created by the helper method
def is_in_the_fibonacci_sequence?(n)
  sequence_array = create_fibonacci_sequence(n + 2)
  sequence_array.include?(n)
end
```

### Check If An Array of Integers Follows The Fibonacci Sequence

**Task:**  Check if an array of integers follows the Fibonacci sequence and return `true` if it does, `false` otherwise.

**Expected output:**
```
p is_fibonacci?([0, 1, 1]) == true
p is_fibonacci?([1, 1, 2, 3]) == true
p is_fibonacci?([3, 5, 8, 13]) == true
p is_fibonacci?([7, 99, 8, 29]) == false
```

Courtesy of Drew Dowdy:

```ruby
def is_fibonacci?(array)
  (2..-1).each do |idx|
    return false unless array[idx - 2] + array[idx - 1] == array[idx]
  end
  true
end

p is_fibonacci?([0, 1, 1]) == true
p is_fibonacci?([1, 1, 2, 3]) == true
p is_fibonacci?([3, 5, 8, 13]) == true
p is_fibonacci?([7, 99, 8, 29]) == false
```