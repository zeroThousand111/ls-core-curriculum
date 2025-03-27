# My Method that calculates a factorial

# def factorial_enumerator(start_num)
#   num = start_num
#   total = 1
#   until num == 0
#     total *= num
#     num -= 1
#   end
#   total
# end

# puts factorial_enumerator(5)

# New Enumerator that also calculates a factorial
# the syntax is not like a method definition; the ending is defined by the argument saying how many times it should iterate

factorial_enumerator = Enumerator.new do |output|
  n = 0
  total = 1
  loop do # infinite loop controlled by methods called upon Enumerable object
    total = n.zero? ? 1 : total * n
    output << total
    n += 1
  end
end

# using Enumerable#next and Enumerable#rewind

puts factorial_enumerator.next    # 1
puts factorial_enumerator.next    # 1
puts factorial_enumerator.next    # 2
puts factorial_enumerator.next    # 6
puts factorial_enumerator.next    # 24
puts factorial_enumerator.next    # 120
puts factorial_enumerator.next    # 720
puts factorial_enumerator.rewind  # #<Enumerator:0x0000000103aebd30>
puts factorial_enumerator.next    # 1
puts factorial_enumerator.rewind  # #<Enumerator:0x0000000103aebd30>

# External Iterators

6.times { |number| puts "#{number}! == #{factorial_enumerator.next}" }
puts "=========================="

# 0! == 1
# 1! == 1
# 2! == 2
# 3! == 6
# 4! == 24
# 5! == 120
# ==========================

6.times { |number| puts "#{number}! == #{factorial_enumerator.next}" }
puts "=========================="

# 0! == 720 # incorrect because Enumerator object hasn't been reset with #rewind
# 1! == 5040
# 2! == 40320
# 3! == 362880
# 4! == 3628800
# 5! == 39916800
# ==========================

factorial_enumerator.rewind
6.times { |number| puts "#{number}! == #{factorial_enumerator.next}" }
puts "=========================="

# 0! == 1
# 1! == 1
# 2! == 2
# 3! == 6
# 4! == 24
# 5! == 120
# ==========================

# Internal Iterators

factorial_enumerator.each_with_index do |n, index|
  puts "#{index}! == #{n}"
  break if index >= 5
end

# 0! == 1
# 1! == 1
# 2! == 2
# 3! == 6
# 4! == 24
# 5! == 120