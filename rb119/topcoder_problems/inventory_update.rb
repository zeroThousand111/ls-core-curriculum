=begin
Compare and update the inventory stored in a 2D array against a second 2D array of a fresh delivery. Update the current existing inventory item quantities (in ). If an item cannot be found, add the new item and quantity into the inventory array. The returned inventory array should be in alphabetical order by item.

# UNDERSTAND THE PROBLEM

## INPUT: two nested 2D arrays, an inventory array and a fresh delivery array

## OUTPUT: a mutated inventory array, with extra quantities of existing items and new items

## RULES
### EXPLICIT REQUIREMENTS
  - update the values of each subarray with the values from the fresh delivery array (array 2)
  - if an item is not present in the inventory array, add it to the inventory
  - sort the returned inventory array in alphabetical order of item name (which is the second value in each subarray)
### IMPLICIT REQUIREMENTS
  - the problem doesn't state if the original inventory array should be mutated or a new array returned, but if it is the return from a method it will be a new array
  - the test cases are not additive; they are stand alone and so there doesn't need to be a data structure that remembers the inventory between method invocations
  - the values in the inventory array are operated on by the values in the fresh delivery array, not replaced by them 
  - the starting inventory can be empty
  - the fresh delivery can be empty
  
## REFRAME THE PROBLEM

Return an array containing the subarrays of the first array argument that a) have had the values updated by adding the values of those "items" from the second array AND b) any new subarrays in the second array not present in the first should be included.  The return array should be sorted in alphabetical order.

# EXAMPLES

see test cases below

# DATA STRUCTURES

Nested 2D arrays

# ALGORITHM - redo this!  

* CHECK if each new item in the fresh array exists in the inventory already
  + SEARCH inventory array for each new item in fresh array
  + MOVE through the fresh delivery array
    + use #each
  + COMPARE the current subarray of fresh delivery (new_item) with each subarray in the inventory array to see there is a match of names (the second element of each subarray)
  + create a local variable switch to check if we find a match. It has a value of false, which is reassigned true if we find the new_item in the inventory
  + use Array#include? as search method for match in each subarray
      - subarray.include?(fresh_item[1])

* ACT on result of the CHECK
  * IF new_item subarray is included in inventory array, then update the quantity in the old item subarray by adding the quantity in the new item of the fresh delivery array
    + CREATE quantity local variable and assign it to 0
      - quantity = 0
  * ELSE if new_item subarray does not exist in the inventory array, add that subarray to the inventory array
    + SHOVEL new_item subarray to updated array

* What about old_items that are in the inventory but not in the fresh array?

* SORT the changed inventory array in ascending alphabetical order of the names of the item
  + use Enumerable#sort_by
    - .sort_by { |subarray| subarray[1] }
=end

def update_inventory(inventory, fresh_delivery)
  fresh_delivery.each do |new_item|
    included = false
    quantity = new_item[0]
    inventory_index = nil
    inventory.each_with_index do |old_item, index|
      if old_item.include?(new_item[1])
        included = true
        quantity += old_item[0]
        inventory_index = index
      end
    end
    
    if included
      # puts "included!"
      inventory[inventory_index][0] = quantity
    else
      # puts "not included"
      inventory << new_item
    end
  end
  inventory.sort_by { |subarray| subarray[1] }
end

# TEST CASES

p update_inventory([[21, "Bowling Ball"], [2, "Dirty Sock"], [1, "Hair Pin"], [5, "Microphone"]], [[2, "Hair Pin"], [3, "Half-Eaten Apple"], [67, "Bowling Ball"], [7, "Toothpaste"]]) == [[88, "Bowling Ball"], [2, "Dirty Sock"], [3, "Hair Pin"], [3, "Half-Eaten Apple"], [5, "Microphone"], [7, "Toothpaste"]]

p update_inventory([[21, "Bowling Ball"], [2, "Dirty Sock"], [1, "Hair Pin"], [5, "Microphone"]], []) == [[21, "Bowling Ball"], [2, "Dirty Sock"], [1, "Hair Pin"], [5, "Microphone"]] # i.e. a fresh delivery of no items

p update_inventory([], [[2, "Hair Pin"], [3, "Half-Eaten Apple"], [67, "Bowling Ball"], [7, "Toothpaste"]]) == [[67, "Bowling Ball"], [2, "Hair Pin"], [3, "Half-Eaten Apple"], [7, "Toothpaste"]] # i.e. a starting inventory of no items

p update_inventory([[0, "Bowling Ball"], [0, "Dirty Sock"], [0, "Hair Pin"], [0, "Microphone"]], [[1, "Hair Pin"], [1, "Half-Eaten Apple"], [1, "Bowling Ball"], [1, "Toothpaste"]]) == [[1, "Bowling Ball"], [0, "Dirty Sock"], [1, "Hair Pin"], [1, "Half-Eaten Apple"], [0, "Microphone"], [1, "Toothpaste"]]
