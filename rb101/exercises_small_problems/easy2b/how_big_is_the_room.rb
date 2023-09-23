def get_length
  puts "Enter the length of the room in meters:"
  gets.chomp.to_i
end

def get_width
  puts "Enter the width of the room in meters:"
  gets.chomp.to_i
end

length = get_length
width = get_width

puts "The area of the room is #{length * width} square meters (#{(10.76391 * length * width).round(2)} square feet)"

=begin
Enter the length of the room in meters:
10
Enter the width of the room in meters:
7
The area of the room is 70.0 square meters (753.47 square feet).
=end