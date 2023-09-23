# def negative(num)
#   if num > 0
#     return num -= num * 2
#   else
#     return num
#   end
# end

def negative(num)
  num > 0 ? -num : num
end

# truth tests
p negative(5) == -5
p negative(-3) == -3
p negative(0) == 0      # There's no such thing as -0 in ruby

# def inverse_number(num)
#   -num
# end

# puts inverse_number(8)
# puts inverse_number(-8)
# puts inverse_number(0)