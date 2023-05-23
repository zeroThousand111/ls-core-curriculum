def triangle(n)
  n.times do |i|
    puts (" " * (n - (i + 1))) + ("*" * (i + 1))
  end
end

# tests
triangle(3)
triangle(5)
triangle(9)