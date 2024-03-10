# solution 3 - using #each

def running_total(input_array)
  running_total = 0
  output_array = []
  return output_array if input_array.empty?
  
  input_array.each do |num|
    running_total += num
    output_array << running_total
  end
  
  output_array
end

# -------------------

# solution 4 - using #map

def running_total(input_array)
  input_array.map.with_index { |num, index| input_array[0..index].sum }
end

# -------------------

# solution 5 - FURTHER EXPLORATION - using Enumerable#each_with_object

def running_total(input_array)
  running_total = 0
  input_array.each_with_object([]) do |num, array|
    running_total += num
    array << running_total
  end
end

# -------------------

# solution 6 - FURTHER EXPLORATION - using #inject, but I found this hard to construct alone

def running_total(input_array)
  running_total = 0
  input_array.inject([]) { |array, num| array << running_total += num }
end

# -------------------


# Print Tests
p running_total([2, 5, 13]) # [2, 7, 20]

# Test Cases
p running_total([2, 5, 13]) == [2, 7, 20]
p running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total([3]) == [3]
p running_total([]) == []