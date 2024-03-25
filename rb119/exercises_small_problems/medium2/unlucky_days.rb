=begin
______________________________________________________________________________
*****Understand the PROBLEM*****
______________________________________________________________________________
THE PROBLEM:
Write a method that returns the number of Friday the 13ths in the year given by an argument. You may assume that the year is greater than 1752 (when the United Kingdom adopted the modern Gregorian Calendar) and that it will remain in use for the foreseeable future.

Further Exploration
An interesting variation on this problem is to count the number of months that have five Fridays. This one is harder than it sounds since you must account for leap years.

HINTs
  - Ruby's Date class may be helpful here.
  - Look at how to initialize a Date object
  - Look at the friday? method

INPUT: An Integer (the year)

OUTPUT: An Integer (frequency of Friday 13ths that year)

RULES
EXPLICIT REQUIREMENTS:
  - assume that the input value is greater than 1752
  -
  -
  
IMPLICIT REQUIREMENTS:
  - probably need to use Ruby's Date class
  - there are only 12 13th dates in any year
  - the task is to find out how many 13ths are also Fridays

______________________________________________________________________________
*****EXAMPLES/TEST CASES*****
______________________________________________________________________________

friday_13th(2015) == 3
friday_13th(1986) == 1
friday_13th(2019) == 2

______________________________________________________________________________
*****DATA STRUCTURES*****
______________________________________________________________________________

______________________________________________________________________________
*****ALGORITHM*****
______________________________________________________________________________
1. Requirement — The important, generalized steps required to navigate from the input to the desired output.
  a. Approach — The process that will be utilized to accomplish each Requirement.
    i. Procedure — Specific details to implement the Approach.


1.Create a Date of 13/01 of the year to be investigated.  Create count variable with value of 0
  a.
    i.
2.IS 13/01 a Friday?  If yes, increment count value by 1
  a.
    i.
3.Move fowards one month to 13/02
  a.
    i.
4.
  a.
    i.
5.
  a.
    i.
______________________________________________________________________________

Now CODE with intent!
=end

require 'pry'
require 'pry-byebug'
require 'date'

# solution 1 - 

def friday_13th(year)
  count = 0
  date = Date.new(year, 01, 13)
  month = 1
  
  loop do 
    count += 1 if date.friday?
    month += 1
    date = date.next_month
    break if month == 13
  end
  count
end
# -------------------

# solution 2 - using #times to control iteration count

def friday_13th(year)
  count = 0
  date = Date.new(year, 01, 13)
  
  12.times do
    count += 1 if date.friday?
    date = date.next_month
  end
  
  count
end

# -------------------

# solution 3 - FURTHER EXPLORATION - 5 FRIDAYS

# algorithm
=begin
1. CREATE 1st January of the argument year
2. DETERMINE if this year is a leap year
3. MOVE through every day of January
  a. Is today a Friday?  If yes, increment COUNT += 1
  b. STOP when next day is a different month (month + 1)
4. OUTPUT name of month if it has 5 fridays
5. REPEAT for February, etc
=end

def five_fridays(year)
  
  today = Date.new(year, 01, 01)
  friday_count = 0
  loop do # month loop 
    friday_count = 0
    loop do # daily loop
      friday_count +=1 if today.friday?
      today = today.next
      puts today.month.to_s if friday_count == 5
      break if today.next.month != today.month || friday_count == 5
    end
    break if today.to_s == "#{year}-12-31"
  end
  # friday_count
end

# -------------------

# solution 4 - 

# -------------------

# solution 5 - 

# -------------------

# Print Tests

# Test Cases
# p friday_13th(2015) == 3
# p friday_13th(1986) == 1
# p friday_13th(2019) == 2

# Test Cases = 5 Fridays in a month

p five_fridays(2023) #

