def stringy(n)
  array = []
  n.times do |index|
    array.push(index.odd? ? 0 : 1)
  end
  array.join.to_s
end

# my tests
puts stringy(6)
puts stringy(9)
puts stringy(4) 
puts stringy(7)

# truth tests
puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'
