# method
def center_of(string)
  half_string = (string.length / 2)
  if string.length.odd?
    return string[half_string]
  else
    return string[half_string - 1, 2]
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