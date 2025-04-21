# SOLUTION 1 - FIRST DRAFT

# class Series
#   def initialize(string)
#     @string = string
#   end

#   def slices(length)
#     raise ArgumentError if length > @string.length
#     array_of_slices = []
#     array_of_digits = @string.chars.map(&:to_i)

#     array_of_digits.each_cons(length) { |series| array_of_slices << series }

#     array_of_slices
#   end
# end

# SOLUTION 2 - SECOND DRAFT - REFACTOR

class Series
  def initialize(string)
    @string = string
  end

  def slices(length)
    raise ArgumentError if length > @string.length

    @string.chars.map(&:to_i).each_cons(length).to_a
  end
end
