=begin
As seen in the previous exercise, the time of day can be represented as the number of minutes before or after midnight. If the number of minutes is positive, the time is after midnight. If the number of minutes is negative, the time is before midnight.

Write two methods that each take a time of day in 24 hour format, and return the number of minutes before and after midnight, respectively. Both methods should return a value in the range 0..1439.

You may not use ruby's Date and Time methods.

Disregard Daylight Savings and Standard Time and other irregularities.

# UNDERSTAND THE PROBLEM


## Inputs: a string "hh:mm"
## Output: an integer (between 0 and 1439)
## Rules
### Explicit Requirements
  - write TWO methods
    - after_midnight
    - before_midnight
  - TRANSFORM a numerical (chronological?) string from the 'hh:mm' format into an integer between 0 and 1439
    + after_midnight
      - hours are multiplied by 60 and added to total
      - minutes are added directly to total
      - 0 plus total = returned value
    + before_midnight
      - hours are multiplied by 60 and added to total
      - minutes are added directly to total
      - 1440 - total = returned value
  - Disregard Daylight Savings and Standard Time and other irregularities.
### Implicit Requirements
  - a time of 00:00 or 24:00 are the same thing, for the purposes of this problem
  - one 24 hour period is 1440 minutes
  - chronological string input is written in 24 hour format (not 12 hour format)

# TEST CASES/EXAMPLES

after_midnight('00:00') == 0
before_midnight('00:00') == 0
after_midnight('12:34') == 754
before_midnight('12:34') == 686
after_midnight('24:00') == 0
before_midnight('24:00') == 0
Yes, we know that 24:00 isn't a valid time in 24-hour format. Humor us, though; it makes the problem more interesting.

# DATA STRUCTURES
Data is in the form of chronological strings and integers.
An array might be used in an intermediary step.

# ALGORITHM
* SPLIT chronological string hh:mm into an array of two numerical strings and assign to two local variables
  + local variables
    - hours
    - minutes
  + use String#split(:)
    - array = input.split(:)
* TRANSFORM numerical strings into integers
  + Use String#to_i
* CALCULATE minutes PAST 
  + hours are multiplied by 60 and added to total
  + minutes are added directly to total
    - total_minutes = (hours * 60) + minutes
  + if total_minutes => 1440, reduce total by 1440
  + after_midnight minutes are the total
* CALCULATE minutes BEFORE 
  + hours are multiplied by 60 and added to total
  + minutes are added directly to total
    - total_minutes = (hours * 60) + minutes
  + IF total is 0 or 1440, return 0 
  + ELSE before_midnight minutes are 1440 - total
* RETURN the result


=end

def after_midnight(string)
  array = string.split(':')
  hours = array.first.to_i
  minutes = array.last.to_i
  total = (hours * 60) + minutes
  total -= 1440 if total >= 1440
  total
end

def before_midnight(string)
  array = string.split(':')
  hours = array.first.to_i
  minutes = array.last.to_i
  total = (hours * 60) + minutes
  return 0 if total == 0 || total == 1440
  1440 - total
end

p after_midnight('00:00') == 0
p before_midnight('00:00') == 0
p after_midnight('12:34') == 754
p before_midnight('12:34') == 686
p after_midnight('24:00') == 0
p before_midnight('24:00') == 0

# p before_midnight('23:59') == 1