=begin
______________________________________________________________________________
*****Understand the PROBLEM*****
______________________________________________________________________________
THE PROBLEM:

Write a method that returns the number of Friday the 13ths in the year given by an argument. You may assume that the year is greater than 1752 (when the United Kingdom adopted the modern Gregorian Calendar) and that it will remain in use for the foreseeable future.

INPUT: An Integer as a date

OUTPUT: An Integer as a multiple

RULES
EXPLICIT REQUIREMENTS:
  - Assume the input will be higher than 1752
  - Assume the same calendar system will be in use forever
  -
  
IMPLICIT REQUIREMENTS:
  - Can be 1, 2 or 3 Friday 13ths in every year https://en.wikipedia.org/wiki/Friday_the_13th
  -
  -

HINTS (and I need them!)
  - Ruby's Date class may be helpful here.
  - Look at how to initialize a Date object
  - Look at the friday? method
______________________________________________________________________________
*****EXAMPLES/TEST CASES*****
______________________________________________________________________________

friday_13th(2015) == 3
friday_13th(1986) == 1
friday_13th(2019) == 2

______________________________________________________________________________
*****DATA STRUCTURES*****
______________________________________________________________________________

Array maybe?

______________________________________________________________________________
*****ALGORITHM*****
______________________________________________________________________________

1.CREATE a tally Integer variable
2.CREATE a starting date of 13th January of input year
3.CHECK if date is a Friday
4.IF date is a Friday, then increment tally variable by 1
5.REPEAT checks and steps 3-4 for 13th Feb, 13th March etc.
______________________________________________________________________________

Now CODE with intent!
=end

require 'date'
# solution 1 - My solution

def friday_13th(year)
  tally = 0
  date_array = []
  date = Date.new(year, 01, 13)
  
  # create arrray of 13th dates
  12.times do
    date_array << date
    date = date.next_month
  end
  
  # check if each date is a Friday and increment tally if it is
  date_array.each do |friday|
    if friday.friday?
        tally += 1
    end
  end
  
  tally
end

# -------------------

# solution 2 - Offical LS solution

# require 'date'

# def friday_13th(year)
#   unlucky_count = 0
#   thirteenth = Date.civil(year, 1, 13)
#   12.times do
#     unlucky_count += 1 if thirteenth.friday?
#     thirteenth = thirteenth.next_month
#   end
#   unlucky_count
# end

# -------------------

# Print Tests
# p friday_13th(2015) # 3
# p friday_13th(1986) # 1
# p friday_13th(2019) # 2

p friday_13th(1982)

# Test Cases
# p friday_13th(2015) == 3
# p friday_13th(1986) == 1
# p friday_13th(2019) == 2

# p friday_13th(2026) == 3
# p friday_13th(2024) == 2