# methods that get user data

def get_loan_amount
  loop do
    puts "Please enter the loan amount:"
    amount = gets.chomp.to_i
    return amount if is_not_zero?(amount) && is_a_number?(amount)
    puts "I'm sorry that isn't a valid loan amount, please try again."
  end
end

def get_apr
  puts "Please enter the annual percentage rate (APR):"
  monthly_apr = ((gets.chomp.to_f) / 100) / 12 # there is a bug here somewhere
  return monthly_apr if is_a_float?(monthly_apr)
end

def get_loan_duration
  loop do
    puts "Please enter the loan duration in years:"
    loan_duration = (gets.chomp.to_i) * 12
    return loan_duration if is_not_zero?(loan_duration) && is_a_number?(loan_duration)
    puts "I'm sorry that isn't a valid loan duration, please try again."
  end
end

# methods that validate the user input

def is_not_zero?(num)
  num > 0
end

def is_a_number?(num)
  num == num.to_s.to_i
end

def is_a_float?(float)
  float == float.to_s.to_f # or there is a bug here somewhere
end

# main program

loan_amount = get_loan_amount
monthly_interest_rate = get_apr
p monthly_interest_rate
loan_duration_months = get_loan_duration

monthly_payment = loan_amount * (monthly_interest_rate / (1 - (1 + monthly_interest_rate)**(-loan_duration_months)))

# Output

puts "For a loan of $#{loan_amount}, borrowed over #{loan_duration_months} months..."
puts "... and a monthly APR of #{monthly_interest_rate.round(3)}"
puts "The monthly repayments would be $#{monthly_payment.round(2)}"


=begin
the mortgage calculation itself
m = p * (j / (1 - (1 + j)**(-n)))

https://launchschool.com/lessons/8a39abff/assignments/108c2dff
=end
