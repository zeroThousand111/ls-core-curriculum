# # counter method with maths logic
# i = 1
# loop do
#   puts i if (i % 2 != 0)
#   i += 1
#   break if i >= 100
# end

# counter method with odd?
# i = 1
# loop do
#   puts i if i.odd?
#   i += 1
#   break if i >= 100
# end

# # array method
# (1..100).each { |n| puts n if n.odd? }

# Integer#upto method
1.upto(100) { |n| puts n if n.odd? }