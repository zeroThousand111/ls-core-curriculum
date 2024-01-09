require 'pry'
require 'pry-byebug'

def valid_series?(nums)
  # binding.pry
  return false if nums.sum != 47
  
  odd_count = nums.count { |n| n.odd? }
  
  odd_count == 3 
end

p valid_series?([5, 6, 2, 7, 3, 12, 4, 8]) == true  # should return true  | passes both tests sum == 47
p valid_series?([1, 12, 2, 5, 16, 6]) == false      # should return false | fails because sum == 42
p valid_series?([28, 3, 4, 7, 9, 14]) == false      # should return false | fails because sum == 65
p valid_series?([20, 6, 9, 4, 2, 1, 2, 3]) == true  # should return true | passes both tests sum == 47
p valid_series?([10, 6, 19, 2, 6, 4]) == false      # should return false | passes sum == 47 AND THEN PASSES 3 ODD NUMBERS WHEN IT HAS ONLY 1!

# p valid_series?([10, 6, 19, 2, 6, 4])