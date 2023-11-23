=begin
Given the array below

flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

Turn this array into a hash where the names are the keys and the values are the positions in the array.
=end

# solution 1: Enumerable#each_with_object
flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

hash = {}
flintstones.each_with_index do | element, index |
  hash[element] = index
end

p hash

# solution 2: Loop with Array#each

flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

hash = {}
counter = 0

loop do
  hash[flintstones[counter]] = counter
  counter += 1
  break if counter == flintstones.size
end

p hash

# solution 3: Enumerable#each_with_index
flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

hash = {}
flintstones.each_with_index do |element, index|
  hash[element] = index
end
p hash