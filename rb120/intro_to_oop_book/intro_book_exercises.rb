=begin

# Classes & Objects I Exercises

Create a class called MyCar. When you initialize a new instance or object of the class, allow the user to define some instance variables that tell us the year, color, and model of the car. Create an instance variable that is set to 0 during instantiation of the object to track the current speed of the car as well. Create instance methods that allow the car to speed up, brake, and shut the car off.

Add an accessor method to your MyCar class to change and view the color of your car. Then add an accessor method that allows you to view, but not modify, the year of your car.

You want to create a nice interface that allows you to accurately describe the action you want your program to perform. Create a method called spray_paint that can be called on an object and will modify the color of the car.

# Classes & Objects II Exercises

Add a class method to your MyCar class that calculates the gas mileage (i.e. miles per gallon) of any car.

Override the to_s method to create a user friendly print out of your object.

# Inheritance Exercises


=end


class MyCar
  attr_accessor :color, :speed
  attr_reader :year, :model

  def self.calculate_mileage(miles, gallons)
    puts "The fuel economy for that trip was #{miles / gallons} miles per gallon."
  end

  def initialize(year, color, model)
    @year = year
    @color = color
    @model = model
    @speed = 0
  end

  def speed_up(increase)
    self.speed += increase
    "Dashboard message: #{speed} mph"
  end

  def brake(decrease)
    self.speed -= decrease
    "Dashboard message: #{speed} mph"
  end

  def shut_off
    self.speed = 0
    "Dashboard message: Engine off. #{speed} mph"
  end

  def spray_paint(new_color)
    self.color = new_color
    "The #{model.capitalize} is now a nice shiny #{color.upcase} color!"
  end

  def to_s
    "This is a #{year} #{color} #{model}."
  end

end

# Classes & Objects I Exercises

skoda = MyCar.new(2015, "silver", "octavia")

puts skoda.speed_up(55) # => Dashboard message: 55 mph

puts skoda.brake(5) # => Dashboard message: 55 mph

puts skoda.shut_off # => Dashboard message: Engine off. 0 mph

puts skoda.spray_paint("yellow") # => The Octavia is now a nice shiny YELLOW color!

# Classes & Objects II Exercises

puts MyCar.calculate_mileage(100, 5) # => The fuel economy for that trip was 20 miles per gallon.

puts skoda # => This is a 2015 yellow octavia. 

# Inheritance Exercises


