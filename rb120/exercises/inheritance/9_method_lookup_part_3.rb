=begin
Using the following code, determine the lookup path used when invoking bird1.color. Only list the classes or modules that were checked by Ruby when searching for the #color method.

module Flyable
  def fly
    "I'm flying!"
  end
end

class Animal
  attr_reader :color

  def initialize(color)
    @color = color
  end
end

class Cat < Animal
end

class Bird < Animal
  include Flyable
end

bird1 = Bird.new('Red')
bird1.color
=end

module Flyable
  def fly
    "I'm flying!"
  end
end

class Animal
  attr_reader :color

  def initialize(color)
    @color = color
  end
end

class Cat < Animal
end

class Bird < Animal
  include Flyable
end

bird1 = Bird.new('Red')
bird1.color

=begin
It will be Bird, Flyable, Animal in that order
=end

p Bird.ancestors # => [Bird, Flyable, Animal, Object, Kernel, BasicObject]