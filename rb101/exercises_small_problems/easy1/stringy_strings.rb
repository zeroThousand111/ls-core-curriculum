# Today's method
# def stringy(number)
#   counter = 1
#   array = []
#   number.times do
#     if counter.odd?
#       array << 1
#     else
#       array << 0
#     end
#     counter += 1
#   end
#   array.join
# end

# times method with ternary operator (my first solution a few weeks ago!)
# def stringy(n)
#     array = []
#     n.times do |n|
#         array.push(n.even? ?  1 :  0)
#     end
#     array.join
# end

# Further Exploration method
def stringy(index, reverse=1)
    array = []
    if reverse == 1
      index.times do |index|
        array.push(index.even? ?  1 :  0)
      end
    else 
      index.times do |index|
        array.push(index.even? ?  0 :  1)
      end
    end
    array.join
end

# Tests for Further Exploration method
puts stringy(6)
puts stringy(6, 0)
puts stringy(9, 1)
puts stringy(9, 0)
puts stringy(4)
puts stringy(4, 0)
puts stringy(7)
puts stringy(7, 0)

# # output 
# puts stringy(6)
# puts stringy(9)
# puts stringy(4)
# puts stringy(7)

# # test 
# puts stringy(6) == '101010'
# puts stringy(9) == '101010101'
# puts stringy(4) == '1010'
# puts stringy(7) == '1010101'

# Expected output
# true
# true
# true
# true