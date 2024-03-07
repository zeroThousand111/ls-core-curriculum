=begin
______________________________________________________________________________
*****Understand the PROBLEM*****
______________________________________________________________________________
THE PROBLEM:

Create a method that takes 2 arguments, an array and a hash. The array will contain 2 or more elements that, when combined with adjoining spaces, will produce a person's name. The hash will contain two keys, :title and :occupation, and the appropriate values. Your method should return a greeting that uses the person's full name, and mentions the person's title and occupation.

INPUT: one array and one hash

OUTPUT:

RULES
EXPLICIT REQUIREMENTS:
  - array contains two or more elements (a name)
  - hash is { title: 'something', occupation: 'something' }
  -
  
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
1. Requirement — The important, generalized steps required to navigate from the input to the desired output.
  a. Approach — The process that will be utilized to accomplish each Requirement.
    i. Procedure — Specific details to implement the Approach.


1.
  a.
    i.
2.
  a.
    i.
3.
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

# solution 1 - also avoids rubocop line length offence

def greetings(array, hash)
  name = array.join(' ')
  title = hash[:title]
  occupation = hash[:occupation]
  "Hello, #{name}! Nice to have a #{title} #{occupation} around."
end

# -------------------

# solution 2 - refactored to one line

def greetings(array, hash)
  "Hello, #{array.join(' ')}! Nice to have a #{hash[:title]} #{hash[:occupation]} around."
end

# -------------------



# -------------------

# solution 4 - 

# -------------------

# solution 5 - 

# -------------------

# Print Tests

# Test Cases
p greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })
#=> "Hello, John Q Doe! Nice to have a Master Plumber around."