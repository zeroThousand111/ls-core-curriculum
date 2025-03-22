=begin
A binary tree is just one of many forms of collections, such as Arrays, Hashes, Stacks, Sets, and more. All of these collection classes include the Enumerable module, which means they have access to an each method, as well as many other iterative methods such as map, reduce, select, and more.

For this exercise, modify the Tree class to support the methods of Enumerable. You do not have to actually implement any methods -- just show the methods that you must provide.
=end

# My Solution

class Tree
  include Enumerable

  def initialize
    @things = [0, 1, 2]
  end

  def each
    for thing in @things
      yield(thing)
    end
  end
end

oak = Tree.new
oak.each { |thing| puts thing }
# 0
# 1
# 2

p oak.reduce { |acc, thing| acc + thing } #=> 3

=begin
I remember Phillip Knapp (TA) telling me that the Comparable module needed a `<=>` spaceship operator to be defined in the class.  And likewise, the Enumerable module needs an `#each` method to be defined for that class.  So our `Tree` class needs its own `#each` method.

I made up a bit of nonsense for the attribute of `Tree`s, `@things`, for something to output.

Having created `Tree#each`, I invoked `Enumerable#reduce` and didn't get a `NoMethodError`, so it worked!

Unless I'd had this conversation, I guess I would have had to search the ruby documentation to find this out.
=end

# LS Solution
class Tree
  include Enumerable

  def each
    ...
  end
end

=begin
Discussion
To provide most of the functionality of the Enumerable module, all you need to do is include Enumerable in your class, and define an each method that yields each member of the collection, one at a time.
=end
