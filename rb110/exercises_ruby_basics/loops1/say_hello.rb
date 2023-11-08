say_hello = true
counter = 1

while say_hello
  puts 'Hello!'
  counter += 1
  if counter > 5 then say_hello = false end
end