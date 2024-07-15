=begin
39. Largest product in a series
(https://www.codewars.com/kata/529872bdd0f550a06b00026e/train/ruby)
6 kyu

Complete the greatestProduct method so that it'll find the greatest product of five consecutive digits in the given string of digits.

# PROBLEM
## INPUT: a string of numeric digits
## OUTPUT: an integer
## RULES
### Explicit requirements:
  - a method;
  - find the greatest product of 5 consecutive digits
### Implicit requirements:
  - "product" means 5 digits multiplied
  - 5 consecutive digits means 5 digits in a row
  - I'm assuming all consecutive substrings are allowed i.e overlapping substrings are allowed to be compared
  - the input is a string, so the numeric characters need to be transformed to integers
  - I'


# EXAMPLE
For example:
greatestProduct("123834539327238239583") // should return 3240 The input string always has more than five digits.

# DATA STRUCTURES
Input: numeric string
Intermediate: an array of substrings, or perhaps products
Output: an integer, the largest possible product

# ALGORITHM
## HIGH LEVEL
1. Find all the sets of 5 consecutive digits and calculate their products
2. RETURN the product with the largest value

1. Find all the sets of 5 consecutive digits and calculate their products
* CREATE an empty array for products
* MOVE through the input_string from first character to index -5 to set start_index
  + 
* SELECT current substring as I move through the input string
    - substring = input_string[start_index, 5]
* For each substring of five characters, multiply the digits and store in the array of products
  + this could be a helper method
  + SPLIT the substring into characters
  + TRANSFORM 
  + use #digits
  + use #* or #product on array of digits
  + use #<<
    - result = substring.to_i.digits.array.inject { |num, concat| num * concat}

2. RETURN the product with the largest value
* Use #max
=end

def calculate_product(substring)
  substring.to_i.digits.inject { |num, concat| num * concat}
end

# p calculate_product("123")


def greatest_product(input_string)
  array_of_products = []
  0.upto(input_string.length - 6) do |start_index|
    array_of_products << calculate_product(input_string[start_index, 5])
  end
  array_of_products.max
end


p greatest_product("123834539327238239583") == 3240
p greatest_product("395831238345393272382") == 3240
p greatest_product("92494737828244222221111111532909999") == 5292
p greatest_product("02494037820244202221011110532909999") == 0