def prompt(message)
  puts "=> #{message}"
end

def valid_number?(num)
  valid_integer?(num) || valid_float?(num)
end

def valid_integer?(num)
  num.to_i.to_s == num
end

def valid_float?(num)
  num.to_f.to_s == num
end

def operation_to_message(operation)
  word = case operation
           when '1'
             'Adding'
           when '2'
             'Subtracting'
           when '3'
             'Multiplying'
           when '4'
             'Dividing'
         end

  x = "A random line of code"

  word
end

num1 = nil
num2 = nil
name = nil

# welcome message and prompt to enter user name

loop do
  prompt("Welcome to Calculator! Please enter your name:")
  name = gets.chomp
  if name.empty?
    prompt("Hmm... that doesn't look like a valid name.")
  else
    break
  end
end

prompt("Hi, #{name}")

# main loop begins
loop do
  # ask the user for the first number and validate it
  loop do
    prompt("Please enter the first number:")
    num1 = gets.chomp
    if valid_number?(num1)
      break
    else
      prompt("Hmm... that doesn't look like a valid number.")
    end
  end

  # ask the user for the second number and validate it
  loop do
    prompt("Please enter the second number:")
    num2 = gets.chomp
    if valid_number?(num2)
      break
    else
      prompt("Hmm... that doesn't look like a valid number.")
    end
  end

  # ask the user for an operation to perform
  operator_prompt = <<-MSG # this is a heredoc
    Please enter an operation you would like to perform:
    1) add
    2) subtract
    3) multiplication
    4) division
  MSG
  prompt(operator_prompt)

  operator = nil
  loop do
    operator = gets.chomp
    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt("Must choose 1, 2, 3 or 4")
    end
  end

  # perform the operation on the two numbers
  result = case operator
           when '1'
             num1.to_f + num2.to_f
           when '2'
             num1.to_f - num2.to_f
           when '3'
             num1.to_f * num2.to_f
           when '4'
             num1.to_f / num2.to_f
           end

  result = result.round(2)

  prompt("#{operation_to_message(operator)} #{num1} and #{num2}...")

  # output the result
  prompt("The answer, rounded to 2 d.p., is #{result}!")

  # ask the user if they want to loop again
  prompt("Do you want to perform another calculation? (Y for yes)")
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

# exit message
prompt("Thank you for using calculator. Goodbye!")
