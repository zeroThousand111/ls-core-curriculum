def triangle(n)
  spaces = n - 1
  stars = 1
  n.times do
    puts (" " * spaces) + ("*" * stars)
    spaces -= 1
    stars += 1
  end
end

triangle(3)
triangle(9)