# What is the result of the last line in the code below?

greetings = { a: 'hi' }
informal_greeting = greetings[:a]
informal_greeting << ' there'

puts informal_greeting  #  => "hi there"
puts greetings

# Line 3 creates a hash with one key-value pair
# line 4 creates the variable informal greeting that references the value of the key-value pair
# line 5 invokes the String#<< method upon the value of the key-value pair and passes it the argument ' there'.  This mutates the value in the hash.
# Therefore puts greetings on line 8 will output {a=> 'hi there'}