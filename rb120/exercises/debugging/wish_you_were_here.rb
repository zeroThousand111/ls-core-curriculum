=begin
On lines 37 and 38 of our code, we can see that grace and ada are located at the same coordinates. So why does line 39 output false? Fix the code to produce the expected output.
=end
class Person
  attr_reader :name
  attr_accessor :location

  def initialize(name)
    @name = name
  end

  def teleport_to(latitude, longitude)
    @location = GeoLocation.new(latitude, longitude)
  end
end

class GeoLocation
  attr_reader :latitude, :longitude

  def initialize(latitude, longitude)
    @latitude = latitude
    @longitude = longitude
  end

  def to_s
    "(#{latitude}, #{longitude})"
  end

  def ==(other_location)
    latitude == other_location.latitude && longitude == other_location.longitude
  end
end

# Example

ada = Person.new('Ada')
ada.location = GeoLocation.new(53.477, -2.236)

grace = Person.new('Grace')
grace.location = GeoLocation.new(-33.89, 151.277)

ada.teleport_to(-33.89, 151.277)

puts ada.location                   # (-33.89, 151.277)
puts grace.location                 # (-33.89, 151.277)
puts ada.location == grace.location # expected: true
                                    # actual: false
# This is an equivalence question.  The issue is that @location is a Geolocation object.  So location1 == location2 = false!  They are not the same object.  We aren't asking that question.  We want == to mean "are these two location objects at the same location i.e. same longitude and latitude" and so we need to write a custom #== method for the Geolocation class.

