# my method
# def xor?(arg1, arg2)
#   arg1 != arg2
# end

# official solution
def xor?(value1, value2)
  return true if value1 && !value2
  return true if value2 && !value1
  false
end

# Chad Gratt's Solution
# def xor?(value1, value2)
#   !value1 != !value2
# end

# my tests
# boolean tests
p xor?(true, true) == false
p xor?(false, false) == false
p xor?(true, false) == true
p xor?(false, true) == true

# truthy and falsy tests
p xor?(nil, true) == true
p xor?(nil, false) == false
p xor?(3, false) == true
p xor?(3, true) == false

# problem tests
# p xor?(5.even?, 4.even?) == true
# p xor?(5.odd?, 4.odd?) == true
# p xor?(5.odd?, 4.even?) == false
# p xor?(5.even?, 4.odd?) == false