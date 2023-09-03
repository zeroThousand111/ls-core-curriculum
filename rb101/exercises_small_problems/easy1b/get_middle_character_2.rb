def center_of(string)
  character_array = string.chars
  length = character_array.length
  half_length = length / 2
  if character_array.length.even?
    return character_array[(half_length - 1), 2].join
  else
    return character_array[half_length]
  end
end

# print tests
p center_of('I love ruby')
p center_of('Launch School') 
p center_of('Launch')
p center_of('Launchschool')
p center_of('x')

# final tests
p center_of('I love ruby') == 'e'
p center_of('Launch School') == ' '
p center_of('Launch') == 'un'
p center_of('Launchschool') == 'hs'
p center_of('x') == 'x'