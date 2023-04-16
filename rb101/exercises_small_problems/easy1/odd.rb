# My Original Over-Engineered Solution
# def is_odd?(integer)
#   if integer % 2 == 1
#     true
#   else
#     false
#   end
# end

# A Ternary Statement that does the same as above
# def is_odd?(integer)
#   (integer % 2 == 1) ? true : false
# end

# Official Solution
# def is_odd?(number)
#   number % 2 == 1
# end

# Answer to the further exploration question
def is_odd?(integer)
  integer.remainder(2) == 1
end

puts is_odd?(2)    # => false
puts is_odd?(5)    # => true
puts is_odd?(-17)  # => true
puts is_odd?(-8)   # => false
puts is_odd?(0)    # => false
puts is_odd?(7)    # => true