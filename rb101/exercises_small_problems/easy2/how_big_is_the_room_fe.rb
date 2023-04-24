# define constants
SQFEET_TO_SQMETRES = 0.09290304
SQFEET_TO_SQINCHES = 144
SQFEET_TO_SQCM = 929.0304

# ask user for dimensions
puts "=> Enter the length of the room in feet:"
length = gets.chomp.to_f
puts "=> Enter the width of the room in feet:"
width = gets.chomp.to_f

# calculate area
area_sq_ft = (length * width).round(2)
area_sq_inches = (area_sq_ft * SQFEET_TO_SQINCHES).round(2)
area_sq_cm = (area_sq_ft * SQFEET_TO_SQCM).round(2)

# output and convert to 2 d.p.
puts "The area of the room is #{area_sq_ft} square feet"
puts "This is #{area_sq_inches} square inches"
puts "And it is #{area_sq_cm} square centimetres"
