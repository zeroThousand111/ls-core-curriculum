=begin
Alyssa was asked to write an implementation of a rolling buffer. Elements are added to the rolling buffer and if the buffer becomes full, then new elements that are added will displace the oldest elements in the buffer.

She wrote two implementations saying, "Take your pick. Do you like << or + for modifying the buffer?". Is there a difference between the two, other than what operator she chose to use to concatenate an element to the buffer?
=end

def rolling_buffer1(buffer, max_buffer_size, new_element)
  buffer << new_element
  buffer.shift if buffer.size > max_buffer_size
  buffer
end

def rolling_buffer2(input_array, max_buffer_size, new_element)
  buffer = input_array + [new_element]
  buffer.shift if buffer.size > max_buffer_size
  buffer
end

buffer = [1, 2, 3]
p rolling_buffer1(buffer, 3, 9) # [2, 3, 9]
p buffer # [2, 3, 9] - original buffer has been mutated

buffer = [1, 2, 3]

p rolling_buffer2(buffer, 3, 9) # [2, 3, 9]
p buffer # [1, 2, 3] - original buffer hasn't changed, which is not what we want!