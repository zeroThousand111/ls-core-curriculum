=begin
Unexpected Change
Modify the following code to accept a string containing a first and last name. The name should be split into two instance variables in the setter method, then joined in the getter method to form a full name.

class Person
  attr_accessor :name
end

person1 = Person.new
person1.name = 'John Doe'
puts person1.name

Expected output:
John Doe
=end

class Person
  
  def name 
    @first_name + " " + @last_name
  end
  
  def name=(full_name)
    names = full_name.split
    @first_name = names.first
    @last_name = names.last
  end
  
end

person1 = Person.new
person1.name = 'John Doe'
puts person1.name