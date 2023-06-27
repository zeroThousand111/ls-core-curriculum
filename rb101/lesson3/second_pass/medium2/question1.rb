a = "forty two"
b = "forty two"
c = a

puts a.object_id # ID1
puts b.object_id # ID2 - b is a different object with the same value as a
puts c.object_id # ID1