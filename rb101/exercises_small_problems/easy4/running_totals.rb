# def running_total(array)
#   new_array = []
#   until array.size == 0
#     new_array << array.sum
#     array.pop
#   end
#   new_array.reverse
# end

# official solution
# def running_total(array)
#   sum = 0
#   array.map { |value| sum += value }
# end

# Further Exploration - use Enumerable#each_with_object

def running_total(array)
 
end


# my tests
p running_total([1, 2, 3]) # [1, 3, 6]

# tests
# p running_total([2, 5, 13]) == [2, 7, 20]
# p running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
# p running_total([3]) == [3]
# p running_total([]) == []