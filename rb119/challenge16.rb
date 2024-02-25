=begin
______________________________________________________________________________
*****Understand the PROBLEM*****
______________________________________________________________________________
THE PROBLEM:

EXERCISE 11

Given the following data structures, write a program that copies the information from the array into the empty hash that applies to the correct person.

contact_data = [["joe@email.com", "123 Main st.", "555-123-4567"],
            ["sally@email.com", "404 Not Found Dr.", "123-234-3454"]]

contacts = {"Joe Smith" => {}, "Sally Johnson" => {}}

Expected output:
  {
    "Joe Smith"=>{:email=>"joe@email.com", :address=>"123 Main st.", :phone=>"555-123-4567"},
    "Sally Johnson"=>{:email=>"sally@email.com", :address=>"404 Not Found Dr.",  :phone=>"123-234-3454"}
  }

CHALLENGE 16 PART 1

Challenge: In exercise 11, we manually set the contacts hash values one by one. Now, programmatically loop or iterate over the contacts hash from exercise 11, and populate the associated data from the contact_data array. Hint: you will probably need to iterate over ([:email, :address, :phone]), and some helpful methods might be the Array shift and first methods.

Note that this exercise is only concerned with dealing with 1 entry in the contacts hash, like this:

contact_data = ["joe@email.com", "123 Main st.", "555-123-4567"]
contacts = {"Joe Smith" => {}}


CHALLENGE 16 PART 2 BONUS

As a bonus, see if you can figure out how to make it work with multiple entries in the contacts hash.


INPUT:

An array of nested contact_data:
[
["joe@email.com", "123 Main st.", "555-123-4567"],
["sally@email.com", "404 Not Found Dr.", "123-234-3454"]
]

In other words by category:
[
[email, address, telephone],
[email, address, telephone]
]

In other words by array index reference:
[
[[0][0], [0][1], [0][2]],
[[1][0], [1][1], [1][2]]
]

A nested Hash of contacts data:

{
"Joe Smith"=>{:email=>"joe@email.com", :address=>"123 Main st.", :phone=>"555-123-4567"},
"Sally Johnson"=>{:email=>"sally@email.com", :address=>"404 Not Found Dr.",  :phone=>"123-234-3454"}
}

In other words by category:

{
"name"={:email=>"email", :address=>"address", :phone=>"phone"},
"name"={:email=>"email", :address=>"address", :phone=>"phone"},
}

In other words by hash key-value reference at the top level:

{
"key"={value},
"key"={value},
}

In other words by hash key-value reference at the nested level:

{
key={key=>value, key=>value, key=>value},
key={key=>value, key=>value, key=>value},
}

OUTPUT:

To answer exercise 11 — in other words to map the elements of the contact_data array into the partially completed contacts hash — we can manually assign values from the array to the hash:

contacts = {
"Joe Smith" => {:email => contact_data[0][0], :address => contact_data[0][1], :phone => contact_data[0][2]}, 
"Sally Johnson" => {:email => contact_data[1][0], :address => contact_data[1][1], :phone => contact_data[1][2]}
}

The official solution to exercise 11 is:

contacts["Joe Smith"][:email] = contact_data[0][0]
contacts["Joe Smith"][:address] = contact_data[0][1]
contacts["Joe Smith"][:phone] = contact_data[0][2]
contacts["Sally Johnson"][:email] = contact_data[1][0]
contacts["Sally Johnson"][:address] = contact_data[1][1]
contacts["Sally Johnson"][:phone] = contact_data[1][2]


RULES
EXPLICIT REQUIREMENTS:
  - 
  -
  -
  
IMPLICIT REQUIREMENTS:
  -
  -
  -

______________________________________________________________________________
*****EXAMPLES/TEST CASES*****
______________________________________________________________________________

Expected output:
  {
    "Joe Smith"=>{:email=>"joe@email.com", :address=>"123 Main st.", :phone=>"555-123-4567"},
    "Sally Johnson"=>{:email=>"sally@email.com", :address=>"404 Not Found Dr.",  :phone=>"123-234-3454"}
  }

______________________________________________________________________________
*****DATA STRUCTURES*****
______________________________________________________________________________

Arrays and Hashes
______________________________________________________________________________
*****ALGORITHM*****
______________________________________________________________________________
1. Requirement — The important, generalized steps required to navigate from the input to the desired output.
  a. Approach — The process that will be utilized to accomplish each Requirement.
    i. Procedure — Specific details to implement the Approach.


1.
  a.
    i.
2.
  a.
    i.
3.
  a.
    i.
4.
  a.
    i.
5.
  a.
    i.
______________________________________________________________________________

Now CODE with intent!
=end

require 'pry'
require 'pry-byebug'

# contact_data = [["joe@email.com", "123 Main st.", "555-123-4567"],
#             ["sally@email.com", "404 Not Found Dr.", "123-234-3454"]]

# Exercise 11 Solution - Manual array element reference and hash element assignment

# contacts["Joe Smith"][:email] = contact_data[0][0]
# contacts["Joe Smith"][:address] = contact_data[0][1]
# contacts["Joe Smith"][:phone] = contact_data[0][2]
# contacts["Sally Johnson"][:email] = contact_data[1][0]
# contacts["Sally Johnson"][:address] = contact_data[1][1]
# contacts["Sally Johnson"][:phone] = contact_data[1][2]

# Challenge 16 Part 1 - solution 1 - Using a Simple Loop

contact_data = ["joe@email.com", "123 Main st.", "555-123-4567"]
contacts = {"Joe Smith" => {}}
type = [:email, :address, :phone]

index = 0
loop do
  contacts["Joe Smith"][type[index]] = contact_data[index]
  index += 1
  break if index == contact_data.size
end

# Challenge 16 Part 1 - solution 2 - Using Enumerable#each_with_index

contact_data = ["joe@email.com", "123 Main st.", "555-123-4567"]
contacts = {"Joe Smith" => {}}
type = [:email, :address, :phone]

type.each_with_index do |type, index|
  contacts["Joe Smith"][type] = contact_data[index]
end

# -------------------

# Challenge 16 Part 1 - solution 3 - Using a Array#shift and Array#first

contact_data = ["joe@email.com", "123 Main st.", "555-123-4567"]
contacts = {"Joe Smith" => {}}
type = [:email, :address, :phone]

type.each do |type|
  contacts["Joe Smith"][type] = contact_data.first
  contact_data.shift
end

# -------------------

# Challenge 16 Part 2 BONUS - solution 1 - Using nested loops

contact_data = [["joe@email.com", "123 Main st.", "555-123-4567"],
            ["sally@email.com", "404 Not Found Dr.", "123-234-3454"]]
contacts = {"Joe Smith" => {}, "Sally Johnson" => {}}
type = [:email, :address, :phone]
name = ["Joe Smith", "Sally Johnson"]

outer_index = 0
loop do
  inner_index = 0
  
  loop do
    contacts[name[outer_index]][type[inner_index]] = contact_data[outer_index][inner_index]
    inner_index += 1
    break if inner_index == type.size
  end
  
  outer_index += 1
  break if outer_index == contact_data.size
end


# -------------------

# Challenge 16 Part 2 BONUS - solution 2 - Using nested loops

contact_data = [["joe@email.com", "123 Main st.", "555-123-4567"],
            ["sally@email.com", "404 Not Found Dr.", "123-234-3454"]]
contacts = {"Joe Smith" => {}, "Sally Johnson" => {}}
type = [:email, :address, :phone]
name = ["Joe Smith", "Sally Johnson"]

name.each_with_index do |name, name_index|
  type.each_with_index do |type, index|
    contacts[name][type] = contact_data[name_index][index]
  end
end

# -------------------

# Challenge 16 Part 2 BONUS - Official LS Solution iterating over the contacts hash

contact_data = [["joe@email.com", "123 Main st.", "555-123-4567"],
            ["sally@email.com", "404 Not Found Dr.", "123-234-3454"]]
contacts = {"Joe Smith" => {}, "Sally Johnson" => {}}
fields = [:email, :address, :phone]

contacts.each_with_index do |(name, hash), idx|
  fields.each do |field|
    hash[field] = contact_data[idx].shift
  end
end

# Challenge 16 Part 2 BONUS - My interpretation of LS solution.  Actually I prefer my non-destructive versions

contact_data = [["joe@email.com", "123 Main st.", "555-123-4567"],
            ["sally@email.com", "404 Not Found Dr.", "123-234-3454"]]
contacts = {"Joe Smith" => {}, "Sally Johnson" => {}}
type = [:email, :address, :phone]


contacts.each_with_index do |(name, subhash), name_index|
  type.each do |type|
    contacts[name][type] = contact_data[name_index].shift
  end
end



# -------------------


# Print Tests
p contacts

# Test Cases - PART 1

# p contacts == {
#     "Joe Smith"=>{:email=>"joe@email.com", :address=>"123 Main st.", :phone=>"555-123-4567"}
#   }

# Test Cases - PART 2 BONUS

p contacts == {
    "Joe Smith"=>{:email=>"joe@email.com", :address=>"123 Main st.", :phone=>"555-123-4567"},
    "Sally Johnson"=>{:email=>"sally@email.com", :address=>"404 Not Found Dr.",  :phone=>"123-234-3454"}
  }