# solution 1 - using a simple loop to iterate through index positions

# class DNA
#   attr_reader :string

#   def initialize(string)
#     @string = string
#   end

#   def hamming_distance(other_string)
#     index = 0
#     count = 0
#     self_string = self.string
#     self_length = self_string.length
#     other_length = other_string.length

#     loop do
#       count += 1 if self_string[index] != other_string[index]
#       index += 1
#       break if index >= self_length || index >= other_length
#     end

#     count
#   end
# end

# solution 2 - using Array#upto to iterate after determining max_length

class DNA
  attr_reader :string

  def initialize(string)
    @string = string
  end

  def hamming_distance(other_string)
    differences = 0

    max_length = [string.length, other_string.length].min

    0.upto(max_length - 1) do |index|
      differences += 1 if string[index] != other_string[index]
    end

    differences
  end
end

p DNA.new('ACT').hamming_distance('TCA') # => 2
