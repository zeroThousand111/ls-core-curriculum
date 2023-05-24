def xor?(x, y)
  !!x != !!y
end

# truth tests
p xor?(5.even?, 4.even?) == true
p xor?(5.odd?, 4.odd?) == true
p xor?(5.odd?, 4.even?) == false
p xor?(5.even?, 4.odd?) == false

p xor?(a = 5, nil) == true
p xor?(false, nil) == false