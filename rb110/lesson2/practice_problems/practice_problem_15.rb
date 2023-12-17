arr = [
  {a: [1, 2, 3]}, 
  {b: [2, 4, 6], c: [3, 6], d: [4]}, 
  {e: [8], f: [6, 10]}
  ]

# print test to find the right level
# arr.each do | sub_hash |
#   sub_hash.each do |key, value_array|
#     p value_array
#     # value_array.each do |i|
#     #   p i
#     # end
#   end
# end

# my aborted failed attempt
# new_arr = arr.select do | sub_hash |
#   sub_hash.each do |key, value_array|
#     value_array.all? { |i| i.even? }
#   end
# end

# p new_arr

# LS solution

# new_arr = arr.select do |hsh|
#             hsh.all? do |_, value|
#               value.all? do |num|
#                 num.even?
#               end
#             end
#           end
          
# p new_arr

# => [{:e=>[8], :f=>[6, 10]}]

# my solution adjusted slightly so that it now works
new_arr = arr.select do | sub_hash |
            sub_hash.all? do |key, value_array|
              value_array.all? { |i| i.even? }
            end
          end
          
p new_arr
# => [{:e=>[8], :f=>[6, 10]}]
