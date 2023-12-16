array = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]

# new_array = array.map do | sub_hash |
#   sub_hash.transform_values do | value |
#     value + 1
#   end
# end

new_array = array.map  do | sub_hash |
  sub_hash.each_with_object({}) do | (key, value), sub_hash |
    sub_hash[key] = value + 1
  end
end

p new_array

# => [{:a=>2}, {:b=>3, :c=>4}, {:d=>5, :e=>6, :f=>7}]