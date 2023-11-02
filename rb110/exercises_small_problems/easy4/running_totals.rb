# Write a method that takes an Array of numbers, and returns an Array with the same number of elements, and each element has the running total from the original Array.

#A running total is the sum of all values in a list up to and including the current element. Thus, the running total when looking at index 2 of the array [14, 11, 7, 15, 20] is 32 (14 + 11 + 7), while the running total at index 3 is 47 (14 + 11 + 7 + 15).

=begin
# MY LOGIC
- Need to iterate over the calling object array somehow
- Need to return a transformed array (so probably use Array#map?)
- the reference of elements being summed expands each iteration/index no

=end


# using a for loop and #push onto a new empty array
def running_total(array)
  running_total = 0
  new_array = []
  for e in array
    running_total += e
    new_array.push(running_total)
  end
  new_array
end

# print tests
p running_total([1, 2])
p running_total([2, 5, 13])
p running_total([14, 11, 7, 15, 20])
p running_total([3])
p running_total([])

# truth tests
p running_total([2, 5, 13]) == [2, 7, 20]
p running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total([3]) == [3]
p running_total([]) == []