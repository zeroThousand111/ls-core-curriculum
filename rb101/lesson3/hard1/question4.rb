# def dot_separated_ip_address?(input_string)
#   dot_separated_words = input_string.split(".")
#   while dot_separated_words.size > 0 do
#     word = dot_separated_words.pop
#     break unless is_an_ip_number?(word)
#   end
#   return true
# end

# def dot_separated_ip_address?(input_string)
#   dot_separated_words = input_string.split(".")
#   if dot_separated_words.size != 4
#     return false
#   else
#     while dot_separated_words.size > 0 do
#       word = dot_separated_words.pop
#     return false if !is_an_ip_number?(word)
#     end
#   end
#   return true
# end

def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  is_four_groups?(dot_separated_words) && is_valid_characters?(dot_separated_words)
end

def is_four_groups?(array)
  array.size != 4 ? false : true
end

def is_valid_characters?(array)
  while array.size > 0 do
    word = array.pop
    return false if !is_an_ip_number?(word)
  end
  return true
end

def is_an_ip_number?(string)
	string.to_i.between?(0, 255)
end

# true test input:
p dot_separated_ip_address?("10.4.5.11")
p dot_separated_ip_address?("00.00.0.000")

# false test input:
p dot_separated_ip_address?("aa.bb.cc")
p dot_separated_ip_address?("this.should.not.work.at.all")
p dot_separated_ip_address?("4.5.5")
p dot_separated_ip_address?("1.2.3.4.5")
