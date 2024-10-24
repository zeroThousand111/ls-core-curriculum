=begin
A fixed-length array is an array that always has a fixed number of elements. Write a class that implements a fixed-length array, and provides the necessary methods to support the following code:
=end

class FixedArray
  attr_reader :array

  def initialize(num)
    @array = []
    num.times do |iteration|
      array.push(nil)
    end
  end

  def [](index)
    if index_out_of_range?(index)
      raise IndexError
    else
      array[index]
    end
  end

  def []=(index, value)
    if index_out_of_range?(index)
      raise IndexError
    else
      array[index] = value
    end
  end

  def to_a
    array
  end

  def to_s
    "#{array}"
  end

  private

  def index_out_of_range?(index)
    index > (array.size - 1) || index < (-array.size)
  end
end

=begin
I created the following methods in the FixedArray class:
- initialize
- []
- []=
- to_a
- to_s
- index_out_of_index_range? (private)
=end

# LS Solution

class FixedArray
  def initialize(max_size)
    @array = Array.new(max_size)
  end

  def [](index)
    @array.fetch(index)
  end

  def []=(index, value)
    self[index]             # raise error if index is invalid!
    @array[index] = value
  end

  def to_a
    @array.clone
  end

  def to_s
    to_a.to_s
  end
end

# tests

fixed_array = FixedArray.new(5)
puts fixed_array[3] == nil
puts fixed_array.to_a == [nil] * 5

fixed_array[3] = 'a'
puts fixed_array[3] == 'a'
puts fixed_array.to_a == [nil, nil, nil, 'a', nil]

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

# The above code should output true 16 times.