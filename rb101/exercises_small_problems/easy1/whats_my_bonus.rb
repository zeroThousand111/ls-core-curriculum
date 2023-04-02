def calculate_bonus(money, bonus)
    if bonus
        return money/2
    else 
        return 0
    end
end


puts calculate_bonus(2800, true) == 1400
puts calculate_bonus(1000, false) == 0
puts calculate_bonus(50000, true) == 25000