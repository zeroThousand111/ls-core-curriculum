arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]
# expected return value: {:a=>1, "b"=>"two", "sea"=>{:c=>3}, {:a=>1, :b=>2, :c=>3, :d=>4}=>"D"}

# My solution with #each_with_object
# new_hsh = arr.each_with_object({}) do | (key, value), hash |
#   hash[key] = value
# end

# official LS solution using #each
# new_hsh = {}
# arr.each do |item|
#   new_hsh[item[0]] = item[1]
# end

# my solution using a simple loop
new_hsh = {}
counter = 0

loop do
  new_hsh[arr[counter][0]] = arr[counter][1]
  counter += 1
  break if counter == arr.size
end


p new_hsh # => {:a=>1, "b"=>"two", "sea"=>{:c=>3}, {:a=>1, :b=>2, :c=>3, :d=>4}=>"D"}
p new_hsh == {:a=>1, "b"=>"two", "sea"=>{:c=>3}, {:a=>1, :b=>2, :c=>3, :d=>4}=>"D"}