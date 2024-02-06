=begin
______________________________________________________________________________
*****Understand the PROBLEM*****
______________________________________________________________________________
THE PROBLEM:

In the easy exercises, we worked on a problem where we had to count the number of uppercase and lowercase characters, as well as characters that were neither of those two. Now we want to go one step further.

Write a method that takes a string, and then returns a hash that contains 3 entries: one represents the percentage of characters in the string that are lowercase letters, one the percentage of characters that are uppercase letters, and one the percentage of characters that are neither.

You may assume that the string will always contain at least one character.

INPUT: A String

OUTPUT: A Hash

RULES
EXPLICIT REQUIREMENTS:
  - You may assume that the string will always contain at least one character.
  -
  -
  
IMPLICIT REQUIREMENTS:
  -
  -
  -

______________________________________________________________________________
*****EXAMPLES/TEST CASES*****
______________________________________________________________________________



______________________________________________________________________________
*****DATA STRUCTURES*****
______________________________________________________________________________
Hashes and Arrays
______________________________________________________________________________
*****ALGORITHM*****
______________________________________________________________________________

1.Create an empty hash for count tally {:uppercase => 0, :lowercase => 0, :neither => 0}
2.Create another empty hash for percentages {:uppercase => 0.0, :lowercase => 0.0, :neither => 0.0}
2.Count uppercase characters and replace value for :uppercase in tally Hash
3.Count lowercase characters and replace value for :lowercase in tally Hash
4.Count neither characters and replace value for :neither in tally Hash
5.Count total number of characters in string
6.Calculate percentage for each key in tally Hash and replace value in percentage Hash
7.Return percentage Hash
______________________________________________________________________________

Now CODE with intent!
=end

# solution 1 - Using a simple loop through the string characters

# def letter_percentages(string)
#   tally = {:lowercase => 0, :uppercase => 0, :neither => 0}
#   percentage = {}
  
#   # count characters
#   counter = 0
#   loop do
#     if string[counter].count('a-z') == 1
#       tally[:lowercase] += 1
#     elsif string[counter].count('A-Z') == 1
#       tally[:uppercase] += 1
#     else
#       tally[:neither] += 1
#     end
    
#     counter += 1
#     break if counter == string.size
#   end
  
#   # calculate percentages
#   percentage[:lowercase] = (tally[:lowercase].to_f / string.size) * 100
#   percentage[:uppercase] = (tally[:uppercase].to_f / string.size) * 100
#   percentage[:neither] = (tally[:neither].to_f / string.size) * 100

#   percentage
# end

# -------------------

# solution 2 - Using Array#each on an array of characters

def calculate_percentage(percentage, tally, string_size, hash_key)
  percentage[hash_key] = (tally[hash_key].to_f / string_size) * 100
end

def letter_percentages(string)
  tally = {:lowercase => 0, :uppercase => 0, :neither => 0}
  percentage = {}
  string_size = string.size
  
  # split array of characters and count characters
  string.chars.each do |char|
    if char.count('a-z') == 1
      tally[:lowercase] += 1
    elsif char.count('A-Z') == 1
      tally[:uppercase] += 1
    else
      tally[:neither] += 1
    end
  end

  # calculate percentages and fill percentage hash
  calculate_percentage(percentage, tally, string_size, :lowercase)
  calculate_percentage(percentage, tally, string_size, :uppercase)
  calculate_percentage(percentage, tally, string_size, :neither)

  percentage
end

# -------------------

# Print Tests
p letter_percentages('abCdef 123') # { lowercase: 50.0, uppercase: 10.0, neither: 40.0 }

# Test Cases
p letter_percentages('abCdef 123') == { lowercase: 50.0, uppercase: 10.0, neither: 40.0 }
p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25.0 }
p letter_percentages('123') == { lowercase: 0.0, uppercase: 0.0, neither: 100.0 }