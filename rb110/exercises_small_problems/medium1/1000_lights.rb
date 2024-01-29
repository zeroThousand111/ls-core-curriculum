=begin
______________________________________________________________________________
*****Understand the PROBLEM*****
______________________________________________________________________________
THE PROBLEM:

You have a bank of switches before you, numbered from 1 to n. Each switch is connected to exactly one light that is initially off. You walk down the row of switches and toggle every one of them. You go back to the beginning, and on this second pass, you toggle switches 2, 4, 6, and so on. On the third pass, you go back again to the beginning and toggle switches 3, 6, 9, and so on. You repeat this process and keep going until you have been through n repetitions.

Write a method that takes one argument, the total number of switches, and returns an Array that identifies which lights are on after n repetitions.

INPUT: An Integer

OUTPUT: An Array of Integers.  Each element represents the number of a light that are lit at the end of the sequence.

RULES
EXPLICIT REQUIREMENTS:
  - Repetitions follow this pattern:
    - Turn lights on whose numbers are divisible by 1 (i.e. all of them);
    - Switch (off) lights on whose numbers are divisible by 2;
    - Switch lights on whose numbers are divisible by 3;
    - Switch lights on whose numbers are divisible by 4;
    - etc
  - Stop the repetitions when you have been through n repetitions
  -
  
IMPLICIT REQUIREMENTS:
  - No negative numbers or zero arguments;
  -
  -

______________________________________________________________________________
*****EXAMPLES/TEST CASES*****
______________________________________________________________________________

Example with n = 5 lights:

round 1: every light is turned on
round 2: lights 2 and 4 are now off; 1, 3, 5 are on
round 3: lights 2, 3, and 4 are now off; 1 and 5 are on
round 4: lights 2 and 3 are now off; 1, 4, and 5 are on
round 5: lights 2, 3, and 5 are now off; 1 and 4 are on
The result is that 2 lights are left on, lights 1 and 4. The return value is [1, 4].

With 10 lights, 3 lights are left on: lights 1, 4, and 9. The return value is [1, 4, 9].

______________________________________________________________________________
*****DATA STRUCTURES*****
______________________________________________________________________________

Hash?  bank_of_lights = {1=>:off, 2=>:off, 3=>:off, etc}

Return is a array of those hash keys that have the value :on after the repetitions of switching

______________________________________________________________________________
*****ALGORITHM*****
______________________________________________________________________________

1. Create a "bank of lights" as a hash {1=>:off, 2=>:off, 3=>:off, etc}
2. Carry out switch processes n times:
  a. "Switch" (a method on the value of each hash key) all keys to :on
  b. "Switch" those keys that are divisible by 2
  c. "Switch" those keys that are divisible by 3;
  d. etc.
  e. Stop switching after n times i.e the number of times that there are lights
3. Create and return an array of hash keys of those keys are ":on"
4. 
5.
______________________________________________________________________________

Now CODE with intent!
=end

require 'pry'
require 'pry-byebug'

# solution 1 - using hash as the data structure and 3 helper methods

def switch_lights!(bank_of_lights, n)
  bank_of_lights.each do | k, v | 
    if k % n == 0
      if v == :on 
        bank_of_lights[k] = :off # hash element (re)assignment
      elsif v == :off
        bank_of_lights[k] = :on
      end
    end
  end
  bank_of_lights
end

def return_array(bank_of_lights)
  bank_of_lights.select { |k, v| v == :on }.keys
end

def create_bank(num)
  bank_of_lights = {}
  num.times do |n|
    bank_of_lights[n + 1] = :off
  end
  bank_of_lights
end

def switch_lights(num)
  bank_of_lights = create_bank(num)
  num.times do | n |
    bank_of_lights = switch_lights!(bank_of_lights, n + 1)
  end
  return_array(bank_of_lights)
end

# -------------------

# solution 2 - Official LS Solution - WOW really similar to mine!

# initialize the lights hash
def initialize_lights(number_of_lights)
  lights = Hash.new
  1.upto(number_of_lights) { |number| lights[number] = "off" }
  lights
end

# return list of light numbers that are on
def on_lights(lights)
  lights.select { |_position, state| state == "on" }.keys
end

# toggle every nth light in lights hash
def toggle_every_nth_light!(lights, nth)
  lights.each do |position, state|
    if position % nth == 0
      lights[position] = (state == "off") ? "on" : "off"
    end
  end
end

# Run entire program for number of lights
def toggle_lights(number_of_lights)
  lights = initialize_lights(number_of_lights)
  1.upto(lights.size) do |iteration_number|
    toggle_every_nth_light!(lights, iteration_number)
  end

  on_lights(lights)
end

p toggle_lights(1000)

# -------------------

# Print Tests
# p switch_lights(5) # [1, 4]

# Test Cases

p switch_lights(5) == [1, 4]
p switch_lights(10) == [1, 4, 9]
p switch_lights(1000) == [1, 4, 9, 16, 25, 36, 49, 64, 81, 100, 121, 144, 169, 196, 225, 256, 289, 324, 361, 400, 441, 484, 529, 576, 625, 676, 729, 784, 841, 900, 961]