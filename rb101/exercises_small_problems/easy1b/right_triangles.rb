# first solution
def triangle(n)
  n.times do |i|
    puts (" " * (n - (i + 1))) + ("*" * (i + 1))
  end
end

# official solution
# def triangle(num)
#   spaces = num - 1
#   stars = 1

#   num.times do |n|
#     puts (' ' * spaces) + ('*' * stars)
#     spaces -= 1
#     stars += 1
#   end
# end

# inverted right-left triangle
def inv_triangle(n)
  n.times do |i|
    puts (" " * i) + ("*" * (n - i))
  end
end

# left-right triangle
def left_right_triangle(n)
  n.times do |i|
    puts ("*" * (i + 1))
  end
end

# inverted left-right triangle
def inv_left_right_triangle(n)
  n.times do |i|
    puts ("*" * (n - i))
  end
end

# tests
triangle(3)
triangle(5)
triangle(9)

inv_triangle(3)
inv_triangle(5)
inv_triangle(9)

left_right_triangle(3)
left_right_triangle(5)
left_right_triangle(9)

inv_left_right_triangle(3)
inv_left_right_triangle(5)
inv_left_right_triangle(9)