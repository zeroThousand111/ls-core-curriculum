a = ['white snow', 'winter wonderland', 'melting ice',
     'slippery sidewalk', 'salted roads', 'white trees']

new_array = a.map do | word |
  word.split(" ")
end

p new_array.flatten

p new_array