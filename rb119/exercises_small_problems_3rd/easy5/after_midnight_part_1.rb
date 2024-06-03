=begin
The time of day can be represented as the number of minutes before or after midnight. If the number of minutes is positive, the time is after midnight. If the number of minutes is negative, the time is before midnight.

Write a method that takes a time using this minute-based format and returns the time of day in 24 hour format (hh:mm). Your method should work with any integer input.

You may not use ruby's Date and Time classes.

# Understand the problem
## Inputs
  - A whole integer, could be positive or negative
## Outputs
  - A string in "hh:mm" format
## Rules
### Explicit Requirements
  - a method
  - should work with any integer input (positive or negative)
  - 
### Implicit Requirements
  - No float inputs
  - some values will be larger than 1440 or -1440 (i.e. greater than 24 hours)
  
# Examples

time_of_day(0) == "00:00"     # input is zero
time_of_day(-3) == "23:57"    # negative input
time_of_day(35) == "00:35"
time_of_day(-1437) == "00:03" 
time_of_day(3000) == "02:00"  # greater than 48 hours
time_of_day(800) == "13:20"
time_of_day(-4231) == "01:29" # greater than 72 hours

# Data Structures
Strings, integers

# Algorithm

* Initialise local variables hours and minutes
  + value of both start at 0 (integer)

* DETERMINE if integer is greater than 1440 or -1440
  + divide input integer by 1440
    - multiple = num / 1440
  + subract additional 24 hours of minutes from input number
    - num = num - (1440 * multiple)

* CALCULATE values of hours and minutes
  + use Integer#divmod method
    - num.divmod(60)

* DETERMINE if integer is postive or negative
  + positive is value > 0
  + negative is value < 0
  + zero is "00:00"


* FORMAT hours and minutes to hh:mm
  + Use Kernel#format
    - format("%.2d:%.2d", hours, minutes)
* RETURN formatted string
=end

def time_of_day(num)
  multiple = num / 1440
  num = num - (1440 * multiple)
  hours, minutes = num.divmod(60)
  if num >= 0
    format('%.2d:%.2d', hours, minutes)
  else 
    format('%.2d:%.2d', (24 - hours), (60-minutes))
  end
end

# Test Cases

p time_of_day(0) == "00:00"
p time_of_day(-3) == "23:57"
p time_of_day(35) == "00:35"
p time_of_day(-1437) == "00:03"
p time_of_day(3000) == "02:00"
p time_of_day(800) == "13:20"
p time_of_day(-4231) == "01:29"

p time_of_day(60) == "01:00"
p time_of_day(61) == "01:01"