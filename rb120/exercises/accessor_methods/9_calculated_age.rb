=begin
Using the following code, multiply @age by 2 upon assignment, then multiply @age by 2 again when @age is returned by the getter method.

class Person
end

person1 = Person.new
person1.age = 20
puts person1.age

Expected output:

80
=end

# straightforward solution 

class Person
  
  # custom getter
  def age
    @age * 2 
  end
  
  # custom setter
  def age=(age)
    @age = age * 2
  end
  
end

# other more DRY solution

class Person
  def age=(age)
    @age = double(age)
  end

  def age
    double(@age)
  end

  private

  def double(value)
    value * 2
  end
end

person1 = Person.new
person1.age = 20
puts person1.age