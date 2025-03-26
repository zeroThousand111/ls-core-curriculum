=begin
Modify the method below so that the display/output of items is moved to a block, and its implementation is left up to the user of the gather method.

items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  puts "#{items.join(', ')}"
  puts "Nice selection of food we have gathered!"
end
=end

# My Solution - I answered a different question and saved the output to a proc that I could pass around, even passing it out of the method invocation by returning it

items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  proc_object = Proc.new {items.join(', ')}
  # puts "#{proc_object.call}" # optional way of outputting the string in the block
  puts "Nice selection of food we have gathered!"
  proc_object
end

p gather(items)

p gather(iterms).call # => "apples, corn, cabbage, wheat"

# LS Solution - sandwhich code (I didn't implement this)

items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "Nice selection of food we have gathered!"
end

gather(items) { |produce| puts produce.join('; ') }

=begin
Discussion
To accomplish our task, we need to yield the items array to a block. Moving the implementation of our items formatting to a block gives the user more flexibility and choice for how they wish to use gather. By yielding items to a block, the user can join those items for presentation purposes or they can choose a completely different representation For example:

gather(items) do |produce|
  puts "We've gathered some vegetables: #{produce[1]} and #{produce[2]}"
end
=end
