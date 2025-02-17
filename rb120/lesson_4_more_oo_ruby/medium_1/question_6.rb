# If we have these two methods in the Computer class:

class Computer
  attr_accessor :template

  def create_template
    @template = "template 14231"
  end

  def show_template
    template
  end
end

class Computer
  attr_accessor :template

  def create_template
    @template = "template 14231"
  end

  def show_template
    self.template
  end
end

# What is the difference in the way the code works?

micro = Computer.new
micro.create_template
puts micro.show_template

# same output from both classes, just invoking the getter method #template in different ways.  The former is more conventional, because `self` shouldn't be used unless it is explicitly needed