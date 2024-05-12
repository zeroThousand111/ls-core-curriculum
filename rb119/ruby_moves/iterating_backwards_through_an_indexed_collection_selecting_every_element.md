## Iterating Backwards Through an Indexed Collection, Selecting Every Element

**The task:**  Sequentially select every element in a collection from the highest index number to the lowest.

**Notes:**  You might want to do something with each element when it is selected, such as output it, interpolate it into a string or push it to a new array collection.  For the sake of simplicity, in the case of these code snippet illustrations, the selected element is passed as an argument to the `Kernel#p` method and is output to the console.

**Example collections:**

`array = [0, 1, 2, 3, 4]`

<img src="https://i.imgur.com/Uw09beT.gif" width="500" />

**Expected output:**

```
# => 5
# => 4
# => 3
# => 2
# => 1
```

`string = "hello"`

<img src="https://i.imgur.com/iPRDiFM.gif" width="500" />

**Expected output:**

```
# => "o"
# => "l"
# => "l"
# => "e"
# => "h"
```

### Using Loops
#### Using A Simple Loop

```ruby
array = [0, 1, 2, 3, 4]

index = array.size - 1
loop do
  p array[index]
  index -= 1 # aka index = index -= 1
  break if index < 0
end

string = "hello"

index = string.length - 1
loop do
  p string[index]
  index -= 1
  break if index < 0
end
```

#### Using a While Loop

```ruby
array = [0, 1, 2, 3, 4]

index = array.size - 1
while index > -1 do
  p array[index]
  index -= 1
end

string = "hello"

index = string.length - 1
while index > -1 do
  p string[index]
  index -= 1
end
```

#### Using an Until Loop

```ruby
array = [0, 1, 2, 3, 4]

index = array.size - 1
until index < 0 do
  p array[index]
  index -= 1
end

string = "hello"

index = string.length - 1
until index < 0 do
  p string[index]
  index -= 1
end
```

#### Using a For Loop

```ruby
# for loops don't iterate in reverse index order so can't be used to perform this task
```

### Using Iterating Ruby Methods

#### Using `#reverse_each`

```ruby
array = [0, 1, 2, 3, 4]

array.reverse_each do |element|
  p element
end

# there is no reverse_each_char method, but a chain of #reverse.each_char will work the same way for a string

string = "hello"

string.reverse.each_char do |char|
  p char
end
```

#### Using `Integer#downto`

```ruby
array = [0, 1, 2, 3, 4]

array.size.downto(0) do |index|
  p array[index]
end

string = "hello"

string.length.downto(0) do |index|
  p string[index]
end
```

#### Using `Integer#times`

This is a bit convoluted, but I include it for comparison with how to use `Integer#times` to iterate through a collection forwards.

```ruby
array = [0, 1, 2, 3, 4]

array.size.times do |index|
  reverse_index = array.size - index - 1
  p array[reverse_index]
end

string = "hello"

string.size.times do |index|
  reverse_index = string.length - index - 1
  p string[reverse_index]
end
```

**None of these options are inherently better than the others.  The circumstances will dictate which might be the most appropriate to use.**