# method
def calculate_bonus(money, bonus)
  bonus ? (money / 2) : 0
end

# tests
puts calculate_bonus(2800, true) == 1400
puts calculate_bonus(1000, false) == 0
puts calculate_bonus(50000, true) == 25000