flintstones = {
  "Fred" => 0,
  "Wilma" => 1,
  "Barney" => 2,
  "Betty" => 3,
  "BamBam" => 4,
  "Pebbles" => 5
}

array = [flintstones.key(2), flintstones["Barney"]]

array_2 = flintstones.assoc("Barney")

p array
p array_2