def center_of(string)
  length = string.length
  half_length = string.length / 2.to_f
  if length.odd?
    string[half_length]
  else
    string[half_length - 0.5] + string[half_length + 0.5]
  end
end

# output examples
p center_of('I love ruby')
p center_of('Launch School')
p center_of('Launch')
p center_of('Launchschool')
p center_of('x')

# test examples
p center_of('I love ruby') == 'e'
p center_of('Launch School') == ' '
p center_of('Launch') == 'un'
p center_of('Launchschool') == 'hs'
p center_of('x') == 'x'
