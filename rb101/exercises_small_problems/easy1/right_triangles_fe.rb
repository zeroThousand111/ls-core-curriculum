# further exploration project

# original triangle
def triangle(n)
  counter = 1
  until counter == (n + 1) 
    puts "#{' ' * (n - counter)}#{'*' * counter}"
    counter += 1
  end
end

# reversed triangle
def reversed_triangle(n)
  counter = 1
  until counter == (n + 1) 
    puts "#{'*' * counter}#{' ' * (n - counter)}"
    counter += 1
  end
end

# upside-down triangle
def upside_down_triangle(n)
  counter = 0
  until counter == (n + 1) 
    puts "#{' ' * counter}#{'*' * (n-counter)}"
    counter += 1
  end
end

# upside-down and reversed triangle
def upside_down_reversed_triangle(n)
  counter = 0
  until counter == (n + 1) 
    puts "#{'*' * (n - counter)}#{' ' * counter}"
    counter += 1
  end
end

triangle(5)
puts ""
upside_down_triangle(5)
puts ""
reversed_triangle(5)
puts ""
upside_down_reversed_triangle(5)