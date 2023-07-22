# note to self - I really ought to have PEDAC'ed this solution first!

# method
def century(date)
  century = date / 100
  century += 1 unless (date % 100 == 0)
  century = century.to_s
  if century.end_with?("1") && !century.end_with?("11")
    suffix = "st"
  elsif century.end_with?("2") && !century.end_with?("12")
    suffix = "nd"
  elsif century.end_with?("3") && !century.end_with?("13")
    suffix = "rd"
  else
    suffix = "th"
  end
  century + suffix
end

# tests
p century(2000)
p century(2001)
p century(2111)
p century(1965)
p century(1001)
p century(1101)
p century(1201)

# truth tests
p century(2000) == '20th'
p century(2001) == '21st'
p century(1965) == '20th'
p century(256) == '3rd'
p century(5) == '1st'
p century(10103) == '102nd'
p century(1052) == '11th'
p century(1127) == '12th'
p century(11201) == '113th'