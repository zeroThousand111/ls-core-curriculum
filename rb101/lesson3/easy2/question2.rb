def four_transforms(string)
  puts string.swapcase
  puts string.gsub('M', 'm')
  # string[4] = 'm'
  # puts string
  puts string.downcase
  puts string.upcase
end

munsters_description = "The Munsters are creepy in a good way."

four_transforms(munsters_description)
