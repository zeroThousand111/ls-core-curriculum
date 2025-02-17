=begin
Ben and Alyssa are working on a vehicle management system. So far, they have created classes called Auto and Motorcycle to represent automobiles and motorcycles. After having noticed common information and calculations they were performing for each type of vehicle, they decided to break out the commonality into a separate class called WheeledVehicle. This is what their code looks like so far:
=end

module Rangeable
  attr_accessor :speed, :heading
  attr_reader :fuel_capacity, :fuel_efficiency
  
  SEACRAFT_CLASSES = ["SeaCraft", "Catamaran", "Motorboat"]

  def range
    range = nil
    SEACRAFT_CLASSES.each do |type|
      if self.class == type 
        range = (fuel_capacity * fuel_efficiency) + 10
      else
        range = (fuel_capacity * fuel_efficiency) + 10
      end
    end
    range
  end
end

class WheeledVehicle
  include Rangeable

  def initialize(tire_array, km_traveled_per_liter, liters_of_fuel_capacity)
    @tires = tire_array
    @fuel_efficiency = km_traveled_per_liter
    @fuel_capacity = liters_of_fuel_capacity
  end

  def tire_pressure(tire_index)
    @tires[tire_index]
  end

  def inflate_tire(tire_index, pressure)
    @tires[tire_index] = pressure
  end
end

class Auto < WheeledVehicle
  def initialize
    # 4 tires are various tire pressures
    super([30,30,32,32], 50, 25.0)
  end
end

class Motorcycle < WheeledVehicle
  def initialize
    # 2 tires are various tire pressures
    super([20,20], 80, 8.0)
  end
end


# Now Alan has asked them to incorporate a new type of vehicle into their system - a Catamaran defined as follows:

class SeaCraft
  include Rangeable

  attr_reader :num_propellers, :num_hulls

  def initialize(num_propellers, num_hulls, km_traveled_per_liter, liters_of_fuel_capacity)
    @num_propellers = num_propellers
    @num_hulls = num_hulls
    @fuel_efficiency = km_traveled_per_liter
    @fuel_capacity = liters_of_fuel_capacity
  end
end

class Catamaran < SeaCraft
end

class Motorboat < SeaCraft
  def initialize(num_propellers, num_hulls, km_traveled_per_liter, liters_of_fuel_capacity)
    super(1, 1, km_traveled_per_liter, liters_of_fuel_capacity)
  end
end

=begin
This new class does not fit well with the object hierarchy defined so far. Catamarans don't have tires. But we still want common code to track fuel efficiency and range. Modify the class definitions and move code into a Module, as necessary, to share code among the Catamaran and the wheeled vehicles.
=end

cat = Catamaran.new(2, 2, 100, 500)
puts cat.range

=begin
Building on the prior vehicles question, we now must also track a basic motorboat. A motorboat has a single propeller and hull, but otherwise behaves similar to a catamaran. Therefore, creators of Motorboat instances don't need to specify number of hulls or propellers. How would you modify the vehicles code to incorporate a new Motorboat class?
=end