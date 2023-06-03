array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

p new_array = array.select { |e| e.odd? }
p new_array.push(11)
p new_array.unshift(0)
new_array.pop
p new_array.push(3)
p new_array.uniq!