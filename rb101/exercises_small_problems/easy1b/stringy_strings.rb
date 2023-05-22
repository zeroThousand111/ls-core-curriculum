# method
def stringy(n, rev = 1)
  array = []
  if rev == 1
    n.times do | i |
      array << (i.even? ? 1 : 0)
    end
  else
    n.times do | i |
      array << (i.odd? ? 1 : 0)
    end
  end
  array.join
end

# tests for main problem
# puts stringy(6) == '101010'
# puts stringy(9) == '101010101'
# puts stringy(4) == '1010'
# puts stringy(7) == '1010101'

# tests for further exploration
puts stringy(6, 0) == '010101'
puts stringy(9, 1) == '101010101'
puts stringy(4, 0) == '0101'
puts stringy(7, 1) == '1010101'