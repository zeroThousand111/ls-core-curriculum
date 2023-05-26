# method
def high_and_low(numbers)
  array = numbers.split(" ")
  integer_array = array.map { |e| e.to_i }
  sorted_array = integer_array.sort
  final_array = sorted_array.map { |e| e.to_s }
  final_array[-1] + " " + final_array[0]
end

# print output
p high_and_low("1 2 3")
p high_and_low("8 3 -5 42 -1 0 0 -9 4 7 4 -4")

# test cases
p high_and_low("1 2 3") == "3 1"
p high_and_low("8 3 -5 42 -1 0 0 -9 4 7 4 -4") == "42 -9"
