# original information
contact_data_array = ["joe@email.com", "123 Main st.", "555-123-4567"]
contacts = {"Joe Smith" => {}}

# fields array
fields_array = [:email, :address, :phone]

=begin
hash assignment is:
hash[key] = value
hash[key][sub_hash_key] = contact_data_array[0]

this works manually using fields array and contact_data array:
contacts["Joe Smith"][fields_array[0]] = contact_data_array[0]
contacts["Joe Smith"][fields_array[1]] = contact_data_array[1]
contacts["Joe Smith"][fields_array[2]] = contact_data_array[2]
=end

# YAY!  Not the official solution, but this works programatically to insert index i
3.times do |i|
  contacts["Joe Smith"][fields_array[i]] = contact_data_array[i]
end

# official solution to part 1
contacts.each do |name, hash|
  fields_array.each do |field|
    hash[field] = contact_data_array.shift
  end
end

# print and truth test
p contacts
p contacts == {"Joe Smith"=>{:email=>"joe@email.com", :address=>"123 Main st.", :phone=>"555-123-4567"}}

# Expected output:
#  {
#    "Joe Smith"=>{:email=>"joe@email.com", :address=>"123 Main st.", :phone=>"555-123-4567"}
#  }

