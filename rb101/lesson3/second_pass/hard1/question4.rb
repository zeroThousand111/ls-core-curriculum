=begin
Ben was tasked to write a simple ruby method to determine if an input string is an IP address representing dot-separated numbers. e.g. "10.4.5.11". He is not familiar with regular expressions. Alyssa supplied Ben with a method called is_an_ip_number? that determines if a string is a numeric string between 0 and 255 as required for IP numbers and asked Ben to use it.

Alyssa reviewed Ben's code and says "It's a good start, but you missed a few things. You're not returning a false condition, and you're not handling the case that there are more or fewer than 4 components to the IP address (e.g. "4.5.5" or "1.2.3.4.5" should be invalid)."

Help Ben fix his code.
=end

# Alyssa's probable helper method
def is_an_ip_number?(num)
  (0..255).cover?(num.to_i)
end

# main method
def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".") # splits to an array of strings
  return false if dot_separated_words.size != 4
  while dot_separated_words.size > 0 do # while array of strings has more than zero elements
    word = dot_separated_words.pop # take last element of array of strings
    break unless is_an_ip_number?(word)
    return true
  end
  return false
end

# test cases for Alyssa's helper method
# p is_an_ip_number?("0")
# p is_an_ip_number?("100")
# p is_an_ip_number?("300")
# p is_an_ip_number?("-300")

# test cases for main method
  # should evaluate to true
p dot_separated_ip_address?("1.2.3.4")
p dot_separated_ip_address?("10.20.30.40")

  # should evaluate to false
p dot_separated_ip_address?("4.5.5")
p dot_separated_ip_address?("1.2.3.4.5")
