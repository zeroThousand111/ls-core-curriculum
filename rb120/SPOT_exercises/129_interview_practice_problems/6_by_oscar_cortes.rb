=begin
# ================================================================

# Without adding any methods below, implement a solution; originally by Natalie Thompson, 
# this version by Oscar Cortes
class ClassA 
  attr_reader :field1, :field2
  
  def initialize(num)
    @field1 = "xyz"
    @field2 = num
  end
end

class ClassB 
  attr_reader :field1

  def initialize
    @field1 = "abc"
  end
end


obj1 = ClassA.new(50)
obj2 = ClassA.new(25)
obj3 = ClassB.new


p obj1 > obj2
p obj2 > obj3

# ========================================================================
=end

# ================================================================

# Without adding any methods below, implement a solution; originally by Natalie Thompson, 
# this version by Oscar Cortes

# I've seen clarification where what is required is both lines to return `true`
class ClassA 
  attr_reader :field1, :field2
  
  def initialize(num)
    @field1 = "xyz"
    @field2 = num
  end
end

class ClassB 
  attr_reader :field1

  def initialize
    @field1 = "abc"
  end
end


obj1 = ClassA.new(50)
obj2 = ClassA.new(25)
obj3 = ClassB.new


p obj1.field2 > obj2.field2 # => true
# compares integer values of @field2 instance variable

p obj2.field1 > obj3.field1 # => true
# compares string values of @field1 instance variable

# ========================================================================