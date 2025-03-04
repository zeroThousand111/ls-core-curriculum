=begin
There's a dental office called Dental People Inc.  

Within this office, there's 2 oral surgeons, 2 orthodontists, 1 general dentist.

Both general dentists and oral surgeons can pull teeth. Orthodontists cannot pull teeth. 

Orthodontists straighten teeth.

All of these aforementioned specialties are dentists. All dentists graduated from dental school.  

Oral surgeons place implants.

General dentists fill teeth
=end

module Pullable
  def pull_teeth
    "I'm pulling teeth!"
  end
end

class DentalOffice
  
  def initialize
    @people = []
  end

  def add_person(person)
    self.people.push(person)
  end

  def display_people
    puts people
  end

  def check_everyone_qualified
    people.each { |person| person.is_qualified?}
  end

  private
  attr_accessor :people
end

class Dentist
  attr_reader :graduated

  def initialize
    @graduated = true
  end

  def is_qualified?
    if graduated
      puts "Yes, is qualified"
    else
      puts "No, not qualified"
    end
  end
end

class GeneralDentist < Dentist
  include Pullable

  def fill_teeth
    "I'm filling teeth!"
  end
end

class OralSurgeon < Dentist
  include Pullable

  def place_implant
    "I'm placing an implant!"
  end
end

class Orthodontist < Dentist
  def straighten_teeth
    "I'm straightening teeth!"
  end
end

dental_people_inc = DentalOffice.new

oral_surgeon1 = OralSurgeon.new
oral_surgeon2 = OralSurgeon.new

orthodontist1 = Orthodontist.new
orthodontist2 = Orthodontist.new

general_dentist = GeneralDentist.new

dental_people_inc.add_person(oral_surgeon1)
dental_people_inc.add_person(oral_surgeon2)
dental_people_inc.add_person(orthodontist1)
dental_people_inc.add_person(orthodontist2)
dental_people_inc.add_person(general_dentist)

dental_people_inc.display_people

puts general_dentist.pull_teeth
puts oral_surgeon1.pull_teeth
puts orthodontist1.straighten_teeth
puts oral_surgeon1.place_implant
puts general_dentist.fill_teeth

dental_people_inc.check_everyone_qualified
