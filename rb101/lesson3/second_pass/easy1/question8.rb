#  Create an array containing only two elements: Barney's name and Barney's number.

flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }

p array = (flintstones.select { |key, value| key == "Barney" }).to_a

# my previous solution

p array = [flintstones.key(2), flintstones["Barney"]]

# official solution

p flintstones.assoc("Barney")