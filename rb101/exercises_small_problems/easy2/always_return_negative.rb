# my solution
# def negative(n)
#   if n >= 0
#     n - (n * 2)
#   else
#     n
#   end
# end

# official solution v1
# def negative(number)
#   number > 0 ? -number : number
# end

# official solution v2
def negative(number)
  -number.abs
end


p negative(5) == -5
p negative(-3) == -3
p negative(0) == 0
