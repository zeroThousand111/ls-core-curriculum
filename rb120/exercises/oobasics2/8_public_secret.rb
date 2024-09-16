=begin
Public Secret
Using the following code, create a class named Person with an instance variable named @secret. Use a setter method to add a value to @secret, then use a getter method to print @secret.

person1 = Person.new
person1.secret = 'Shh.. this is a secret!'
puts person1.secret

Expected output:

Shh.. this is a secret!
=end

class Person
  attr_accessor :secret # this creates instant variable, getter and setter!
end

person1 = Person.new
person1.secret = 'Shh.. this is a secret!'
puts person1.secret