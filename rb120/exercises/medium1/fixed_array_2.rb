# Third iteration of my solution.  Much more elegant than the previous two

class FixedArray
  def initialize(max_indices)
    @max_indices = max_indices
    @array = Array.new(max_indices)
  end

  def [](index)
    array[index] unless check_for_index_error(index)
  end
  
  def []=(index, object)
    array[index] = object unless check_for_index_error(index)
  end
  
  def to_a
    array
  end

  def to_s
    array.to_s
  end

  private
  
  attr_reader :max_indices
  attr_accessor :array

  def check_for_index_error(index)
    raise IndexError if index > (max_indices - 1) || index < (-max_indices)
  end

end

fixed_array = FixedArray.new(5)
puts fixed_array[3] == nil
puts fixed_array.to_a == [nil] * 5

fixed_array[3] = 'a'
# puts fixed_array[3] == 'a'
# puts fixed_array.to_a == [nil, nil, nil, 'a', nil]

fixed_array[1] = 'b'
puts fixed_array[1] == 'b'
puts fixed_array.to_a == [nil, 'b', nil, 'a', nil]

fixed_array[1] = 'c'
puts fixed_array[1] == 'c'
puts fixed_array.to_a == [nil, 'c', nil, 'a', nil]

fixed_array[4] = 'd'
puts fixed_array[4] == 'd'
puts fixed_array.to_a == [nil, 'c', nil, 'a', 'd']
puts fixed_array.to_s == '[nil, "c", nil, "a", "d"]'

puts fixed_array[-1] == 'd'
puts fixed_array[-4] == 'c'

begin
  fixed_array[6]
  puts false
rescue IndexError
  puts true
end

begin
  fixed_array[-7] = 3
  puts false
rescue IndexError
  puts true
end

begin
  fixed_array[7] = 3
  puts false
rescue IndexError
  puts true
end
