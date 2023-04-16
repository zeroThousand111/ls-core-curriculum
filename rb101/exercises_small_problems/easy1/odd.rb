# def is_odd?(integer)
#   if integer % 2 == 1
#     true
#   else
#     false
#   end
# end

def is_odd?(integer)
  (integer % 2 == 1) ? true : false
end

puts is_odd?(2)    # => false
puts is_odd?(5)    # => true
puts is_odd?(-17)  # => true
puts is_odd?(-8)   # => false
puts is_odd?(0)    # => false
puts is_odd?(7)    # => true