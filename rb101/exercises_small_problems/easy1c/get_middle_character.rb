# answer with an if statement
# def center_of(string)
#   if string.length.odd?
#     return string[string.length / 2]
#   else
#     return string[((string.length / 2) - 1)..(string.length / 2)]
#   end
# end


# answer with a ternary operator
def center_of(string)
  string.length.odd? ? string[string.length / 2] : string[((string.length / 2) - 1)..(string.length / 2)]
end

# tests
p center_of('Launch School') # ' '
p center_of('Launchschool') # 'hs'
p center_of('x') #'x'


# truth tests
p center_of('I love ruby') == 'e'
p center_of('Launch School') == ' '
p center_of('Launch') == 'un'
p center_of('Launchschool') == 'hs'
p center_of('x') == 'x'