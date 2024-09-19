=begin
Avoid Mutation
The following code is flawed. It currently allows @name to be modified from outside the method via a destructive method call. Fix the code so that it returns a copy of @name instead of a reference to it.

class Person
  attr_reader :name

  def initialize(name)
    @name = name
  end
end

person1 = Person.new('James')
person1.name.reverse!
puts person1.name

Expected output:

James

=end

class Person
  # attr_reader :name

  def initialize(name)
    @name = name
  end
  
  def name
    @name.dup # reference to duplicate string, not @name itself
  end
end

person1 = Person.new('James')
person1.name.reverse!
puts person1.name
