# initialise constant
MONTHS_IN_YEAR = 12

# user input validation methods
def valid_float?(n)
  n.to_f.to_s == n
end

def valid_integer?(n)
  n.to_i.to_s == n
end

def valid_number?(n)
  valid_float?(n) || valid_integer?(n)
end

def positive_number?(n)
  n.to_i > 0
end

def zero_or_above?(n)
  n.to_i >= 0
end

def valid_loan_duration?(n)
  valid_number?(n) && positive_number?(n)
end

# calculation method
def calculate_monthly_payment(loan_amount, loan_duration_months, monthly_interest_rate)
  loan_amount * (monthly_interest_rate / (1 -
                (1 + monthly_interest_rate)**(-loan_duration_months)))
end

# methods to obtain user input
def get_loan_amount
  loan_amount = nil
  loop do
    puts "What is the amount of the loan ($)?"
    loan_amount = gets.chomp
    break if valid_number?(loan_amount) && positive_number?(loan_amount)
    puts "Invalid loan amount."
    puts "Please only enter a number; no characters or symbols."
    puts "Please don't enter a value of zero."
    puts "Please don't enter any spaces or commas in long numbers."
  end
  loan_amount.to_f
end

def get_apr
  apr = nil
  loop do
    puts "What is the Annual Percentage Rate on the loan (%)?"
    apr = gets.chomp
    break if valid_number?(apr) && zero_or_above?(apr)
    puts "Invalid APR."
    puts "Please only enter a number; no characters or symbols."
    puts "Please don't enter any spaces or commas in long numbers."
    puts "Please only enter a positive value or zero for the APR."
  end
  apr.to_f / 100
end

def get_loan_duration
  loan_duration_years = nil
  loop do
    puts "What is the duration of the loan (years)?"
    loan_duration_years = gets.chomp
    break if valid_loan_duration?(loan_duration_years)
    puts "Invalid duration."
    puts "Please only enter a number; no characters or symbols."
    puts "Please don't enter a value of zero."
    puts "Please don't enter any spaces or commas in long numbers."
  end
  loan_duration_years
end

welcome = <<-WELCOME
Welcome to Mortgage Calculator!

This tool will calculate your monthly payments on a loan and the interest to pay back.

In a moment I will ask for:
  - the loan amount in US dollars and cents ($)
  - the annual percentage rate (APR) in percent (%)
      - (decimals are OK, 0% APR is OK)
  - the term of the loan in years
      - (decimals are OK)

WELCOME

# Main loop
loop do
  # Welcome message
  system "clear"
  puts welcome

  # get user input for three variables
  loan_amount = get_loan_amount
  apr = get_apr
  loan_duration_years = get_loan_duration

  # prepare input variables for calculation
  loan_duration_months = loan_duration_years.to_f * MONTHS_IN_YEAR
  monthly_interest_rate = apr / MONTHS_IN_YEAR

  # main calculation of monthly payment
  if apr == 0
    monthly_payment = loan_amount / loan_duration_months
  else
    monthly_payment = calculate_monthly_payment(loan_amount, loan_duration_months, monthly_interest_rate)
  end

  # output results, rounded up to 0 or 2 d.p.
  result = <<~RESULT
  
  The amount to borrow is $#{format('%.2f', loan_amount)}
  The APR is #{(apr * 100).round(2)}%
  There will be #{loan_duration_months.round(0)} monthly repayments
  Each monthly repayment will be $#{format('%.2f', monthly_payment)}
  In total, $#{format('%.2f', (loan_duration_months * monthly_payment))} will be paid back
  The interest paid on the loan will be $#{format('%.2f', ((loan_duration_months * monthly_payment) - loan_amount))}
  
  Would you like to calculate another amount? (Press 'y' for YES, any other key for NO)
  
  RESULT
  puts result

  another_loop = gets.chomp.downcase
  break unless another_loop == 'y'
end

puts "Thank you for using Mortgage Calculator.  Goodbye!"
