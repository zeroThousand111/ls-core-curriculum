=begin
# Problem
Create a clock that is independent of date.

You should be able to add minutes to and subtract minutes from the time represented by a given Clock object. Note that you should not mutate Clock objects when adding and subtracting minutes -- create a new Clock object.

Two clock objects that represent the same time should be equal to each other.

You may not use any built-in date or time functionality; just use arithmetic operations.

For our program, the details we need to keep in mind are as follows:

- Our clock objects should track hours and minutes.
- We should be able to add minutes to and subtract minutes from our clock objects.
- If two clock objects have the same time (both hour and minutes), they should be considered equal.
- We may want our clock object to use 24-hour notation rather than 12-hour notation since we only need to track hours and minutes, not the date.

The at class/static method can create a new Clock instance using the Clock constructor. Use a default value of 0 for the minutes if the minute argument is omitted from the call to at.

You will need to override the + and - methods in the Clock class. Both operators take a Clock object operand on the left side of the operator, and a number of minutes to the right.

You need to override the == method in the Clock class so that assert_equal and refute_equal work properly.

You also need to override the to_s method to format the time represented by a Clock object as XX:XX.

## Input:
## Output:
## Rules:
### Explicit requirements
  - Our clock objects should track hours and minutes.
  - We may want our clock object to use 24-hour notation rather than 12-hour notation since we only need to track hours and minutes, not the date.
  - You may not use any built-in date or time functionality; just use arithmetic operations.
  - Two clock objects that represent the same time should be equal to each other.
  - You should be able to add minutes to and subtract minutes from the time represented by a given Clock object.
  - you should not mutate Clock objects when adding and subtracting minutes -- create a new Clock object.

### Implicit requirements
  -
  -

### Requirements Inferred by Tests
  - Clock objects have an attribute that stores the time as a string in the "HH:MM" format
  - 

# Examples/Test Cases

From the test cases shown above, we can see that we need to create a Clock class. The class should have several methods as follows:

- a constructor that accepts two number arguments representing the hour and minutes.
- a class or static method named at that can create and return a new instance of Clock. If the minutes argument is omitted, a default value of 0 will be used.
- a method that returns the clock's current time as a string.
- methods that add and subtract from the current time. These methods accept a number of minutes to add or subtract as an argument.
- a method that compares two clock objects for equality.

We may also want to create some helper methods to assist us, but those are optional.

# Data Structures

The hours and minutes will be represented with numbers, and we will be working with numbers each time we add or subtract from the time.

The method that returns the clock's current time as a string must convert the hour and minutes to a string that is formatted properly: XX:XX.

# Algorithm
* STEP
  + approach
    - procedure

=end

# Code
require 'pry'
require 'pry-byebug'

# SOLUTION 1 - FIRST DRAFT

# class Clock
#   attr_accessor :hours, :minutes

#   def initialize(hours, minutes=0)
#     @hours = hours
#     @minutes = minutes
#   end

#   def self.at(hours, minutes=0)
#     Clock.new(hours, minutes)
#   end

#   def +(time_added)
#     # account for minutes being more than 60
#     hours_added, minutes_added = time_added.divmod(60)
#     total_hours = self.hours + hours_added # deliberately using self to make this readable - its the instance method @hours
#     total_minutes = self.minutes + minutes_added # ditto - its @minutes
    
#     # these calculations below could go in Clock#initialize? or as private method from the same
#     if total_minutes > 59
#       total_minutes -= 60
#       total_hours += 1
#     end

#     if total_hours > 23
#       total_hours -= ((total_hours/24)*24) # 24 or 48 or 72, etc
#     end
    
#     Clock.new((total_hours),(total_minutes))
#   end

#   def -(time_subtracted)
#     hours_subtracted, minutes_subtracted = time_subtracted.divmod(60)

#     total_hours = self.hours - hours_subtracted
#     total_minutes = self.minutes - minutes_subtracted

#     # these calculations below could go in Clock#initialize? or as private method from the same
#     if total_minutes < 0
#       total_minutes += 60
#       total_hours -= 1
#     end

#     if total_hours < 0
#       total_hours += ((total_hours/24).abs*24) # 24 or 48 or 72, etc
#     end

#     Clock.new((total_hours),(total_minutes))
#   end

#   def to_s
#     "#{format('%02d',hours)}:#{format('%02d',minutes)}"
#   end

#   def ==(other)
#     self.hours == other.hours && self.minutes == other.minutes
#   end
# end

# SOLUTION 2 - SECOND DRAFT - REFACTOR

class Clock
  attr_accessor :hours, :minutes

  def initialize(hours, minutes=0)
    @hours = hours
    @minutes = minutes
  end

  def self.at(hours, minutes=0)
    Clock.new(hours, minutes)
  end

  def +(time_added)
    hours_added, minutes_added = time_added.divmod(60)
    total_hours = hours + hours_added
    total_minutes = minutes + minutes_added
    
    if total_minutes > 59
      total_minutes -= 60
      total_hours += 1
    end

    if total_hours > 23
      total_hours %= 24
    end
    
    Clock.new((total_hours),(total_minutes))
  end

  def -(time_subtracted)
    hours_subtracted, minutes_subtracted = time_subtracted.divmod(60)
    total_hours = hours - hours_subtracted
    total_minutes = minutes - minutes_subtracted

    if total_minutes < 0
      total_minutes += 60
      total_hours -= 1
    end

    if total_hours < 0
      total_hours = (total_hours % 24 + 24) % 24
    end

    Clock.new((total_hours),(total_minutes))
  end

  def to_s
    "#{format('%02d',hours)}:#{format('%02d',minutes)}"
  end

  def ==(other)
    self.hours == other.hours && self.minutes == other.minutes
  end
end

# MY TESTS

# time1 = Clock.new(23,1)
# puts time1.hours
# puts time1.minutes
# puts time1
# time2 = Clock.new(23,99)
# puts Clock.at(23, 59).to_s
# puts Clock.at(23).to_s
# old_time = Clock.new(10)
# puts new_time = old_time - 3061