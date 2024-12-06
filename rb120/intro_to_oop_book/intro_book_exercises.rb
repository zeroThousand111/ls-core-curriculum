=begin

# Classes & Objects I Exercises

Create a class called MyCar. When you initialize a new instance or object of the class, allow the user to define some instance variables that tell us the year, color, and model of the car. Create an instance variable that is set to 0 during instantiation of the object to track the current speed of the car as well. Create instance methods that allow the car to speed up, brake, and shut the car off.

Add an accessor method to your MyCar class to change and view the color of your car. Then add an accessor method that allows you to view, but not modify, the year of your car.

You want to create a nice interface that allows you to accurately describe the action you want your program to perform. Create a method called spray_paint that can be called on an object and will modify the color of the car.

# Classes & Objects II Exercises

Add a class method to your MyCar class that calculates the gas mileage (i.e. miles per gallon) of any car.

Override the to_s method to create a user friendly print out of your object.

# Inheritance Exercises

Create a superclass called Vehicle for your MyCar class to inherit from and move the behavior that isn't specific to the MyCar class to the superclass. Create a constant in your MyCar class that stores information about the vehicle that makes it different from other types of Vehicles.

Then create a new class called MyTruck that inherits from your superclass that also has a constant defined that separates it from the MyCar class in some way.


Add a class variable to your superclass that can keep track of the number of objects created that inherit from the superclass. Create a method to print out the value of this class variable as well.


Create a module that you can mix in to ONE of your subclasses that describes a behavior unique to that subclass.


Print to the screen your method lookup for the classes that you have created.


Move all of the methods from the MyCar class that also pertain to the MyTruck class into the Vehicle class. Make sure that all of your previous method calls are working when you are finished.


Write a method called age that calls a private method to calculate the age of the vehicle. Make sure the private method is not available from outside of the class. You'll need to use Ruby's built-in Time class to help.


Create a class 'Student' with attributes name and grade. Do NOT make the grade getter public, so joe.grade will raise an error. Create a better_grade_than? method, that you can call like so...

=end

module Winchable
  def use_winch
    "I'm winding the winch!"
  end
end

class Vehicle

  @@no_of_vehicles_made = 0

  attr_accessor :color, :speed
  attr_reader :year, :model

  def initialize(year, color, model)
    @year = year
    @color = color
    @model = model
    @speed = 0
    @@no_of_vehicles_made += 1
  end

  def self.display_no_of_vehicles_made
    @@no_of_vehicles_made
  end

  def self.calculate_mileage(miles, gallons)
    puts "The fuel economy for that trip was #{miles / gallons} miles per gallon."
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
  
  def age
    "The age of this #{model.capitalize} is #{calculate_vehicle_age} years old."
  end

  private

  def calculate_vehicle_age
    Time.now.year - year
  end
end

class MyTruck < Vehicle
  include Winchable

  NO_OF_DOORS = 2

  def to_s
    "This is a #{year} #{color} #{model} truck."
  end
end

class MyCar < Vehicle
  NO_OF_DOORS = 4

  def to_s
    "This is a #{year} #{color} #{model} car."
  end
end

# Classes & Objects I Exercises

# skoda = MyCar.new(2015, "silver", "octavia")

# puts skoda.speed_up(55) # => Dashboard message: 55 mph

# puts skoda.brake(5) # => Dashboard message: 55 mph

# puts skoda.shut_off # => Dashboard message: Engine off. 0 mph

# puts skoda.spray_paint("yellow") # => The Octavia is now a nice shiny YELLOW color!

# Classes & Objects II Exercises

# puts MyCar.calculate_mileage(100, 5) # => The fuel economy for that trip was 20 miles per gallon.

# puts skoda # => This is a 2015 yellow octavia. 

# Inheritance Exercises

skoda = MyCar.new(2015, "silver", "octavia")
scania = MyTruck.new(2010, "white", "trucky")

puts skoda, scania
# => This is a 2015 silver octavia car.
# => This is a 2010 white trucky truck.

puts Vehicle.display_no_of_vehicles_made # => 2

puts scania.use_winch # => I'm winding the winch!

puts MyTruck.ancestors
# => MyTruck
# => Winchable
# => Vehicle
# => Object
# => Kernel
# => BasicObject

puts MyCar::NO_OF_DOORS   # => 4
puts MyTruck::NO_OF_DOORS # => 2

puts skoda.age  # => The age of this Octavia is 9 years old.
puts scania.age # => The age of this Trucky is 14 years old.
