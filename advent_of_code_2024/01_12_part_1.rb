# read txt file and make two columns of Integers from the numerical Strings

lists = [[], []]
input = File.open("01_12_part_1_input.txt")
input.each_line do |line|
  lists[0] << line.split(" ")[0].to_i
  lists[1] << line.split(" ")[1].to_i
end

# sort the two arrays of Integers by ascending numerical order

lists.map! { |column| column.sort }

# create an array of differences between the columns

differences = []

lists[0].each_index do |index|
  differences << (lists[0][index] - lists[1][index]).abs
end

# sum the differences

p differences.sum

# correct answer is a total difference of 2057374