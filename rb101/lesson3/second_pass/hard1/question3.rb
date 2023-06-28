=begin
Question 3

In other practice problems, we have looked at how the scope of variables affects the modification of one "layer" when they are passed to another.

To drive home the salient aspects of variable scope and modification of one scope by another, consider the following similar sets of code.

What will be printed by each of these code groups?
=end

# # A)
# def mess_with_vars(one, two, three)
#   one = two
#   two = three
#   three = one
# end

# one = "one"
# two = "two"
# three = "three"

# mess_with_vars(one, two, three)

# puts "one is: #{one}" # 'one'
# puts "two is: #{two}" # 'two'
# puts "three is: #{three}" # 'three'
# this is because the variables in outer scope have not been affected by the reassignment in the inner scope of the method

# B)
# def mess_with_vars(one, two, three)
#   one = "two"
#   p one.object_id
#   two = "three"
#   three = "one"
# end

# one = "one"
# p one.object_id
# two = "two"
# three = "three"

# mess_with_vars(one, two, three)

# puts "one is: #{one}"
# puts "two is: #{two}"
# puts "three is: #{three}"

# this is exactly the same situation as A), the reassignment in the method hasn't mutated the objects pointed to by the variables in outer scope

# C)
def mess_with_vars(one, two, three)
  one.gsub!("one","two")
  two.gsub!("two","three")
  three.gsub!("three","one")
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}" # 'two'
puts "two is: #{two}" # 'three'
puts "three is: #{three}" # 'one'

# This is different because String#gsub! is a mutating method.