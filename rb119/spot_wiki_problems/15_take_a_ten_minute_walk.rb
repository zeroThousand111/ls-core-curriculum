=begin
15. Take a Ten Minute Walk
(​https://www.codewars.com/kata/54da539698b8a2ad76000228/train/ruby​)
6 kyu
You live in the city of Cartesia where all roads are laid out in a perfect grid. You arrived ten minutes too early to an appointment, so you decided to take the opportunity to go for a short walk. The city provides its citizens with a Walk Generating App on their phones -- everytime you press the button it sends you an array of one-letter strings representing directions to walk (eg. ['n', 's', 'w', 'e']). You always walk only a single block in a direction and you know it takes you one minute to traverse one city block, so create a function that will return true if the walk the app gives you will take you exactly ten minutes (you don't want to be early or late!) and will, of course, return you to your starting point. Return false otherwise.
Note: you will always receive a valid array containing a random assortment of direction letters ('n', 's', 'e', or 'w' only). It will never give you an empty array (that's not a walk, that's standing still!).

# UNDERSTAND THE PROBLEM
## INPUT: an array of strings
## OUTPUT: a boolean value, true or false
## RULES
### explicit requirements
  - no empty array input
  - must return to same position
    - in other words, the number of 'n's and 's's must be equal, and the number of 'w's and 'e's must be equal
  - must be exactly 10 elements in the array
  - strings in the array will always be 'n', s, e, or w

# EXAMPLES

p is_valid_walk(['n','s','n','s','n','s','n','s','n','s']) == true 10 and equal number of n-s, w-e
p is_valid_walk(['w','e','w','e','w','e','w','e','w','e','w','e']) == false 
p is_valid_walk(['w']) == false
p is_valid_walk(['n','n','n','s','n','s','n','s','n','s']) == false

# DATA STRUCTURES
An array of strings, each string either n, s, e, or w

# ALGORITHM
* COUNT number of elements in the array
* RETURN false unless array.size == 10
* CREATE local variables for n, s, e & w
* MOVE through the array of strings, starting at first character and ending at last
* COUNT the number of n, s, e & w
  + DETERMINE if the character is n, s, e or w
  + increment the value of found string in local variable
  + RETURN true if value of n == s && value of e == w
  + ELSE return false
=end

def is_valid_walk(array)
  
  if array.size == 10
    
    n = 0
    s = 0
    e = 0
    w = 0
    
    array.each do |direction|
      case direction
      when "n" then n += 1
      when "s" then s += 1
      when "e" then e += 1
      when "w" then w += 1
      end
    end
    
    return true if n == s && w == e
  end
  
  false
end

p is_valid_walk(['n','s','n','s','n','s','n','s','n','s']) == true
p is_valid_walk(['w','e','w','e','w','e','w','e','w','e','w','e']) == false 
p is_valid_walk(['w']) == false
p is_valid_walk(['n','n','n','s','n','s','n','s','n','s']) == false