# ask user for dimensions
puts "=> Enter the length of the room in metres:"
length = gets.chomp.to_f
puts "=> Enter the width of the room in metres:"
width = gets.chomp.to_f

# calculate area and round to 2 d.p.
area = (length * width).round(2)

# output and convert to 2 d.p.
puts "The area of the room is #{area} metres (#{(area * 10.7639).round(2)} feet)."
