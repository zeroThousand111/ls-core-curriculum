# original method

def color_valid(color)
  if color == "blue" || color == "green"
    true
  else
    false
  end
end

# simpler method
def color_valid_new(color)
  (color == "blue" || color == "green") ? true : false
end

# test input
p color_valid("yellow")
p color_valid("red")
p color_valid("blue")
p color_valid("green")

p color_valid_new("yellow")
p color_valid_new("red")
p color_valid_new("blue")
p color_valid_new("green")