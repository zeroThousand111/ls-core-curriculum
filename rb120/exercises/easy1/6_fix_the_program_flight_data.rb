=begin
Fix the Program - Flight Data
Consider the following class definition:

class Flight
  attr_accessor :database_handle

  def initialize(flight_number)
    @database_handle = Database.init
    @flight_number = flight_number
  end
end

There is nothing technically incorrect about this class, but the definition may lead to problems in the future. How can this class be fixed to be resistant to future problems?

HINT
Consider what might happen if you leave this class defined as it is, and later decide to alter the implementation so that a database is not used.
=end

class Flight
  attr_accessor :database_handle

  def initialize(flight_number)
    @database_handle = Database.init
    @flight_number = flight_number
  end
end

# flight = Flight.new(007)
# puts flight

=begin
what are the problems?
 - I have no idea what the ::init method is or does!
 - Database is an uninitialised class - we don't have the class definition for it yet (apparently this isn't the point of the question!)
 - Encapsulation leak; we've created a getter and setter for `database_handle` which leaves it exposed and accessible.  We might not need this, which may leaad to issues later as the codebase expands.
=end