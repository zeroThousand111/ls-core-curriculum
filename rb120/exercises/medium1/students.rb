=begin
Below we have 3 classes: Student, Graduate, and Undergraduate. The implementation details for the #initialize methods in Graduate and Undergraduate are missing. Fill in those missing details so that the following requirements are fulfilled:

Graduate students have the option to use on-campus parking, while Undergraduate students do not.

Graduate and Undergraduate students both have a name and year associated with them.

Note, you can do this by adding or altering no more than 5 lines of code.
=end

class Student
  def initialize(name, year)
    @name = name
    @year = year
  end
end

class Graduate < Student # add superclass Student - change 1
  def initialize(name, year, parking)
    super(name, year) # add super and pass up @name and @year to superclass #initialize - change 2
    @parking = parking # add new instance variable @parking - change 3
  end
end

class Undergraduate < Student # add superclass Student - change 4
  def initialize(name, year)
    super # add super and pass up @name and @year to superclass #initialize - change 5
  end
end

p Student.new("Rod", 2024)
p Graduate.new("Jane", 2022, true)
p Undergraduate.new("Freddy", 2020)