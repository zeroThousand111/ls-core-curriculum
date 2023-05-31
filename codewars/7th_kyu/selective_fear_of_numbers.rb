def am_I_afraid(day,num)
  case day
    when "Monday"
      num == 12
    when "Tuesday"
      num > 95
    when "Wednesday"
      num == 34
    when "Thursday"
      num == 0
    when "Friday"
      num % 2 == 0
    when "Saturday"
      num == 56
    when "Sunday"
      (num == 666 || num == -666)
  end
end

# print tests
# p am_I_afraid("Monday", 12)


# tests
p am_I_afraid("Monday", 13) == false
p am_I_afraid("Sunday", -666) == true
p am_I_afraid("Tuesday", 2) == false
p am_I_afraid("Tuesday", 965) == true
p am_I_afraid("Friday", 2) == true