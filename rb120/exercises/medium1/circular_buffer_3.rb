# Third iteration of my solution to this problem, four months after the first.  Much simpler and easier to read.

class CircularBuffer
  def initialize(size)
    @max_buffer_size = size
    @buffer = Array.new
  end

  def get
    return nil if buffer.empty?
    buffer.pop
  end

  def put(object)
    buffer.pop if buffer_full?
    buffer.unshift(object)
  end

  private

  attr_accessor :buffer
  attr_reader :max_buffer_size

  def buffer_full?
    buffer.size >= max_buffer_size
  end

end

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