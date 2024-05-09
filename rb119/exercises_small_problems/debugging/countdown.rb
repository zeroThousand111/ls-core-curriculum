=begin
Our countdown to launch isn't behaving as expected. Why? Change the code so that our program successfully counts down from 10 to 1.
=end


require 'pry'
require 'pry-byebug'

def decrease(counter)
  counter - 1
end

counter = 10

counter.times do # this addresses the further exploration element of the problem
  puts counter
  counter = decrease(counter)
end

puts 'LAUNCH!'