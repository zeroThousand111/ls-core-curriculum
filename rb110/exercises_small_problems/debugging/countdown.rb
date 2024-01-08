require 'pry'
require 'pry-byebug'

# def decrease(counter)
#   counter -= 1
# end

# counter = 10

# 10.times do
#   puts counter
#   binding.pry
#   counter = decrease(counter) # counter not decremented in original snippet
# end

# puts 'LAUNCH!'

# further exploration - remove 10.times with an until loop

def decrease(counter)
  counter -= 1
end

counter = 10

until counter == 0 do
  puts counter
  counter = decrease(counter)
end

puts 'LAUNCH!'
