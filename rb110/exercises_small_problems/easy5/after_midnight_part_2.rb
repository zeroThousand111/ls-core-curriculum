=begin
As seen in the previous exercise, the time of day can be represented as the number of minutes before or after midnight. If the number of minutes is positive, the time is after midnight. If the number of minutes is negative, the time is before midnight.

Write two methods that each take a time of day in 24 hour format, and return the number of minutes before and after midnight, respectively. Both methods should return a value in the range 0..1439.

You may not use ruby's Date and Time methods.

Examples:

after_midnight('00:00') == 0
before_midnight('00:00') == 0
after_midnight('12:34') == 754
before_midnight('12:34') == 686
after_midnight('24:00') == 0
before_midnight('24:00') == 0

Yes, we know that 24:00 isn't a valid time in 24-hour format. Humor us, though; it makes the problem more interesting.

Disregard Daylight Savings and Standard Time and other irregularities.

----

UNDERSTAND THE PROBLEM
INPUT: a String in the format 'hh:mm'
OUTPUT: an Integer between 0 and 1439
RULES:
EXPLICIT REQUIREMENTS:
 - Cannot use Ruby's Date and Time methods;
 - Both methods should return an Integer between 0 and 1439;
 - For the purposes of this problem, the string inputs '00:00' and '24:00' both mean midnight;
IMPLICIT REQUIREMENTS:
 - 1440 minutes is 24 hours;
 - The two methods are not linked and are invoked deliberately;
 - The input string won't represent a time longer than 1439 minutes
 
----

TEST CASES
after_midnight('00:00') == 0
before_midnight('00:00') == 0
after_midnight('12:34') == 754
before_midnight('12:34') == 686
after_midnight('24:00') == 0
before_midnight('24:00') == 0

----

DATA STRUCTURES:

Strings to Integers?

----

ALGORITHM:

after_midnight

1.Hours
  1a.Convert the first two digits in string to hours Integer;
  1b.Convert the hours Integer into minutes (x60);
  1c.IF hours == 24 then hours = 0
2. Minutes
  2a.Convert the last two digits in the string to a minutes Integer;
3. Sum the minutes Integer to the hours Integer;
4. Return the sum.

before_midnight

1.Hours
  1a.Convert the first two digits in string to hours Integer;
  1b.Convert the hours Integer into minutes (x60);
  1c.IF hours == 24 then hours = 0
2. Minutes
  2a.Convert the last two digits in the string to a minutes Integer;
3. Sum the minutes Integer to the hours Integer;
4. Convert to hours before midnight = 1440 - sum
5. Return the sum.

=end

def after_midnight(string)
  hours = string[0, 2].to_i
  minutes = string[3, 2].to_i
  sum = (hours * 60) + minutes
  return sum == 1440 ? 0 : sum
end

def before_midnight(string)
  hours = string[0, 2].to_i
  minutes = string[3, 2].to_i
  sum = 1440 - ((hours * 60) + minutes)
  return sum == 1440 ? 0 : sum
end

# print tests
# p after_midnight('12:34') # => 754
# p after_midnight('00:00') # => 0
# p after_midnight('24:00') # => 0

# p before_midnight('12:34')  # => 686
# p before_midnight('00:00')  # => 0
# p before_midnight('24:00')  # => 0

# truth tests
p after_midnight('12:34') == 754
p after_midnight('00:00') == 0
p after_midnight('24:00') == 0

p before_midnight('12:34') == 686
p before_midnight('00:00') == 0
p before_midnight('24:00') == 0