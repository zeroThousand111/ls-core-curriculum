=begin
The unusual data (your puzzle input) consists of many reports, one report per line. Each report is a list of numbers called levels that are separated by spaces. For example:

7 6 4 2 1
1 2 7 8 9
9 7 6 2 1
1 3 2 4 5
8 6 4 4 1
1 3 6 7 9
This example data contains six reports each containing five levels.

The engineers are trying to figure out which reports are safe. The Red-Nosed reactor safety systems can only tolerate levels that are either gradually increasing or gradually decreasing. So, a report only counts as safe if both of the following are true:

The levels are either all increasing or all decreasing.
Any two adjacent levels differ by at least one and at most three.
In the example above, the reports can be found safe or unsafe by checking those rules:

7 6 4 2 1: Safe because the levels are all decreasing by 1 or 2.
1 2 7 8 9: Unsafe because 2 7 is an increase of 5.
9 7 6 2 1: Unsafe because 6 2 is a decrease of 4.
1 3 2 4 5: Unsafe because 1 3 is increasing but 3 2 is decreasing.
8 6 4 4 1: Unsafe because 4 4 is neither an increase or a decrease.
1 3 6 7 9: Safe because the levels are all increasing by 1, 2, or 3.
So, in this example, 2 reports are safe.

Analyze the unusual data from the engineers. How many reports are safe?

# UNDERSTAND THE PROBLEM
## INPUT

A text file containing 1000 lines of integers, separated by spaces
Each line has 6-8 integers

### TERMINOLOGY USED BY THE QUESTION
  - A "report" is one line of integers;
  - "Levels" are the integer values on each line;
  - "Safe" means the line of integers passes the two tests set, "unsafe" means that line doesn't;
  - The tests are based on the attributes of the lines of integers:
    1 - that each integer is of lower value than the previous, reading left to right OR that each each integer is of higher value than the previous
    2 - that the difference in value between the integers is at least one and no more than 3

## OUTPUT

An Integer.  The number of "reports" that are "safe", in other words, the number of lines of integers that pass the two tests

## RULES
### EXPLICIT REQUIREMENTS
  - 
### IMPLICIT REQUIREMENTS
  - 

# EXAMPLES & TEST CASES

7 6 4 2 1: Safe because the levels are all decreasing by 1 or 2.
1 2 7 8 9: Unsafe because 2 7 is an increase of 5.
9 7 6 2 1: Unsafe because 6 2 is a decrease of 4.
1 3 2 4 5: Unsafe because 1 3 is increasing but 3 2 is decreasing.
8 6 4 4 1: Unsafe because 4 4 is neither an increase or a decrease.
1 3 6 7 9: Safe because the levels are all increasing by 1, 2, or 3.
So, in this example, 2 reports are safe.

# DATA STRUCTURES

How do I want to structure the 

# ALGORITHM
- INITIALISE a count variable with the value 0
- Move through each line of integers from first to last
  - use #each_line
- increment the count value for each report IF all the Integers are descending in value or ascending in value AND the difference between each integer is not more than 3


=end
require 'pry'
require 'pry-byebug'

# combined method to return true if levels are all ascending or all descending

def safe_change?(array)
  array == array.sort.reverse || array == array.sort
end

# method to check that the difference between levels isn't more than three

def safe_difference?(array)
  1.upto(array.length - 1) do |index|
    difference = (array[index] - array[index - 1]).abs
    return false if difference < 1 || difference > 3
  end
  true
end

# read txt file line by line and transform each line into an array of Integers
# increment `safe_reports` by 1 if each report passes two tests

safe_reports = 0

input = File.open("02_12_input.txt")
input.each_line do |report|
  array = report.split(" ").map(&:to_i)
  if safe_change?(array) && safe_difference?(array)
    safe_reports += 1
  end
  # binding.pry
end

# output total of safe reports

puts safe_reports # should be less than 1000 total reports 560 is too high