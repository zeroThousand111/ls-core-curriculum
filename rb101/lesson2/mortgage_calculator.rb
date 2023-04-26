# get user input
puts "What is the amount of the loan ($)?"
loan_amount = gets.chomp.to_f
puts "What is the Annual Percentage Rate on the loan (%)?"
apr = gets.chomp.to_f
puts "What is the duration of the loan (years)?"
loan_duration_years = gets.chomp.to_f

# pre-calculate different variables
apr /= 100 # this decimalises the APR
loan_duration_months = loan_duration_years * 12
monthly_interest_rate = apr / 12

# main calculation of monthly payment rounded to 2 d.p.
monthly_payment = (loan_amount * (monthly_interest_rate / (1 - (1 + monthly_interest_rate)**(-loan_duration_months)))).round(2)

# output results
puts "The amount to borrow is $#{loan_amount.round(0)}"
puts "The APR is #{apr * 100}%"
puts "There will be #{loan_duration_months.round(0)} monthly repayments, each of $#{monthly_payment}"
