# combined validation method
def a_number_not_zero?(n)
  ((n.to_f.to_s == n) || (n.to_i.to_s == n)) && (n != '0')
end

# initialise local variables that will be out of scope in later loops
loan_amount = nil
apr = nil
loan_duration_years = nil

# get user input for three variables
# get loan amount
loop do
  puts "What is the amount of the loan ($)?"
  loan_amount = gets.chomp
  break if a_number_not_zero?(loan_amount)
  puts "Invalid loan amount."
  puts "Please only enter a number, not a character or a symbol."
  puts "Please don't enter a value of zero."
end

# get APR
loop do
  puts "What is the Annual Percentage Rate on the loan (%)?"
  apr = gets.chomp
  break if a_number_not_zero?(apr)
  puts "Invalid APR."
  puts "Please only enter a number, not a character or a symbol."
  puts "Please don't enter a value of zero."
end

# get loan duration
loop do
  puts "What is the duration of the loan (years)?"
  loan_duration_years = gets.chomp
  break if a_number_not_zero?(loan_duration_years)
  puts "Invalid duration."
  puts "Please only enter a number, not a character or a symbol."
  puts "Please don't enter a value of zero."
end

# prepare input variables for calculation
loan_amount = loan_amount.to_f
apr = apr.to_f / 100 # this decimalises the APR
loan_duration_months = loan_duration_years.to_f * 12
monthly_interest_rate = apr / 12

# main calculation of monthly payment rounded to 2 d.p.
monthly_payment = loan_amount * (monthly_interest_rate / (1 - (1 + monthly_interest_rate)**(-loan_duration_months)))

# output results
puts ""
puts "The amount to borrow is $#{loan_amount.round(0)}"
puts "The APR is #{apr * 100}%"
puts "There will be #{loan_duration_months.round(0)} monthly repayments"
puts "Each of $#{monthly_payment.round(2)}"
