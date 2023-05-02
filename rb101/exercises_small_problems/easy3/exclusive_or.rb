# # my method
# def xor?(arg1, arg2)
#   arg1 != arg2
# end

def xor?(value1, value2)
  !value1 != !value2
end


# official solution
def xor?(value1, value2)
  return true if value1 && !value2
  return true if value2 && !value1
  false
end

p xor?(5.even?, 4.even?) == true
p xor?(5.odd?, 4.odd?) == true
p xor?(5.odd?, 4.even?) == false
p xor?(5.even?, 4.odd?) == false