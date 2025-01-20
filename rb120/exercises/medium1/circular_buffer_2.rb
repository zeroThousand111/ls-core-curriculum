class CircularBuffer
  attr_reader :max_size
  attr_accessor :buffer

  def initialize(max_size)
    @max_size = max_size
    @buffer = []
  end

  def get
    buffer.pop
  end

  def put(value)
    if buffer.size < max_size
      buffer.unshift(value)
    else
      buffer.pop
      buffer.unshift(value)
    end
  end
end

# tests

buffer = CircularBuffer.new(3)
puts buffer.get == nil

buffer.put(1)
buffer.put(2)
puts buffer.get == 1

buffer.put(3)
buffer.put(4)
puts buffer.get == 2

buffer.put(5)
buffer.put(6)
buffer.put(7)
puts buffer.get == 5
puts buffer.get == 6
puts buffer.get == 7
puts buffer.get == nil

buffer = CircularBuffer.new(4)
puts buffer.get == nil

buffer.put(1)
buffer.put(2)
puts buffer.get == 1

buffer.put(3)
buffer.put(4)
puts buffer.get == 2

buffer.put(5)
buffer.put(6)
buffer.put(7)
puts buffer.get == 4
puts buffer.get == 5
puts buffer.get == 6
puts buffer.get == 7
puts buffer.get == nil