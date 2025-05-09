require 'date'

# SOLUTION 1 - FIRST DRAFT

# class Meetup
#   attr_reader :month, :year, :last_day_of_the_month

#   # could refactor this to be array of grouped months as keys instead or just delete if using the suggested alt method in Meetup#calc_no_of_days_in_the_month like this:

#   # DAYS_IN_A_MONTH = {
#   #   [2] => 28,
#   #   [4, 6, 9, 11] => 30,
#   #   [1, 3, 5, 7, 8, 10, 12] => 31
#   # }

#   DAYS_IN_A_MONTH = {
#     1 => 31,
#     2 => 28,
#     3 => 31,
#     4 => 30,
#     5 => 31,
#     6 => 30,
#     7 => 31,
#     8 => 31,
#     9 => 30,
#     10 => 31,
#     11 => 30,
#     12 => 31
#   }

#   def initialize(year, month)
#     @month = month
#     @year = year
#     @last_day_of_the_month = calc_no_of_days_in_the_month
#   end

#   def day(weekday, descriptor)
#     weekday = weekday.downcase
#     descriptor = descriptor.downcase
    
#     if descriptor == "last"
#       date = search_date_range_for_last_date(weekday, descriptor) # returns a Date object
#     else
#       date = search_date_range_for_first_date(weekday, descriptor) # returns a Date object
#     end
    
#     date
#   end

#   private

#   def calc_no_of_days_in_the_month
#     # long-winded method
#     days = DAYS_IN_A_MONTH[@month]
#     # if using the array of months keys method
#     # days = DAYS_IN_A_MONTH.select { |k,v| k.include?(@month) }.values.first 
    
#     if Date.gregorian_leap?(@year) && @month == 2
#       days += 1
#     end

#     days

#     # alternative method
#     # Date.new(@year, @month, -1).day
#   end

#   def search_date_range_for_first_date(weekday, descriptor)
#     array_of_date_objects = generate_range_of_dates(descriptor)

#     array_of_date_objects.each do |date_object|
#       case weekday
#       when "monday" then return date_object if date_object.monday?
#       when "tuesday" then return date_object if date_object.tuesday?
#       when "wednesday" then return date_object if date_object.wednesday?
#       when "thursday" then return date_object if date_object.thursday?
#       when "friday" then return date_object if date_object.friday?
#       when "saturday" then return date_object if date_object.saturday?
#       when "sunday" then return date_object if date_object.sunday?
#       end
#     end

#     puts "Sorry - failed to find a matching date for the #{descriptor} #{weekday} of the month" # could move this to Meetup#day method
#   end

#   def search_date_range_for_last_date(weekday, descriptor)
#     array_of_date_objects = generate_range_of_dates(descriptor).reverse

#     array_of_date_objects.each do |date_object|
#       case weekday
#       when "monday" then return date_object if date_object.monday?
#       when "tuesday" then return date_object if date_object.tuesday?
#       when "wednesday" then return date_object if date_object.wednesday?
#       when "thursday" then return date_object if date_object.thursday?
#       when "friday" then return date_object if date_object.friday?
#       when "saturday" then return date_object if date_object.saturday?
#       when "sunday" then return date_object if date_object.sunday?
#       end
#     end

#     puts "Sorry - failed to find a matching date for the #{descriptor} #{weekday} of the month" # could move this to Meetup#day method
#   end

#   def generate_range_of_dates(descriptor)
#     # if using a Range as the value
#     # dowm = {
#     #   "first" => (1..7),
#     #   "second" => (8..14),
#     #   "third" => (15..21),
#     #   "fourth" => (22..28),
#     #   "fifth" => (29..@last_day_of_the_month),
#     #   "teenth" => (13..19),
#     #   "last" => (22..@last_day_of_the_month)
#     # }

#     dowm = {
#     "first" => [1, 7],
#     "second" => [8, 14],
#     "third" => [15, 21],
#     "fourth" => [22, 28],
#     "fifth" => [29, @last_day_of_the_month],
#     "teenth" => [13, 19],
#     "last" => [(@last_day_of_the_month - 7), @last_day_of_the_month] # can't be a constant, because its different for different lengthed months!
#     }

#     array = []
#     first_day_no, last_day_no = dowm[descriptor] # could make this use a range value from DOWM instead
#     first_day_no.upto(last_day_no) do |day_no|
#       array << Date.new(@year, @month, day_no)
#     end
#     array
#   end
# end

# SOLUTION 2 - SECOND DRAFT - REFACTOR

# class Meetup
#   attr_reader :month, :year, :last_day_of_the_month

#   def initialize(year, month)
#     @month = month
#     @year = year
#     @last_day_of_the_month = Date.new(@year, @month, -1).day
#   end

#   def day(weekday, descriptor)
#     weekday = weekday.downcase
#     descriptor = descriptor.downcase

#     array_of_date_objects = generate_range_of_dates(descriptor)
#     array_of_date_objects.reverse! if descriptor == "last"

#     date = search_date_range_for_date(weekday, descriptor, array_of_date_objects)

#     failed_to_find(descriptor, weekday) if date.nil? 
    
#     date
#   end

#   private

#   def failed_to_find(descriptor, weekday)
#     puts "There is no matching date for the #{descriptor} #{weekday} of the month in #{@month}/#{@year}" 
#   end

#   def search_date_range_for_date(weekday, descriptor, array_of_date_objects)
#     array_of_date_objects.each do |date_object|
#       case weekday
#       when "monday" then return date_object if date_object.monday?
#       when "tuesday" then return date_object if date_object.tuesday?
#       when "wednesday" then return date_object if date_object.wednesday?
#       when "thursday" then return date_object if date_object.thursday?
#       when "friday" then return date_object if date_object.friday?
#       when "saturday" then return date_object if date_object.saturday?
#       when "sunday" then return date_object if date_object.sunday?
#       end
#     end
#     nil
#   end

#   def generate_range_of_dates(descriptor)
#     dowm = {
#       "first" => (1..7),
#       "second" => (8..14),
#       "third" => (15..21),
#       "fourth" => (22..28),
#       "fifth" => (29..@last_day_of_the_month),
#       "teenth" => (13..19),
#       "last" => (22..@last_day_of_the_month)
#     }

#     array = []
#     range_of_days = dowm[descriptor]

#     range_of_days.each do |day_no|
#       array << Date.new(@year, @month, day_no)
#     end

#     array
#   end
# end

# SOLUTION 3 - THIRD DRAFT - IMPLEMENTING LSBOT'S RECOMMENDATIONS

class Meetup
  attr_reader :month, :year, :last_day_of_the_month

  def initialize(year, month)
    @month = month
    @year = year
    @last_day_of_the_month = Date.new(@year, @month, -1).day
  end

  def day(weekday, descriptor)
    weekday = weekday.downcase
    descriptor = descriptor.downcase

    array_of_date_objects = generate_range_of_dates(descriptor)
    array_of_date_objects.reverse! if descriptor == "last"

    date = search_date_range_for_date(weekday, descriptor, array_of_date_objects)

    failed_to_find(descriptor, weekday) if date.nil? 
    
    date
  end

  private

  def failed_to_find(descriptor, weekday)
    puts "There is no matching date for the #{descriptor} #{weekday} of the month in #{@month}/#{@year}" 
  end

  def search_date_range_for_date(weekday, descriptor, array_of_date_objects)
    weekday_methods = {
    "monday" => :monday?,
    "tuesday" => :tuesday?,
    "wednesday" => :wednesday?,
    "thursday" => :thursday?,
    "friday" => :friday?,
    "saturday" => :saturday?,
    "sunday" => :sunday?
  }

  method_to_call = weekday_methods[weekday]
  array_of_date_objects.find { |date| date.send(method_to_call) }
  end

  def generate_range_of_dates(descriptor)
    dowm = {
      "first" => (1..7),
      "second" => (8..14),
      "third" => (15..21),
      "fourth" => (22..28),
      "fifth" => (29..@last_day_of_the_month),
      "teenth" => (13..19),
      "last" => (22..@last_day_of_the_month)
    }

    array = []
    range_of_days = dowm[descriptor]

    range_of_days.each do |day_no|
      array << Date.new(@year, @month, day_no)
    end

    array
  end
end

# MY TESTS
# object = Meetup.new(2028, 2)
# puts object.last_day_of_the_month

# meetup = Meetup.new(2013, 3)
# p meetup.day('Monday', 'first') == Date.civil(2013, 3, 4)