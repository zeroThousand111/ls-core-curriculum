=begin
Reverse Engineering
Write a class that will display:

ABC
xyz

when the following code is run:

my_data = Transform.new('abc')
puts my_data.uppercase
puts Transform.lowercase('XYZ')
=end

class Transform
  
  def self.lowercase(input)
    input.downcase
  end
  
  def initialize(input)
    @string = input
  end
  
  def uppercase
    @string.upcase
  end
  
end

my_data = Transform.new('abc')
puts my_data.uppercase
puts Transform.lowercase('XYZ')