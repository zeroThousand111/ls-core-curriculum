class Cat
  def initialize(type)
    @type = type
  end

  def to_s
    "I'm a #{@type} cat"
  end
end


tom = Cat.new("tabby")
puts tom