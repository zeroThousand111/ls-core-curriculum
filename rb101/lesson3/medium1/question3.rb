# def factors(number)
#   divisor = number.abs
#   factors = []
#   begin
#     factors << number / divisor if number % divisor == 0
#     divisor -= 1
#   end until divisor == 0
#   factors
# end

def factors(number)
  divisor = number.abs
  factors = []
  if number <= 0
    puts "Sorry I can't do that calculation!"
  else
    until divisor == 0
      factors << number / divisor if number % divisor == 0
      divisor -= 1
    end
  end
  factors
end

# my test inputs
puts factors(12)
puts factors(9)
puts factors(0)
puts factors(-9)