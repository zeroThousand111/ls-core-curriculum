=begin
Pick out the minimum age from our current Munster family hash:

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

=end

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

# solution 1: Loop

counter = 0
array_of_ages = ages.values
min_age = 9999999999
name = ""

loop do
  if array_of_ages[counter] < min_age
    min_age = array_of_ages[counter]
    name = ages.key(array_of_ages[counter])
  end
  counter +=1
  break if counter == array_of_ages.length
end

puts "The minimum age is #{name} who is #{min_age} years old!"

# solution 2: Using Array#sort on an array of Hash values and then Enumerable#first

p ages.values.sort.first

# solution 3: LS Official Solution Using Array#min (which I didn't know about!)

p ages.values.min

