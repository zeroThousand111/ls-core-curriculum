# loop method with if/else and increment counter
# def stringy(n)
#     i = 1
#     array = []
#     loop do
#         if i.odd?
#             array.push(1)
#         else
#             array.push(0)
#         end
#         break if i == n
#         i += 1
#     end
#     array.join
# end

# times method with if/else
# def stringy(n)
#     array = []
#     n.times do |n|
#         if n.even?
#             array.push(1)
#         else
#             array.push(0)
#         end
#     end
#     array.join
# end

# times method with ternary operator
def stringy(n)
    array = []
    n.times do |n|
        array.push(n.even? ?  1 :  0)
    end
    array.join
end

# output number strings to validate them by sight
puts stringy(6)
puts stringy(9)
puts stringy(4)
puts stringy(7)

# all of the above now work.  The key was to create an empty array and push numbers to it then join it at the end as the implicit return
puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'