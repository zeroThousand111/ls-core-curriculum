=begin
In the ages hash:

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

remove people with age 100 and greater.

NOTE:  The problem hasn't defined if it wants a new hash returned with those elements missing or if it wants the existing hash to be destructively changed.
=end

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

# solution 1: Loop and #delete

# counter = 0
# ages_array = ages.values

# loop do
#   ages.delete(ages.key(ages_array[counter])) if ages_array[counter] > 100
#   counter += 1
#   break if counter == ages.count
# end

# p ages

# solution 2: Hash#delete_if (destructive)

# ages.delete_if { |key, value| value > 100 }

# p ages

# solution 3: Enumerable#select - returns a new collection

# p ages.select { |key, value| value < 100 }

# solution 4: Enumerable#select! (destructive)

# ages.select! { |key, value| value < 100 }
# p ages

# solution 5: Hash#keep_if (destructive)

ages.keep_if { |key, value| value < 100 }
p ages
