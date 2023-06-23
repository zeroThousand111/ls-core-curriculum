# require "pry"

int = 4
array = [2, 5, 9]
 
def my_value(ary)
  ary.each do |element|
    int += element
  end
end
 
my_value(array)
puts int