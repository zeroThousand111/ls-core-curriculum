# counter = 0

# while counter <= 100
#   puts counter if counter / 2 != 0
#   counter += 1
# end

# array = (1...100).to_a

# array.each { |i| if i.odd? then puts i end }

1.upto(100) { |i| if i.odd? then puts i end }