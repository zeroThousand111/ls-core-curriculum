=begin
Fix the Program - Persons
Complete this program so that it produces the expected output:

class Person
  def initialize(first_name, last_name)
    @first_name = first_name.capitalize
    @last_name = last_name.capitalize
  end

  def to_s
    "#{@first_name} #{@last_name}"
  end
end

person = Person.new('john', 'doe')
puts person

person.first_name = 'jane'
person.last_name = 'smith'
puts person

Expected output:

John Doe
Jane Smith

=end

# changing instance variable directly using custom setters (rubyist nonconventional)

class Person
  
  def initialize(first_name, last_name)
    @first_name = first_name.capitalize
    @last_name = last_name.capitalize
  end
  
  def first_name=(n)
    @first_name = n.capitalize
  end
  
  def last_name=(n)
    @last_name = n.capitalize
  end
  

  def to_s
    "#{@first_name} #{@last_name}"
  end
end

person = Person.new('john', 'doe')
puts person

person.first_name = 'jane'
person.last_name = 'smith'
puts person