### Preschool (by Natalie Thompson)
=begin
Inside a preschool there are children, teachers, class assistants, a principle, janitors, and cafeteria workers. Both teachers and assistants can help a student with schoolwork and watch them on the playground. A teacher teaches and an assistant helps kids with any bathroom emergencies. Kids themselves can learn and play. A teacher and principle can supervise a class. Only the principle has the ability to expel a kid. Janitors have the ability to clean. Cafeteria workers have the ability to serve food. Children, teachers, class assistants, principles, janitors and cafeteria workers all have the ability to eat lunch.
=end

# My Checklist To Do

# + Inside a preschool there are children, teachers, class assistants, a principle, janitors, and cafeteria workers. 
# + Both teachers and assistants can help a student with schoolwork and watch them on the playground. 
# + A teacher teaches and an assistant helps kids with any bathroom emergencies. 
# + Kids themselves can learn and play. 
# + A teacher and principle can supervise a class. 
# + Only the principle has the ability to expel a kid. 
# + Janitors have the ability to clean. 
# + Cafeteria workers have the ability to serve food. 
# + Children, teachers, class assistants, principles, janitors and cafeteria workers all have the ability to eat lunch.

module Lunchable
  def eat
    "I'm eating lunch!"
  end
end

module Supervisable
  def supervise_class
    "I'm supervising the class!"
  end
end

module Helpable
  def schoolwork_help
    "I'm helping with schoolwork"
  end

  def playground_watch
    "I'm supervising kids in the playground"
  end
end

class Child
  include Lunchable

  def learn
    "I'm learning!"
  end

  def play
    "I'm playing!"
  end
end

class Teacher
  include Lunchable
  include Supervisable
  include Helpable

  def teach
    "I'm teaching!"
  end
end

class ClassAssistant
  include Lunchable
  include Helpable

  def bathroom_emergency
    "I'm cleaning up after an emergency!"
  end
end

class Principle
  include Lunchable
  include Supervisable
 
  def expel
    "I'm expelling a kid!"
  end
end

class Janitor
  include Lunchable

  def clean
    "I'm cleaning!"
  end
end

class CafeteriaWorker
  include Lunchable

  def serve_food
    "I'm serving up food!"
  end
end

# Inside a preschool there are children, teachers, class assistants, a principle, janitors, and cafeteria workers. 

kid = Child.new
teacher = Teacher.new
assistant = ClassAssistant.new
principle = Principle.new
janitor = Janitor.new
server = CafeteriaWorker.new

# Both teachers and assistants can help a student with schoolwork and watch them on the playground. 
puts teacher.schoolwork_help, assistant.schoolwork_help
puts teacher.playground_watch, assistant.playground_watch

# A teacher teaches and an assistant helps kids with any bathroom emergencies. 
puts teacher.teach
puts assistant.bathroom_emergency

# Kids themselves can learn and play.
puts kid.learn, kid.play

# A teacher and principle can supervise a class.
puts teacher.supervise_class, principle.supervise_class

# Only the principle has the ability to expel a kid. 
puts principle.expel

# Janitors have the ability to clean. 
puts janitor.clean

# Cafeteria workers have the ability to serve food. 
puts server.serve_food

# Children, teachers, class assistants, principles, janitors and cafeteria workers all have the ability to eat lunch.

puts kid.eat, teacher.eat, assistant.eat, principle.eat, janitor.eat, server.eat # I'm eating lunch x 6