=begin
Nobility
Now that we have a Walkable module, we are given a new challenge. Apparently some of our users are nobility, and the regular way of walking simply isn't good enough. Nobility need to strut.

We need a new class Noble that shows the title and name when walk is called:

byron = Noble.new("Byron", "Lord")
byron.walk
# => "Lord Byron struts forward"

We must have access to both name and title because they are needed for other purposes that we aren't showing here.

byron.name
=> "Byron"
byron.title
=> "Lord"

=end

module Walkable
  def walk
    "#{name} #{gait} forward"
  end
end

class Person
  include Walkable
  
  attr_reader :name

  def initialize(name)
    @name = name
  end

  private

  def gait
    "strolls"
  end
end

class Noble
  include Walkable
  
  
  
  attr_accessor :name, :title
  
  def initialize(name, title)
    @name = name
    @title = title
  end
  
  def walk
    title + " " + super
  end
  
  private

  def gait
    "struts"
  end
  
end

mike = Person.new("Mike")
puts mike.walk
# => "Mike strolls forward"

byron = Noble.new("Byron", "Lord")
puts byron.walk
# => "Lord Byron struts forward"

puts byron.name
# => "Byron"
puts byron.title
# => "Lord"