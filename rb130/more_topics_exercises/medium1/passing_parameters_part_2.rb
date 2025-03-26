=begin
Passing Parameters Part 2
Ruby gives us a lot of flexibility when assigning arrays to variables. If we want to assign the entire array to a single variable, we can do that:

birds = %w(raven finch hawk eagle)
p birds # => ['raven','finch','hawk','eagle']
If we want to assign every element to a separate variable, we can do that too:

raven, finch, hawk, eagle = %w(raven finch hawk eagle)
p raven # => 'raven'
p finch # => 'finch'
p hawk # => 'hawk'
p eagle # => 'eagle'
Suppose we want to organize our array contents into groups, where variables represent category names. Can we do that without extracting items directly from the array based on their indices?

We can use the splat operator(*) to do something like this:

raven, finch, *raptors = %w(raven finch hawk eagle)
p raven # => 'raven'
p finch # => 'finch'
p raptors  # => ['hawk','eagle']
Based on the examples shown above, write a method that takes an array as an argument. The method should yield the contents of the array to a block, which should assign your block parameters in such a way that it ignores the first two elements, and groups all remaining elements as a raptors array.
=end

# My Solution 1a - just testing it out

def method(array)
  first_element = array[0]
  second_element = array[1]
  yield(first_element, second_element, array[2..-1])
end

# My Solution 1b - refactored
def method(array)
  first_element, second_element, *rest = array[0], array[1], array[2..-1]
  yield(first_element, second_element, rest.first)
end

def method(array)
  yield array
end

method([1, 2, 3, 4, 5]) { |el1, el2, *arr| puts "Ignore the first and second, the rest are #{arr}" }

# My Solution 3 - after the fact - these problems are ambiguously worded!

birds = ['crow', 'finch', 'hawk', 'eagle']

def sing_birds(birds)
  yield birds
end

# LS Solution

birds = ['crow', 'finch', 'hawk', 'eagle']

def types(birds)
  yield birds
end

types(birds) { |_, _, *rest| puts rest}

# hawk
# eagle

types(birds) do |_, _, *raptors|
  puts "Raptors: #{raptors.join(', ')}."
end

=begin
Discussion
For our solution, we start with an array named birds. It contains four birds, where two of them are raptors. Above we use our block variables to organize it further. When we yield birds to the block, Ruby assigns the individual elements of birds to the different block variables. It assigns the first two birds, "crow" and "finch," to _; the underscore tells Ruby that we aren't interested in those values. The splat operator on the name block variable tells Ruby to treat it as an Array and assign all remaining arguments to it. Here, we group the last two elements from birds into the array, raptors.

For demonstration purposes, we join the two array elements and output them to the screen as:

Raptors: hawk, eagle
=end

