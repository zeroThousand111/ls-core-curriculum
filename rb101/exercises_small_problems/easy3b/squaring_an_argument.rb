def multiply(x, y)
  x * y
end

def square(z)
  multiply(z, z)
end

# official tests
p square(5) == 25
p square(-8) == 64

# my tests
p square(0) == 0
p square(-3) == 9