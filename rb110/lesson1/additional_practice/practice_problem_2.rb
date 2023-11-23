=begin
Add up all of the ages from the Munster family hash:
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
=end

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

# solution 1: Simple Loop - so many possible variations!

sum = 0
counter = 0
ages_values_array = ages.values

loop do 
  sum += ages_values_array[counter]
  counter += 1
  break if counter == ages.count
end

p sum
p sum == 6174

# solution 2: Hash#values then Array#sum

sum = ages.values.sum

p sum
p sum == 6174

# solution 3: Hash#each

sum = 0

ages.each do |key, value|
  sum += value
end

p sum
p sum == 6174

# solution 4: Enumerable#inject

ages.values.inject(:+) # => 6174

p sum
p sum == 6174