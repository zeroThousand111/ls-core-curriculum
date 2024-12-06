=begin
Create a class 'Student' with attributes name and grade. Do NOT make the grade getter public, so joe.grade will raise an error. Create a better_grade_than? method, that you can call like so...
=end

class Student
  attr_reader :name

  def initialize(name, grade)
    @name = name
    @grade = grade
  end

  def better_grade_than?(other_student)
    if  self.grade > other_student.grade
      "Well done.  You have a better grade than #{other_student.name}."
    elsif self.grade < other_student.grade
      "Oh dear.  #{other_student.name} has a better grade than you."
    else
      "You have the same grades as #{other_student.name}."
    end
  end

  protected

  attr_reader :grade
end

joe = Student.new("Joe", 6)
bob = Student.new("Bob", 3)
suzi = Student.new("Suzi", 99)
louise = Student.new("Louise", 6)

puts joe.better_grade_than?(bob) # => Well done.  You have a better grade than Bob.
puts joe.better_grade_than?(suzi) # => Oh dear.  Suzi has a better grade than you.
puts joe.better_grade_than?(louise) # => You have the same grades as Louise.
