=begin
# Problem
Implement a method #stock_picker that takes in an array of stock prices, one for each hypothetical day. It should return a pair of days representing the best day to buy and the best day to sell. Days start at 0.

Quick Tips:

You need to buy before you can sell
Pay attention to edge cases like when the lowest day is the last day or the highest day is the first day.

## Input: An array of integers
## Output: An array of just 2 integers
- [best day to buy, best day to sell]
- In other words [index of array on lowest value, index of array on highest value]

## Rules:
### Explicit requirements
  - Stock must be bought before it can be sold, in other words the lowest value must come before the highest value
  -
### Implicit requirements
  - 
  -
# Examples/Test Cases
stock_picker([17,3,6,9,15,8,6,1,10])
=> [1,4]  # for a profit of $15 - $3 == $12


# Data Structures
  - input array
  - output array

# Algorithm
  - CREATE two local variables, day_to_buy and day_to_sell
  - Starting with first value, COMPARE pairs of subsequent values and compare potential profit
    - CREATE two local variables, potential_profit and highest_profit
      - potential_profit = 0
      - highest_profit = 0
    - MOVE through the array of values
      - use two nested loops - this works best for now
        - outer loop index aka purchase_day = 0
        - inner loop index aka sale_day = purchase_day + 1
      - use nested iterators like #each or #each_with_index (but how to control not iterating through the whole array?)
    - CALCULATE potential profit if first value bought, and subsequent value sold
      - potential_profit = array[sale_day] - array[purchase_day]
  - IF potential_profit is greater than highest_profit, then note profit, and days bought and sold
    - highest_profit = potential_profit
    - day_to_buy = start value (index of outer loop)
    - day_to_sell = finish value (index of inner loop)
  - RETURN output array
    - [day_to_buy, day_to_sell]
=end

# Code
require 'pry'
require 'pry-byebug'

def stock_picker(array)
  day_to_buy = nil
  day_to_sell = nil
  potential_profit = 0
  highest_profit = 0
  
  purchase_day = 0
  loop do
    sale_day = purchase_day + 1
    loop do
      break if sale_day >= array.size
      potential_profit = array[sale_day] - array[purchase_day]
      if potential_profit > highest_profit
        day_to_buy = purchase_day
        day_to_sell = sale_day
        highest_profit = potential_profit
      end
      sale_day += 1
    end
    
    purchase_day += 1
    break if purchase_day >= array.size
  end
  
  [day_to_buy, day_to_sell]
end

# Test Cases
p stock_picker([17,3,6,9,15,8,6,1,10])
# => [1,4]  # for a profit of $15 - $3 == $12
p stock_picker([1,3,6,9,15,8,6,1,101]) # [0, 8]