=begin
62. Who likes it?
(​https://www.codewars.com/kata/5266876b8f4bf2da9b000362​)
6 kyu
You probably know the "like" system from Facebook and other pages. People can "like" blog posts, pictures or other items. We want to create the text that should be displayed next to such an item.
Implement a function likes :: [String] -> String, which must take in input array, containing the names of people who like an item. It must return the display text as shown in the examples:

# UNDERSTAND THE PROBLEM
## INPUT: an array of strings
## OUTPUT: a new string, with elements from the input
## RULES
### EXPLICIT REQUIREMENTS:
  - 
### IMPLICIT REQUIREMENTS:
  - if the input array is empty, return "no one likes this"
  - if the input array contains 1 element, return "NAME likes this"
  - if the input array contains 2 elements, return "NAME1 and NAME2 like this"
  - if the input array contains 3 elements, return "NAME1, NAME2 and NAME3 like this"
  - if the input array contains 4 or more elements, return "NAME1, NAME2 and N others like this"

# EXAMPLES
likes [] // must be "no one likes this"
likes ["Peter"] // must be "Peter likes this"
likes ["Jacob", "Alex"] // must be "Jacob and Alex like this"
likes ["Max", "John", "Mark"] // must be "Max, John and Mark like this"
likes ["Alex", "Jacob", "Mark", "Max"] // must be "Alex, Jacob and 2 others like this"

# DATA STRUCTURES
## INPUT: an array of strings (names)
## OUTPUT: a string (that includes the input names)
## INTERMEDIATE: probably not needed

# ALGORITHM
## HIGH-LEVEL
1. Count how many elements thre are in the input array
2. Respond with a string format according to whether there are 0, 1, 2, 3 or more elements in the input array
3. Return the appropriately formatted string

1. Count how many elements thre are in the input array
* Count the elements
  + use Array#size
2. Respond with a string format according to whether there are 0, 1, 2, 3 or more elements in the input array
* CREATE a case statement based on the count
  + if the input array is empty, return "no one likes this"
  + if the input array contains 1 element, return "NAME likes this"
  + if the input array contains 2 elements, return "NAME1 and NAME2 like this"
  + if the input array contains 3 elements, return "NAME1, NAME2 and NAME3 lik+ this"
  + if the input array contains 4 or more elements, return "NAME1, NAME2 and N others like this"
    + N is array.size - 2 (starting at 2)
3. Return the appropriately formatted string

=end

def likes(input_array)
  count = input_array.size
  output = ""
  
  case count
  when 0
    output << "no one likes this"
  when 1
    output << "#{input_array[0]} likes this"
  when 2
    output << "#{input_array[0]} and #{input_array[1]} like this"
  when 3
    output << "#{input_array[0]}, #{input_array[1]} and #{input_array[2]} like this"
  end
  
  if count > 3
    output << input_array[0] << ", "
    output << input_array[1]
    output << " and #{count - 2} others like this"
  end
  
  output
end


# TEST CASES
p likes([]) == "no one likes this"
p likes(["Peter"]) == "Peter likes this"
p likes(["Jacob", "Alex"]) == "Jacob and Alex like this"
p likes(["Max", "John", "Mark"]) == "Max, John and Mark like this"
p likes(["Alex", "Jacob", "Mark", "Max"]) == "Alex, Jacob and 2 others like this"