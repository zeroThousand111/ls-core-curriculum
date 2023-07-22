# main method
def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  return false unless is_four_numbers?(dot_separated_words)
  while dot_separated_words.size > 0 do
    number = dot_separated_words.pop
    return false unless is_an_ip_number?(number)
  end
  true
end

# helper method
def is_an_ip_number?(number)
  number == number.to_i.to_s
end

def is_four_numbers?(array)
  array.length == 4
end


# tests
p dot_separated_ip_address?("1.2.3.4") == true
p dot_separated_ip_address?("1.2.3") == false
p dot_separated_ip_address?("1.2.3.4.5") == false
p dot_separated_ip_address?("b.a.c.z") == false
