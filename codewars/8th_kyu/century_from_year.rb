def century(year)
    c = year / 100
    year % 100 == 0 ? c : c += 1
end

# print tests
p century(1705)
p century(1900)
p century(89)

# tests
p century(1705) == 18
p century(1900) == 19
p century(89) == 1