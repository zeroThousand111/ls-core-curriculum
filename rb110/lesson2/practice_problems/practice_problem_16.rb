def random_hex
  rand(0..15).to_s(16)
end

def create_section(int)
  section_array = []
  counter = 0
  
  loop do
    section_array << random_hex
    counter += 1
    break if counter == int
  end
  
  section_array.join
end

def create_UUID
  create_section(8) + '-' + create_section(4) + '-' + create_section(4) + '-' + create_section(4) + '-' + create_section(12)
end

# print tests for helper methods
# p random_hex
# p create_section(8)

p create_UUID