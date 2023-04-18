# def calculate_bonus(salary, bonus)
#   if bonus == true
#     result = salary / 2
#   else
#     result = 0
#   end
#   result
# end

def calculate_bonus(salary, bonus)
  result = bonus ? salary / 2 : 0
end

# print results
puts calculate_bonus(2800, true)
puts calculate_bonus(1000, false)
puts calculate_bonus(50000, true)

# tests
puts calculate_bonus(2800, true) == 1400
puts calculate_bonus(1000, false) == 0
puts calculate_bonus(50000, true) == 25000