=begin
Given the munsters hash below

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

Modify the hash such that each member of the Munster family has an additional "age_group" key that has one of three values describing the age group the family member is in (kid, adult, or senior). Your solution should produce the hash below

{ "Herman" => { "age" => 32, "gender" => "male", "age_group" => "adult" },
  "Lily" => {"age" => 30, "gender" => "female", "age_group" => "adult" },
  "Grandpa" => { "age" => 402, "gender" => "male", "age_group" => "senior" },
  "Eddie" => { "age" => 10, "gender" => "male", "age_group" => "kid" },
  "Marilyn" => { "age" => 23, "gender" => "female", "age_group" => "adult" } }
  
  
  Note: a kid is in the age range 0 - 17, an adult is in the range 18 - 64 and a senior is aged 65+.
=end

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

# solution 1: Loop and Hash Element Assignment.  It works!

# counter = 0
# array_of_keys = munsters.keys

# loop do
  
#   if munsters[array_of_keys[counter]]["age"] < 18
#     age_group = "kid"
#   elsif munsters[array_of_keys[counter]]["age"] > 17 && munsters[array_of_keys[counter]]["age"] < 65
#     age_group = "adult"
#   else
#     age_group = "senior"
#   end
  
#   munsters[array_of_keys[counter]]["age_group"] = age_group
#   counter += 1
#   break if counter == array_of_keys.size
# end

# pp munsters

# solution 2: Using Hash#each and then Hash Element Assignment

# munsters.each do |key, value|
#   if value["age"] > 64
#     age_group = "senior"
#   elsif value["age"].between?(18, 64)
#     age_group = "adult"
#   else 
#     age_group = "kid"
#   end
  
#   value["age_group"] = age_group
# end

# pp munsters

# solution 3: Make age_group choice a method and then use Hash#each and Hash Element Assignment

# def choose_age_group(age)
#   if age > 64
#     age_group = "senior"
#   elsif age.between?(18, 64)
#     age_group = "adult"
#   else 
#     age_group = "kid"
#   end
#   age_group
# end

# munsters.each do |key, value|
#   value["age_group"] = choose_age_group(value["age"])
# end

# pp munsters

# solution 4: using official LS solution HINT.  Similar to solution 2, but using case statement and Range objects

# HINT: Try using a case statement along with Ruby Range objects in your solution

# munsters.each do |key, value|
#   case value["age"]
#     when (0..17)
#       age_group = "kid"
#     when (18..64)
#       age_group = "adult" 
#     when (65..)
#       age_group = "senior"
#   end
  
#   value["age_group"] = age_group
# end

# pp munsters

# N.B. (65..) is an endless range from 65 to infinity!

# Official LS Solution

munsters.each do |name, details|
  case details["age"]
  when 0...18
    details["age_group"] = "kid"
  when 18...65
    details["age_group"] = "adult"
  else
    details["age_group"] = "senior"
  end
end

pp munsters