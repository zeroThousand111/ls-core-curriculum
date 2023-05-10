def stringy(n)
  array = []
  n.times do |e|
    if e.even? 
      array << 1
    else
      array << 0
    end
  end
  string = array.join
  return string
end

# output tests
puts stringy(4)
puts stringy(7)

# tests
puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'