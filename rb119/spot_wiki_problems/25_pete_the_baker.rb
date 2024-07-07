=begin
25. Pete, the baker
(​https://www.codewars.com/kata/525c65e51bf619685c000059/train/ruby​)
5 kyu

Pete likes to bake some cakes. He has some recipes and ingredients. Unfortunately he is not good in maths. Can you help him to find out, how many cakes he could bake considering his recipes?

Write a function cakes(), which takes the recipe (object) and the available ingredients (also an object) and returns the maximum number of cakes Pete can bake (integer). For simplicity there are no units for the amounts (e.g. 1 lb of flour or 200 g of sugar are simply 1 or 200). Ingredients that are not present in the objects, can be considered as 0.

# UNDERSTAND THE PROBLEM
## INPUTS: two hashes
## OUTPUT: an integer
## RULES
### Explicit requirements:
  - a method;
  - first argument is a hash of recipe ingredients for ONE cake
  - second argument is a hash of available ingredients
  - no units to complicate things
  - ingredients no present in either hash are considered to have a value of 0
### Implicit requirements:
  - 
  
Examples:
// must return 2
cakes({flour: 500, sugar: 200, eggs: 1}, {flour: 1200, sugar: 1200, eggs: 5, milk: 200}); LIMITING FACTOR IS FLOUR
// must return 0
cakes({apples: 3, flour: 300, sugar: 150, milk: 100, oil: 100}, {sugar: 500, flour: 2000, milk: 2000}); LIMITING FACTOR IS SUGAR

# DATA STRUCTURES
Two hashes input:
1. recipe ingredients
2. available ingredients

Intermediate:
A hash or array listing the maximum number of cakes possible from that ingredient

# ALGORITHM
HIGH LEVEL STEPS
1. CALCULATE the maximum number of cakes possible from that combination of receipe and available stock for EACH ingredient
2. RETURN the smallest value from the list of max cakes possible

1. CALCULATE the maximum number of cakes possible from that combination of receipe and available stock for EACH ingredient
* CREATE an array of maximum possible cakes
* MOVE through the recipe hash from first pair to last (not the stock hash)
  + use #each
* CHECK if the recipe ingredient is in the stock hash, return 0 if NOT present in stock hash
  + use include?
  
* CALCULATE the quotient from a division operation for stock value / recipe value for the current ingredient
  + e.g. "flour"=>1200 / "flour" =>500 = 2 cakes
    - 
* SHOVEL result into the array of max values
* STOP moving through the recipe hash

2. RETURN the smallest value from the list of max cakes possible
* RETURN the min value in the array
  + Use #min

=end

def cakes(recipe, stock)
  array_of_max_cakes = []
  recipe.each do |item, amount|
    return 0 unless stock.include?(item)
    array_of_max_cakes << (stock[item] / amount)
  end
  array_of_max_cakes.min
end

# my tests
# p cakes({"flour"=>500},{"flour"=>1200})

# test cases

p cakes({"flour"=>500, "sugar"=>200, "eggs"=>1},{"flour"=>1200, "sugar"=>1200, "eggs"=>5, "milk"=>200}) == 2 
p cakes({"cream"=>200, "flour"=>300, "sugar"=>150, "milk"=>100, "oil"=>100},{"sugar"=>1700, "flour"=>20000, "milk"=>20000, "oil"=>30000, "cream"=>5000}) == 11
p cakes({"apples"=>3, "flour"=>300, "sugar"=>150, "milk"=>100, "oil"=>100},{"sugar"=>500, "flour"=>2000, "milk"=>2000}) == 0
p cakes({"apples"=>3, "flour"=>300, "sugar"=>150, "milk"=>100, "oil"=>100},{"sugar"=>500, "flour"=>2000, "milk"=>2000, "apples"=>15, "oil"=>20}) == 0
p cakes({"eggs"=>4, "flour"=>400},{}) == 0
p cakes({"cream"=>1, "flour"=>3, "sugar"=>1, "milk"=>1, "oil"=>1, "eggs"=>1},{"sugar"=>1, "eggs"=>1, "flour"=>3, "cream"=>1, "oil"=>1, "milk"=>1}) == 1


