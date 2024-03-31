=begin

Expected to print:
[]
[21]
[9, 16]
[25, 36, 49]

Actually prints:
[]
nil
nil
nil

The critical flaw is that the elsif expression doesn't have a condition to evaluate.  The solution is to give it a condition that matches the test cases, which is to say that this branch of the if executable entity will execute if the input array has more than 1 element i.e. array.size > 1

This means that the else branch executes if array.size == 1
=end


def my_method(array)
  if array.empty?
    []
  elsif array.size > 1
    array.map do |value|
      value * value
    end
  else
    [7 * array.first]
  end
end

# Print Tests
p my_method([])
p my_method([3])
p my_method([3, 4])
p my_method([5, 6, 7])

# Test Cases

p my_method([]) == []
p my_method([3]) == [21]
p my_method([3, 4]) == [9, 16]
p my_method([5, 6, 7]) == [25, 36, 49]
