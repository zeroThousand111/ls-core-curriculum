def calculate_bonus(amount, boolean)
  boolean ? amount / 2 : 0
end

# truth tests

puts calculate_bonus(2800, true) == 1400
puts calculate_bonus(1000, false) == 0
puts calculate_bonus(50000, true) == 25000