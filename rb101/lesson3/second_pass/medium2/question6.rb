# How could the following method be simplified without changing its return value?
# def color_valid(color)
#   if color == "blue" || color == "green"
#     true
#   else
#     false
#   end
# end



def color_valid(color)
  color == "blue" || color == "green"
end

# tests

p color_valid("blue")
p color_valid("green")
p color_valid("yellow")