def triangle_south_east(n)
  spaces = n - 1
  stars = 1
  n.times do
    puts (" " * spaces) + ("*" * stars)
    spaces -= 1
    stars += 1
  end
end

def triangle_south_west(n)
  spaces = n - 1
  stars = 1
  n.times do
    puts ("*" * stars) + (" " * spaces)
    spaces -= 1
    stars += 1
  end
end

def triangle_north_west(n)
  spaces = 1
  stars = n - 1
  n.times do
    puts ("*" * stars) + (" " * spaces)
    spaces += 1
    stars -= 1
  end
end

def triangle_north_west(n)
  spaces = 0
  stars = n
  n.times do
    puts ("*" * stars) + (" " * spaces)
    spaces += 1
    stars -= 1
  end
end

def triangle_north_east(n)
  spaces = 0
  stars = n
  n.times do
    puts  (" " * spaces) + ("*" * stars)
    spaces += 1
    stars -= 1
  end
end

triangle_south_east(5)
puts ""
triangle_south_west(5)
puts ""
triangle_north_west(5)
puts ""
triangle_north_east(5)