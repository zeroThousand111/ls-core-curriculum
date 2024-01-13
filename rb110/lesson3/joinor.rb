=begin
Write a method called joinor that will produce the following result:

joinor([1, 2])                   # => "1 or 2"
joinor([1, 2, 3])                # => "1, 2, or 3"
joinor([1, 2, 3], '; ')          # => "1; 2; or 3"
joinor([1, 2, 3], ', ', 'and')   # => "1, 2, and 3"

=end
require 'pry'
require 'pry-byebug'
# first attempt

# def joinor(input_array, delimiter=', ', final='or')
#   # size of input_array
#   array_size = input_array.size
#   # create new array of numerical strings
#   temp_array = input_array.map { |number| number.to_s }
#   # insert delimiter between each element (default is ',') and make new array of all but last element
#   front_array = temp_array.map { |string| string + delimiter }.take(array_size - 1)
#   # create new array of last number
#   back_array = [temp_array[-1]]
#   # combine front and back arrays
#   output_array = front_array + back_array
#   # insert 'or' at index -2
#   output_array.insert(-2, final, ' ')
#   # join elements into one string and return
#   output_array.join
# end

# refactored

def joinor(input_array, delimiter=', ', final='or')
  front_array = input_array.map do |num|
    num.to_s + delimiter
  end.take(input_array.size - 1)
  back_array = [input_array[-1].to_s]
  output_array = front_array + back_array.insert(-2, final, ' ')
  output_array.join
end

# test cases

p joinor([1, 2])                   # => "1 or 2"
p joinor([1, 2, 3])                # => "1, 2, or 3"
p joinor([1, 2, 3], '; ')          # => "1; 2; or 3"
p joinor([1, 2, 3], ', ', 'and')   # => "1, 2, and 3"
