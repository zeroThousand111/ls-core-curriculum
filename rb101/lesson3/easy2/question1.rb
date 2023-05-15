ages = {
  "Herman" => 32,
  "Lily" => 30,
  "Grandpa" => 402,
  "Eddie" => 10
}

p ages.has_key?("Spot")
p ages.has_key?("Eddie")

p ages.include?("Spot")
p ages.include?("Eddie")

p ages.member?("Spot")
p ages.member?("Eddie")