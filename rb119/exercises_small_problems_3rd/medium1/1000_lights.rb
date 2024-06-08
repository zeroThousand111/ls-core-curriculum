=begin
You have a bank of switches before you, numbered from 1 to n. Each switch is connected to exactly one light that is initially off. You walk down the row of switches and toggle every one of them. You go back to the beginning, and on this second pass, you toggle switches 2, 4, 6, and so on. On the third pass, you go back again to the beginning and toggle switches 3, 6, 9, and so on. You repeat this process and keep going until you have been through n repetitions.

Write a method that takes one argument, the total number of switches, and returns an Array that identifies which lights are on after n repetitions.

# UNDERSTAND THE PROBLEM

## Input: an Integer, n
## Output: an array representing a bank of n lights, that have had n iterations of toggling performed upon them
## Rules
### Explicit Requirements
  - a method
  - one argument, n
  - create a data structure representing a bank of lights containing n number of lights, that are all switched off at the beginning
  - n number of passes of light switching
    - first pass, all lights (1)
    - second pass, every second light i.e. every even light (2)
    - third pass, every third light i.e. where light number (not index) n % 3 == 0
    - fourth pass, every fourth light i.e. where light no n % 4 == 0
    - etc
  - return is an array summarising ONLY which lights are on after n passes of switching
  
### Implicit Requirements
  - each "light" has just two states: on or off
  - whilst the return is an array, the data structure representing the bank of lights doesn't have to be an array
  - 
# EXAMPLES

Example with n = 5 lights:

round 1: every light is turned on
round 2: lights 2 and 4 are now off; 1, 3, 5 are on
round 3: lights 2, 3, and 4 are now off; 1 and 5 are on
round 4: lights 2 and 3 are now off; 1, 4, and 5 are on
round 5: lights 2, 3, and 5 are now off; 1 and 4 are on
The result is that 2 lights are left on, lights 1 and 4. The return value is [1, 4].

With 10 lights, 3 lights are left on: lights 1, 4, and 9. The return value is [1, 4, 9].

# DATA STRUCTURES

return is an array
my bank of lights could be a nested 2D array, or a hash

# ALGORITHM

* CREATE a data structure representing the bank of lights with n number of lights
  + a helper method might be suitable
  + each subarray is formatted [light number, false]
  + for this solution false == "off" and true == "on"
  + e.g. [[1, false], [2, false], [3, false], [4, false], [5, false]]
  
* MOVE through the data structure n times
  + an iterator or a loop could be used
  + my initial sense is Integer#times might be the most straightforward outer loop
    - n.times do |pass_no|
  + actually Integer#upto will be better so we can start at 1
    - 1.upto(n) do |pass_no|
  + inner loop can be #each
    - bank.each do |light|
  
* SWITCH each "light" where light number % pass_no == 0

* STOP moving through the data structure after n passes
* CREATE a new array where only those subarrays with a true second value are selected
  + #select might be useful with an appropriate block
    - bank.select do |light_subarray|
  + how to remove the boolean second value?
* TRANSFORM a 2D array to a 1D array with only the light numbers
  + use #map to transform
* RETURN the 1D array
=end

def create_bank(n)
  bank = []
  1.upto(n) do |num|
    bank << [num, false]
  end
  bank
end

def switch!(light_subarray)
  if light_subarray[1] == true
    light_subarray[1]= false
  else
    light_subarray[1] = true
  end
  light_subarray
end

def thousand_lights(n)
  bank = create_bank(n)
  1.upto(n) do |pass_no|
    bank.each do |light_subarray|
      light_subarray = switch!(light_subarray) if light_subarray[0] % pass_no == 0
    end
  end
  
  return_array = bank.select do |light_subarray|
    light_subarray[1] == true
  end
  return_array.map do |light_subarray|
    light_subarray[0]
  end
end

# My Test Cases

# p create_bank(5)
# p switch!([1, false])
# p thousand_lights(2) 

# Problem Example Test Cases
p thousand_lights(5) == [1, 4]
p thousand_lights(10)== [1, 4, 9]
