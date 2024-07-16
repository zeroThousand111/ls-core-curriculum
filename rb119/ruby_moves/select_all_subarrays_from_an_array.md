## Select All Subarrays from an Array

**The task:**  Sequentially select every possible subarray in an array.  Assume the elements of the array stay in a fixed order.

**Notes:**  You might want to do something with each subarray when it is selected, such as output it or push it to a new array collection.  For the sake of consistency, in the case of these code snippet illustrations, the selected subarray is shovelled as an argument by the `Array#<<` method to an empty collecting array which is output to the console at the end using pretty print `Kernel#pp`.  Whilst the actions are the same, each code snippet may *return* a different value.

This is a similar problem to [selecting every substring from a string](https://github.com/zeroThousand111/ls-core-curriculum/blob/main/rb119/ruby_moves/select_all_substrings_from_a_string.md), because both strings and arrays are indexed collections.

**Example collections and criteria:** `array = [0, 1, 2, 3, 4]`

<img src="https://i.imgur.com/cn6sjCG.gif" width="500" />

**Expected output:**
```
[[0],
 [0, 1],
 [0, 1, 2],
 [0, 1, 2, 3],
 [0, 1, 2, 3, 4],
 [1],
 [1, 2],
 [1, 2, 3],
 [1, 2, 3, 4],
 [2],
 [2, 3],
 [2, 3, 4],
 [3],
 [3, 4],
 [4]]
```

### Two Selection Strategies

I've used two strategies to select subarrays using array element reference: 
1. Passing an index range `start_index..stop_index` to `Array#slice`;
2. Passing a start index argument and a length argument to `Array#slice`.

Because of ruby's syntactic sugar, `Array#slice` can also be written `Array#[]`, which is the syntax I use in the following code snippets.

### Using Loops

#### Using Two Nested Simple Loops and a Range Selection

The first loop controls the start of the range selection, the second controls the end.  Both loops break when the two index counters are comparable with the length of the string, and because the breaks are after the line where the indexes increment, that happens to be the final index number of the string plus 1.

```ruby
array = [0, 1, 2, 3, 4]
array_of_subarrays = []

start_index = 0
loop do
  stop_index = start_index
  loop do
    array_of_subarrays << array[start_index..stop_index]
    stop_index += 1
    break if stop_index == array.size
  end
  start_index += 1 
  break if start_index == array.size
end

pp array_of_subarrays
```

#### Using Two Nested Simple Loops and a Start/Length Selection
This is the same structure as the snippet above, but using passing a start index argument and a length argument to the  `Array#slice` method invocation.  This requires a `max_length` variable that decrements on every repeat of the loop.

```ruby
array = [0, 1, 2, 3, 4]
array_of_subarrays = []

start_index = 0
max_length = array.size

loop do
  length = 1
  loop do
    array_of_subarrays << array[start_index, length] # aka array.slice(start_index, length)
    length += 1
    break if length > max_length
  end
  start_index += 1
  max_length -= 1
  break if start_index == array.size
end

pp array_of_subarrays
```

#### Using Two Nested While Loops and a Range Selection

```ruby
array = [0, 1, 2, 3, 4]
array_of_subarrays = []

start_index = 0
while start_index < array.size do
  stop_index = start_index
  while stop_index < array.size do
    array_of_subarrays << array[start_index..stop_index]
    stop_index += 1
  end
  start_index += 1   
end

pp array_of_subarrays
```

#### Using Two Nested Until Loops and a Range Selection

```ruby
array = [0, 1, 2, 3, 4]
array_of_subarrays = []

start_index = 0
until start_index == array.size do
  stop_index = start_index
  until stop_index == array.size do
    array_of_subarrays << array[start_index..stop_index]
    stop_index += 1
  end
  start_index += 1   
end

pp array_of_subarrays
```

### Using Iterating Ruby Methods

#### Using `#each_with_index` with a Nested Simple Loop and Start/Length Selection

It works, but this is not pretty.  Its a modified version of using two nested simple loops and an `Array#slice` selection, but using `Enumerable#each_with_index` to recreate the outer loop.  The same could be achieved by the method chain `#chars.each_with_index`.  I've labelled the block parameter for each character `char`, but it isn't actually used by the block.

```ruby
array = [0, 1, 2, 3, 4]
array_of_subarrays = []

max_length = array.size

array.each_with_index do |num, index|
  length = 1
  loop do
    array_of_subarrays << array[index, length] # aka array.slice(start_index, length)
    length += 1
    break if length > max_length
  end
  max_length -= 1
end

pp array_of_subarrays
```

#### Using Two Nested `Integer#upto` Method Invocations and a Range Selection

This is the most succinct of the options and is readable too.

```ruby
array = [0, 1, 2, 3, 4]
array_of_subarrays = []

0.upto(array.size - 1) do |start_index|
  start_index.upto(array.size - 1) do |stop_index|
    array_of_subarrays << array[start_index..stop_index]
  end
end

pp array_of_subarrays
```

To make it even more readable, extract the size of the array to a local variable `last_index`:

```ruby
array = [0, 1, 2, 3, 4]
array_of_subarrays = []
last_index = array.size - 1

0.upto(last_index) do |start_index|
  start_index.upto(last_index) do |stop_index|
    array_of_subarrays << array[start_index..stop_index]
  end
end

pp array_of_subarrays
```

#### Using Two Nested `Integer#upto` Method Invocations and  Start/Length Selection

```ruby
array = [0, 1, 2, 3, 4]
array_of_subarrays = []

max_length = array.size

0.upto(array.size - 1) do |start_index|
  1.upto(max_length) do |length|
    array_of_subarrays << array[start_index, length]
  end
  max_length -= 1
end

pp array_of_subarrays
```

#### Using a `Integer#upto` Nested In An `Integer#times` Method Invocation and Start/Length Selection

```ruby
array = [0, 1, 2, 3, 4]
array_of_subarrays = []

max_length = array.size

(array.size).times do |start_index|
  1.upto(max_length) do |length|
    array_of_subarrays << array[start_index, length]
  end
  max_length -= 1
end

pp array_of_subarrays
```


#### Using Nested `#each` Methods on a Range Value

This is also nice and succinct, but you have to remember to use an inclusive range `..` on the outer loop for the `start_index` and an exclusive range `...` on the inner loop for the `end_index`.

```ruby
array = [0, 1, 2, 3, 4]
array_of_subarrays = []
  (0..array.size).each do |start_index|
    (start_index...array.size).each do |end_index|
    array_of_subarrays << array[start_index..end_index]
  end
end 

pp array_of_subarrays
```
#### Using `Enumerable#each_cons`

This uses an incrementing method local variable `length`  in an `#upto` method invocation to invoke the `#each_cons` method with an Integer argument that increases from 1 to the size of the array.  It produces the expected output, but the subarrays are ordered differently to the other methods above.

```ruby
array = [0, 1, 2, 3, 4]
collection = []

1.upto(array.size) do |length|
  array.each_cons(length) do |subarray|
    collection << subarray
  end
end
```
