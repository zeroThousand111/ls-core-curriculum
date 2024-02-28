=begin
What will the following code print, and why? Don't run the code until you have tried to answer.
=end

p array1 = %w(Moe Larry Curly Shemp Harpo Chico Groucho Zeppo)
array2 = []
array1.each { |value| array2 << value }
array1.each { |value| value.upcase! if value.start_with?('C', 'S') }
puts array2

=begin
On line 5, a local variable array1 is created and is assigned an array of 8 strings using percent string literal.
On line 6, a local variable array2 is created and is assigned an empty array.
On line 7, #each is invoked upon array1 and in turn this shovels each element of array1 onto array2
On line 8, #each is again invoked upon array1 and this invokes the #upcase! method upon those elements that begin with a capital 'C' or 'S'.  This will mean the elements in array1 are mutatated to CURLY SHEMP CHICO but the other elements are left alone.  #upcase! mutates the calling object; it doesn't return a new string.
On line 9 the array referenced by array2 is passed to the Kernel#puts method

What is output?  The key question is are the elements of array1 shared by array2 and so have 'Curly', 'Shemp' and 'Chico' been capitalised in array2?

I would say YES.  So I would say that the array referenced by array2 is:

array2 = ["Moe", "Larry", "CURLY", "SHEMP", "Harpo", "CHICO", "Groucho", "Zeppo"]

This is because the elements of array1 are shared with array2.  This is an example of SHALLOW COPY.  Mimicking DEEP COPY in Ruby is not straightforward.

But the nub of the issue is that on line 7 shovelling each element of array1 onto array2 doesn't copy them, it creates a reference to them.  It is acting as a pass by reference language in this situation, not a pass by value.
=end