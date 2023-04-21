# def triangle(n)
#   counter = 1
#   loop do 
#     puts "#{' ' * (n - counter)}#{'*' * counter}"
#     counter += 1
#     break if counter == (n + 1)
#   end
# end

def triangle(n)
  counter = 1
  until counter == (n + 1) 
    puts "#{' ' * (n - counter)}#{'*' * counter}"
    counter += 1
  end
end





triangle(5)
triangle(9)