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

buffer = [1, 2, 3, 4, 5]
input_array = [1, 2, 3, 4, 5]
max_buffer_size = 5
new_element = 6

# p rolling_buffer1([1, 2, 3, 4, 5], 5, 6)
# p rolling_buffer2([1, 2, 3, 4, 5], 5, 6)

p rolling_buffer1(buffer, max_buffer_size, new_element)
p rolling_buffer2(input_array, max_buffer_size, new_element)

p buffer
p input_array

# rolling_buffer1 method mutates the array argument
# rolling_buffer2 method uses assignment, so input_array is not mutated and retains original value