# My Solution

# Replace the two `method_name` placeholders with actual method calls
# In other words, define the conversion method definition
# My Approach: use the chain of `to_s.to_i` and pass 8 as an argument to `String#to_s` to convert base 10 Integer to a base 8 Integer

def convert_to_base_8(n)
  n.to_s(8).to_i
end

# Replace `argument` with the correct argument below
# `method` is `Object#method`, not a placeholder
# In other words, convert the `convert_to_base_8` method into a saved "chunk of code", in this case a Proc object
# My Approach: this needs to be the `convert_to_base_8` method as it turns a method to a proc but written as a symbol `:convert_to_base_8`

base8_proc = method(:convert_to_base_8).to_proc

# We'll need a Proc object to make this code work
# Replace `a_proc` with the correct object
# In other words, convert the `base8_proc` proc back into a block using `Symbol#to_proc` method i.e. `&:symbol`

p [8, 10, 12, 14, 16, 33].map(&base8_proc)

# [10, 12, 14, 16, 20, 41]

# LS Solution

def convert_to_base_8(n)
  n.to_s(8).to_i
end

base8_proc = method(:convert_to_base_8).to_proc

[8, 10, 12, 14, 16, 33].map(&base8_proc) # => [10, 12, 14, 16, 20, 41]

=begin
Discussion
Let's start with our convert_to_base_8 method. Notice that this method takes a number-like argument, n. We also see that to_s(n) is using a number-like argument as well. This seems like a good place to start. We'll find that this form of to_s converts integers into the String representation of a base-n number.

Right now, we use decimals (base 10), so to convert a number n to base 8, we call to_s(8) on it. If we take 8 as an example, then calling 8.to_s(8) returns "10". But, from the expected return value, we can see that we want an Integer, not a String. Therefore, we also need to call to_i on the return value of n.to_s(8).

Next, let's handle the missing pieces of this line:

base8_proc = method(argument).to_proc
Based on the information from the "Approach/Algorithm" section, we know to research method from class Object. After looking at that documentation, we see that a symbol of an existing method may be passed into method method(sym). If we do that, the functionality of that method gets wrapped in a Method object, and we may now do work on that object.

We want to convert our array of numbers to base 8, so it makes sense to make a method object out of the convert_to_base_8 method. This leaves us with:

base8_proc = method(:convert_to_base_8).to_proc
The final piece of this exercise asks us fill in this line. [8,10,12,14,16,33].map(&a_proc). We want access to the functionality of method convert_to_base_8, and we know that it has been converted to a Proc object, so that Proc is the natural choice. Remember that using just & (and not &:) lets us turn a Proc object to a block. A block that can now be used with map.

There. All done. One last piece of information that may be good to mention is how a method looks when converted to a Proc. You can imagine the conversion to look like that:

def convert_to_base_8(n)
  n.to_s(8).to_i
end

# ->

Proc.new { |n| n.to_s(8).to_i }
#when we use & to convert our Proc to a block, it expands out to...

# ->
[8, 10, 12, 14, 16, 33].map { |n| n.to_s(8).to_i }
=end

