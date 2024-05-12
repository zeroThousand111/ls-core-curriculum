## Iterating Forwards Through an Indexed Collection, Selecting Every Element

**The task:**  Sequentially select every element in an indexed collection from the lowest index number to the highest.  

**Notes:**  You might want to do something with each element when it is selected, such as output it, interpolate it into a string or push it to a new array collection.  For the sake of simplicity, in the case of these code snippet illustrations, the selected element is passed as an argument to the `Kernel#p` method and is output to the console.  Each snippet may return a different value.

**Example collections:**

`array = [0, 1, 2, 3, 4]`

<img src="https://i.imgur.com/IcXWx0A.gif" width="500" />

**Expected output:**

```
# => 1
# => 2
# => 3
# => 4
# => 5
```

`string = "hello"`

<img src="https://i.imgur.com/iVgZds7.gif" width="500" />

**Expected output:**

```
# => "h"
# => "e"
# => "l"
# => "l"
# => "o"
```


### Using Loops
#### Using A Simple Loop

```ruby
array = [0, 1, 2, 3, 4]

index = 0
loop do
  p array[index]
  index += 1 # aka index = index += 1
  break if index == array.size
end

string = "hello"

index = 0
loop do
  p string[index]
  index += 1 # index = index += 1
  break if index == string.length
end
```

#### Using a While Loop

```ruby
array = [0, 1, 2, 3, 4]

index = 0
while index < array.size do
  p array[index]
  index += 1
end

string = "hello"

index = 0
while index < string.length do
  p string[index]
  index += 1
end
```

#### Using an Until Loop

```ruby
array = [0, 1, 2, 3, 4]

index = 0
until index >= array.size do
  p array[index]
  index += 1
end

string = "hello"

index = 0
until index >= string.length do
  p string[index]
  index += 1
end
```

#### Using a For Loop

```ruby
array = [0, 1, 2, 3, 4]

for number in array
  p number
end

string = "hello"
# for loops won't iterate through a string in ruby
```

### Using Iterating Ruby Methods

#### Using `#each` or `#each_char`

```ruby
array = [0, 1, 2, 3, 4]

array.each do |element|
  p element
end

string = "hello"

string.each_char do |char|
  p char
end
```

#### Using `Integer#upto`

```ruby
array = [0, 1, 2, 3, 4]

0.upto(array.size) do |index|
  p array[index]
end

string = "hello"

0.upto(string.length) do |index|
  p string[index]
end
```

#### Using `Integer#times`

```ruby
array = [0, 1, 2, 3, 4]

array.size.times do |index|
  p array[index]
end

string = "hello"

string.size.times do |index|
  p string[index]
end
```

**None of these options are inherently better than the others.  The circumstances will dictate which might be the most appropriate to use.**