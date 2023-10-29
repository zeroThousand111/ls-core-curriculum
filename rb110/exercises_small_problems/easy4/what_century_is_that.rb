=begin
Write a method that takes a year as input and returns the century. The return value should be a string that begins with the century number, and ends with st, nd, rd, or th as appropriate for that number.

New centuries begin in years that end with 01. So, the years 1901-2000 comprise the 20th century.
=end

=begin
MY LOGIC
1. The year divided by 100 gives the century
2. If integers turned to strings end in zero, then they belong in the next century up
3. 
=end

def calculate_yr(yr)
  yr.to_s.end_with?('0') ? (yr / 100) : ((yr / 100) + 1)
end

def century(year)
  cent = calculate_yr(year).to_s
  if cent.end_with?('1') && !(cent.end_with?('11'))
    cent + "st"
  elsif cent.end_with?('2') && !(cent.end_with?('12'))
    cent + "nd"
  elsif cent.end_with?('3') && !(cent.end_with?('13'))
    cent + "rd"
  else
    cent + "th"
  end
end

# print tests
# p calculate_yr(1999)
# p calculate_yr(2000)
# p calculate_yr(2001)

# p century(1999)
# p century(2000)
# p century(2001)
# p century(11201)

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