=begin
----
THE PROBLEM

In exercise 11, we manually set the contacts hash values one by one. Now, programmatically loop or iterate over the contacts hash from exercise 11, and populate the associated data from the contact_data array. Hint: you will probably need to iterate over ([:email, :address, :phone]), and some helpful methods might be the Array shift and first methods.

Note that this exercise is only concerned with dealing with 1 entry in the contacts hash, like this:

contact_data = ["joe@email.com", "123 Main st.", "555-123-4567"]
contacts = {"Joe Smith" => {}}

As a bonus, see if you can figure out how to make it work with multiple entries in the contacts hash.

----

RECAP OF EXERCISE 11

Given the following data structures, write a program that copies the information from the array into the empty hash that applies to the correct person.

contact_data = [["joe@email.com", "123 Main st.", "555-123-4567"],
            ["sally@email.com", "404 Not Found Dr.", "123-234-3454"]]

contacts = {"Joe Smith" => {}, "Sally Johnson" => {}}

Expected output:
  {
    "Joe Smith"=>{:email=>"joe@email.com", :address=>"123 Main st.", :phone=>"555-123-4567"},
    "Sally Johnson"=>{:email=>"sally@email.com", :address=>"404 Not Found Dr.",  :phone=>"123-234-3454"}
  }

----
UNDERSTAND THE PROBLEM
INPUT:An Array (a 2D nested array)
OUTPUT: A Hash
RULES:
EXPLICIT REQUIREMENTS:
  - programmatically loop or iterate over the contacts hash from exercise 11
  - you will probably need to iterate over ([:email, :address,   :phone])
  - some helpful methods might be the Array shift and first methods
IMPLICIT REQUIREMENTS:
  - The solution can be destructive to the input array
  - 
----
TEST CASES & EXAMPLES

From this input:

contact_data = [["joe@email.com", "123 Main st.", "555-123-4567"],
            ["sally@email.com", "404 Not Found Dr.", "123-234-3454"]]

contacts = {"Joe Smith" => {}, "Sally Johnson" => {}}

Expected output:
  {
    "Joe Smith"=>{:email=>"joe@email.com", :address=>"123 Main st.", :phone=>"555-123-4567"},
    "Sally Johnson"=>{:email=>"sally@email.com", :address=>"404 Not Found Dr.",  :phone=>"123-234-3454"}
  }

----
DATA STRUCTURES
Arrays and hashes.  No strings.

----
ALGORITHM

The 'manual' way of answering exercise 11 using Hash Element Assignment was this:

hash[key] = value
hash[key][sub-key] = value

contacts["Joe Smith"][:email] = contact_data[0][0]
contacts["Joe Smith"][:address] = contact_data[0][1]
contacts["Joe Smith"][:phone] = contact_data[0][2]

contacts["Sally Johnson"][:email] = contact_data[1][0]
contacts["Sally Johnson"][:address] = contact_data[1][1]
contacts["Sally Johnson"][:phone] = contact_data[1][1]

1. Take the first key-value pair of contacts and assign the value (a sub-hash):
  1.1 Assign the first key as the first element of info_types_array with the value of contact_data[0][0]
  1.2 Assign the second key as the second element of info_types_array with the value of contact_data[0][1]
  1.3 Assign the third key as the third element of info_types_array with the value of contact_data[0][2]
2. Take the second key-value pair of contacts and assign the value (a sub-hash):
  2.1 Assign the first key as the first element of info_types_array with the value of contact_data[1][0]
  2.2 Assign the second key as the second element of info_types_array with the value of contact_data[1][1]
  2.3 Assign the third key as the third element of info_types_array with the value of contact_data[1][2]
3. Keep going if there are more keys in the contacts Hash (but there aren't)
4. Print out the value of contacts to see if the correct key-value pairs and sub-Hashes have been assigned.

=end

contact_data = [["joe@email.com", "123 Main st.", "555-123-4567"],
            ["sally@email.com", "404 Not Found Dr.", "123-234-3454"], ["bob@paint.com", "Little Green Trees", "0404-0404040"]]

contacts = {"Joe Smith" => {}, "Sally Johnson" => {}, "Bob Ross" =>{}}

info_types_array = [:email, :address, :phone]
contact_name_array = contacts.keys

pp contacts

# solution 1: Using Nested Loops.  It works!

outer_counter = 0

# outer loop
loop do
  inner_counter = 0
  
  #inner loop
  
  loop do
    contacts[contact_name_array[outer_counter]][info_types_array[inner_counter]] = contact_data[outer_counter][inner_counter]
    inner_counter += 1
    break if inner_counter == contact_data[outer_counter].size
  end
  
  outer_counter += 1
  break if outer_counter == contact_data.size
end

pp contacts

# solution 2:  Using two #each_with_index methods nested, assisted by contact_name_array

# contacts.each_with_index do |pair, index|
#   info_types_array.each_with_index do |info_type, i|
#     contacts[contact_name_array[index]][info_type] = contact_data[index][i]
#   end
# end

# pp contacts

# solution 3:  Using two #each_with_index methods nested, without contact_name_array

# contacts.each_with_index do |(key, value), index|
#   info_types_array.each_with_index do |info_type, i|
#     contacts[key][info_type] = contact_data[index][i]
#   end
# end

# pp contacts

# official LS solution in Ruby book uses Array#shift in Hash Element Assignment

# contact_data = [["joe@email.com", "123 Main st.", "555-123-4567"],
#             ["sally@email.com", "404 Not Found Dr.", "123-234-3454"]]
# contacts = {"Joe Smith" => {}, "Sally Johnson" => {}}
# fields = [:email, :address, :phone]

# contacts.each_with_index do |(name, hash), idx|
#   fields.each do |field|
#     hash[field] = contact_data[idx].shift
#   end
# end
