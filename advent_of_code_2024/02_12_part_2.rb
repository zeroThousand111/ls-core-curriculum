=begin
--- Part Two ---
The engineers are surprised by the low number of safe reports until they realize they forgot to tell you about the Problem Dampener.

The Problem Dampener is a reactor-mounted module that lets the reactor safety systems tolerate a single bad level in what would otherwise be a safe report. It's like the bad level never happened!

Now, the same rules apply as before, except if removing a single level from an unsafe report would make it safe, the report instead counts as safe.

More of the above example's reports are now safe:

7 6 4 2 1: Safe without removing any level.
1 2 7 8 9: Unsafe regardless of which level is removed.
9 7 6 2 1: Unsafe regardless of which level is removed.
1 3 2 4 5: Safe by removing the second level, 3.
8 6 4 4 1: Safe by removing the third level, 4.
1 3 6 7 9: Safe without removing any level.
Thanks to the Problem Dampener, 4 reports are actually safe!

Update your analysis by handling situations where the Problem Dampener can remove a single level from unsafe reports. How many reports are now safe?
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
# increment `safe_reports` by 1 if JUST ONE subarray of a report array passes two tests

safe_reports = 0

input = File.open("02_12_input.txt")
input.each_line do |report|
  array = report.split(" ").map(&:to_i)
  array.combination(array.size - 1) do |subarray|
    if safe_change?(subarray) && safe_difference?(subarray)
      safe_reports += 1
      break
    end
  end
  # binding.pry
end

# output total of safe reports

puts safe_reports # should be more than 534 but less than 1000 total reports
# 800 is too high
# 577