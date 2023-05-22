# method
def stringy(n)
  array = []
  n.times do | i |
    array << (i.even? ? 1 : 0)
  end
  array.join
end

# tests
puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'