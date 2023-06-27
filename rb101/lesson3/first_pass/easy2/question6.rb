flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

# << operator
flintstones << "Dino"
p flintstones
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
p flintstones

# push method
flintstones.push("Dino")
p flintstones
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
p flintstones

# element assignment method
flintstones[6] = "Dino"
p flintstones