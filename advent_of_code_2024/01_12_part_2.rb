# read txt file and make two columns of Integers from the numerical Strings

# lists = [[], []]
# input = File.open("01_12_part_1_input.txt")
# input.each_line do |line|
#   lists[0] << line.split(" ")[0].to_i
#   lists[1] << line.split(" ")[1].to_i
# end

# # create an array of similarity scores

# similarities = []

# lists[0].each_index do |index|
#   similarities << lists[0][index] * lists[1].count(lists[0][index])
# end

# # sum the array of similarity scores

# puts similarities.sum

# correct answer is a total difference of 23177084

# ---

# combined solutions to part 1 and part 2

# read txt file and make two columns of Integers from the numerical Strings

lists = [[], []]
input = File.open("01_12_part_1_input.txt")
input.each_line do |line|
  lists[0] << line.split(" ")[0].to_i
  lists[1] << line.split(" ")[1].to_i
end

# part 1

# sort the two arrays of Integers by ascending numerical order

sorted_lists = lists.map { |column| column.sort }

# create an array of differences between the columns

differences = []

sorted_lists[0].each_index do |index|
  differences << (sorted_lists[0][index] - sorted_lists[1][index]).abs
end

# sum the differences

puts differences.sum  # => 2057374

# ---

# part 2

# create an array of similarity scores from the unsorted lists (not that it really matters)

similarities = []

lists[0].each_index do |index|
  similarities << lists[0][index] * lists[1].count(lists[0][index])
end

# sum the array of similarity scores

puts similarities.sum # => 23177084