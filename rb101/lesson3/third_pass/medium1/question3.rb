

def factors(number)
  if invalid_factor?(number)
      puts "Sorry, I can't do that"
      return
  end
  divisor = number
  factors = []
  until divisor == 0
    factors << number / divisor if number % divisor == 0
    divisor -= 1
  end
  factors
end

def invalid_factor?(number)
  number < 1
end

# tests

p factors(12)
p factors(20)
p factors(0)