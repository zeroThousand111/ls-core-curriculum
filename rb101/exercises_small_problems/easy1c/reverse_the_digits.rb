def reversed_number(n)
  n.to_s.reverse.to_i
end

# tests 
p reversed_number(12345) 
p reversed_number(456)
p reversed_number(12000) # 21 No leading zeros in return value!
p reversed_number(12003) #30021
p reversed_number(1)

# truth tests
p reversed_number(12345) == 54321
p reversed_number(12213) == 31221
p reversed_number(456) == 654
p reversed_number(12000) == 21 # No leading zeros in return value!
p reversed_number(12003) == 30021
p reversed_number(1) == 1