# # while counter method
# n = 1
# while n < 100
#   puts n if n.even?
#   n += 1
# end

# loop counter method with modulo logic
# n = 1
# loop do
#   break if n >= 99
#   puts n if n % 2 == 0
#   n += 1
# end

# loop counter with even method
# n = 1
# loop do
#   break if n >= 99
#   puts n if n.even?
#   n += 1
# end

# each method with range
# (1..99).each { |n| puts n if n % 2 == 0 }

# upto method
# 1.upto(99) { |n| puts n if n % 2 == 0 }

# over-engineered solution just to use Array#select method
## create array from 1 to 100
array = []
n = 0
loop do
  n += 1
  array << n
  break if n >= 99
end

## use select method on array
new_array = array.select { |e| e % 2 == 0 }
new_array.each { |e| puts e }
