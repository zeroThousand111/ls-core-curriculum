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

def valid_loan_duration?(n)
  valid_number?(n) && positive_number?(n)
end

# welcome heredoc
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

# error heredocs
error = <<-ERROR
Please only enter a number; no characters or symbols.
Please don't enter a value of zero.
Please don't enter any spaces or commas in long numbers.

ERROR

error_apr = <<-ERROR
Please only enter a number; no characters or symbols.
Please don't enter any spaces or commas in long numbers.

ERROR

# initialise local variables that will be out of scope in later loops
loan_amount = nil
apr = nil
loan_duration_years = nil

# Main loop
loop do
  # Welcome message
  system "clear"
  puts welcome

  # get user input for three variables
  # get loan amount
  loop do
    puts "What is the amount of the loan ($)?"
    loan_amount = gets.chomp
    break if valid_number?(loan_amount) && positive_number?(loan_amount)
    puts "Invalid loan amount."
    puts error
  end

  # get APR
  loop do
    puts "What is the Annual Percentage Rate on the loan (%)?"
    apr = gets.chomp
    break if valid_number?(apr)
    puts "Invalid APR."
    puts error_apr
  end

  # get loan duration
  loop do
    puts "What is the duration of the loan (years)?"
    loan_duration_years = gets.chomp
    break if valid_loan_duration?(loan_duration_years)
    puts "Invalid duration."
    puts error
  end

  # prepare input variables for calculation
  loan_amount = loan_amount.to_f
  apr = apr.to_f / 100 # this decimalises the APR
  loan_duration_months = loan_duration_years.to_f * 12
  monthly_interest_rate = apr / 12

  # main calculation of monthly payment
  if apr == 0
    monthly_payment = loan_amount / loan_duration_months
  else
    monthly_payment = loan_amount *
                      (monthly_interest_rate / (1 -
                      (1 + monthly_interest_rate)**(-loan_duration_months)))
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
