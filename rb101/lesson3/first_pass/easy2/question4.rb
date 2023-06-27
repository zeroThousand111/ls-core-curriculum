advice = "Few things in life are as important as house training your pet dinosaur."

p advice.include? "dino"
p advice.include? "ghost"

p advice.match?("Dino")
p advice.match?("Ghost")