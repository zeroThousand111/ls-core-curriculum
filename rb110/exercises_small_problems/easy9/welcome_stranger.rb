=begin
______________________________________________________________________________
*****Understand the PROBLEM*****
______________________________________________________________________________
THE PROBLEM:

Create a method that takes 2 arguments, an array and a hash. The array will contain 2 or more elements that, when combined with adjoining spaces, will produce a person's name. The hash will contain two keys, :title and :occupation, and the appropriate values. Your method should return a greeting that uses the person's full name, and mentions the person's title and occupation.

INPUT: An array and a hash

OUTPUT: A string

RULES
EXPLICIT REQUIREMENTS:
  - A method, two parameters;
  - Array will contain 2 or more elements;
  - Hash will contain 2 k-v pairs
  - Return a greeting that uses the person's full name, and mentions the person's title and occupation.
  
IMPLICIT REQUIREMENTS:
  -
  -
  -

______________________________________________________________________________
*****EXAMPLES/TEST CASES*****
______________________________________________________________________________

greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })
=> "Hello, John Q Doe! Nice to have a Master Plumber around."

______________________________________________________________________________
*****DATA STRUCTURES*****
______________________________________________________________________________

______________________________________________________________________________
*****ALGORITHM*****
______________________________________________________________________________

1. Create a string
2. Interpolate the joined up array (with space between each word)
3. Interpolate the hash title
4. Interpolate the hash occupation
5.
______________________________________________________________________________

Now CODE with intent!
=end

# solution 1 - Use string interpolation

# def greetings(array, hash)
#   "Hello #{array.join(' ')}, nice to have a #{hash[:title]} #{hash[:occupation]} around here!"
# end

# solution 2 - Further Exploration - reduce line length for Rubocop

def greetings(array, hash)
  name = array.join(' ')
  title = hash[:title]
  occ = hash[:occupation]
  "Hello #{name}, nice to have a #{title} #{occ} around here!"
end
# Print Tests

# Test Cases
p greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })
#=> "Hello, John Q Doe! Nice to have a Master Plumber around."