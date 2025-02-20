=begin
# Problem by Natalie Thompson
class Person
  def initialize(name, job)
      @name = name
  end 
end

roger = Person.new("Roger", "Carpenter")
puts roger

# Add 1 line of code for the person class
# and 1 line of code in the initalize method. 


#Other than that don't change Person.

# Output:
# "My name is Roger and I am a Carpenter"

---

=end


# Problem by Natalie Thompson
class Person
  def initialize(name, job)
      @name = name
      @job = job # requires second instance variable
  end

  def to_s; "My name is #{@name} and I am a #{@job}"; end
end

roger = Person.new("Roger", "Carpenter")
puts roger

# Add 1 line of code for the person class - this means a one line #to_s method!
# and 1 line of code in the initalize method. 


# Other than that don't change Person.

# Output:
# "My name is Roger and I am a Carpenter"