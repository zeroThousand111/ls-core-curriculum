def multiply(x, y)
  x * y
end

def square(z)
  multiply(z, z)
end

def power(base, exponent)
  answer = 0
  (exponent - 1).times do |i|
    answer += square(base)
  end
  answer
end

# my tests
p power(2, 2) == 4
p power(2, 3) == 8
