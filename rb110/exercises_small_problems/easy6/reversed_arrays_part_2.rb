=begin
PEDAC

THE PROBLEM
Write a method that takes an Array, and returns a new Array with the elements of the original list in reverse order. Do not modify the original list.

You may not use Array#reverse or Array#reverse!, nor may you use the method you wrote in the previous exercise

INPUT:
OUTPUT:
THE RULES:
EXPLICIT REQUIREMENTS:
- The method must return a new array and not mutate the input;
- The method must not be the same as part 1.
IMPLICIT REQUIREMENTS:
- New array will have a different object_ID to the original array;
- 


TEST CASES
reverse([1,2,3,4]) == [4,3,2,1]          # => true
reverse(%w(a b e d c)) == %w(c d e b a)  # => true
reverse(['abc']) == ['abc']              # => true
reverse([]) == []                        # => true

list = [1, 3, 2]                      # => [1, 3, 2]
new_list = reverse(list)              # => [2, 3, 1]
list.object_id != new_list.object_id  # => true
list == [1, 3, 2]                     # => true
new_list == [2, 3, 1]                 # => true
=end

# solution 1 - A Basic Loop

def reverse(original_array)
  return original_array if original_array.empty?
  
  new_array = []
  index = original_array.length - 1

  loop do
    new_array.push(original_array[index])
    break if index == 0
    index -= 1
  end
  new_array
end

# solution 2 - LS Official version using #reverse_each

# def reverse(array)
#   result_array = []
#   array.reverse_each { |element| result_array << element }
#   result_array
# end



# print tests
# p reverse([1,2,3,4]) 

# test cases

p reverse([1,2,3,4]) == [4,3,2,1]          # => true
p reverse(%w(a b e d c)) == %w(c d e b a)  # => true
p reverse(['abc']) == ['abc']              # => true
p reverse([]) == []                        # => true

list = [1, 3, 2]                      # => [1, 3, 2]
new_list = reverse(list)              # => [2, 3, 1]
p list.object_id != new_list.object_id  # => true
p list == [1, 3, 2]                     # => true
p new_list == [2, 3, 1]                 # => true