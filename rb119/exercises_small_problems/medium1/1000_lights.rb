=begin
______________________________________________________________________________
*****Understand the PROBLEM*****
______________________________________________________________________________
THE PROBLEM:

You have a bank of switches before you, numbered from 1 to n. Each switch is connected to exactly one light that is initially off. You walk down the row of switches and toggle every one of them. You go back to the beginning, and on this second pass, you toggle switches 2, 4, 6, and so on. On the third pass, you go back again to the beginning and toggle switches 3, 6, 9, and so on. You repeat this process and keep going until you have been through n repetitions.

Write a method that takes one argument, the total number of switches, and returns an Array that identifies which lights are on after n repetitions.

Example with n = 5 lights:

round 1: every light is turned on
round 2: lights 2 and 4 are now off; 1, 3, 5 are on
round 3: lights 2, 3, and 4 are now off; 1 and 5 are on
round 4: lights 2 and 3 are now off; 1, 4, and 5 are on
round 5: lights 2, 3, and 5 are now off; 1 and 4 are on
The result is that 2 lights are left on, lights 1 and 4. The return value is [1, 4].

With 10 lights, 3 lights are left on: lights 1, 4, and 9. The return value is [1, 4, 9].

INPUT: An Integer, representing the number of lights

OUTPUT:

RULES
EXPLICIT REQUIREMENTS:
  - 
  -
  -
  
IMPLICIT REQUIREMENTS:
  -
  -
  -

______________________________________________________________________________
*****EXAMPLES/TEST CASES*****
______________________________________________________________________________

p lights(5) == [1, 4]
p lights(10) == [1, 4, 9]

______________________________________________________________________________
*****DATA STRUCTURES*****
______________________________________________________________________________
Hashes and arrays
______________________________________________________________________________
*****ALGORITHM*****
______________________________________________________________________________
1. Requirement — The important, generalized steps required to navigate from the input to the desired output.
  a. Approach — The process that will be utilized to accomplish each Requirement.
    i. Procedure — Specific details to implement the Approach.


1.CREATE a Hash representing a bank of lights
  a.Keys are light number as Integer
  b.Values are boolean true or false
  c.Number of keys in the hash are equal to input Integer, n
  d.At start, all values of key are set to false i.e. off
  e.Create Array then Hash with #each_with_object?
    i.array_of_keys = (1..n).to_a
    ii. lights = array_of_keys.each_with_object({}) { |element, hash| hash[element = false] }
2.MAKE n passes along the bank of lights
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

# solution 1 - using two nested simple loops

# def switch(bank_of_lights, light_id)
#   bank_of_lights[light_id] != bank_of_lights[light_id]
# end

def lights(n)
  array_of_keys = (1..n).to_a
  bank_of_lights = array_of_keys.each_with_object({}) { |element, hash| hash[element] = false }
  
  round = 1
  loop do
    light_id = 1
    loop do
      if light_id % round == 0
        bank_of_lights[light_id] = !bank_of_lights[light_id]
      end
      light_id +=1
      break if light_id == n
    end
    round += 1
    break if round == n
  end
  bank_of_lights.select { |key, value| value == true }.keys
end


# -------------------

# solution 2 - Using #upto nested

def lights(n)
  array_of_keys = (1..n).to_a
  bank_of_lights = array_of_keys.each_with_object({}) { |element, hash| hash[element] = false }
  
  1.upto(n) do |round|
    1.upto(n) do |light_id|
      if light_id % round == 0
        bank_of_lights[light_id] = !bank_of_lights[light_id]
      end
    end
  end

  bank_of_lights.select { |key, value| value == true }.keys
end

# -------------------

# solution 3 - 

# -------------------

# solution 4 - 

# -------------------

# solution 5 - 

# -------------------

# Print Tests
p lights(5) # [1, 4]

# Test Cases
p lights(5) == [1, 4]
p lights(10) == [1, 4, 9]
p lights(1000) == [1, 4, 9, 16, 25, 36, 49, 64, 81, 100, 121, 144, 169, 196, 225, 256, 289, 324, 361, 400, 441, 484, 529, 576, 625, 676, 729, 784, 841, 900, 961]