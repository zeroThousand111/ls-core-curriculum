## Iterating Forwards Through a Collection, Skipping Some Elements Using The `next` Keyword

**The task:**  Sequentially move forwards through a collection and select only those elements that fulfil the chosen selection criteria by skipping those elements that don't fulfil them using the keyword `next`.  This means defining the `if` modifier after `next` *in negative terms*: e.g. if you want to only select odd integers, you will want to skip selection if the integer is even.

**Notes:**  You might want to do something with each element when it is selected, such as output it, interpolate it into a string or push it to a new array collection.  For the sake of simplicity, in the case of these code snippet illustrations, the selected element is passed as an argument to the `Kernel#p` method and is output to the console.  Each snippet may return a different value.

**Example collections and criteria:**

`array = [1, 2, 3, 4, 5]` - only select those elements that are odd

<img src="https://i.imgur.com/pRvmRyt.gif" width="500" />

`string = "hello"` - only select the consonants

<img src="https://i.imgur.com/Jq6j6J8.gif" width="500" />

### Using Loops
#### Using A Simple Loop

The `break` expression needs to start at the beginning, making this simple loop like a `while` loop, rather than a `do/while` loop.  Otherwise, the loop may not break out when intended and an object outside the index range of the collection (i.e. `nil`) be selected by element reference and then have a method invoked upon it, which will raise a `NoMethodError` exception.

The incrementing index value is at the beginning of the loop to prevent the loop becoming infinite (if a `next` keyword causes the loop to skip without incrementing the value of `index`).  As a result, `index` needs to be initialised at `-1` to account for this change in position.

```ruby
array = [1, 2, 3, 4, 5]

index = -1
loop do
  break if index == array.size - 1
  index += 1 # aka index = index + 1
  next if array[index].even?
  p array[index]
end

string = "hello"

index = -1
loop do
  break if index == string.length - 1
  index += 1
  next if string[index].match?(/[aeiou]/)
  p string[index]
end
```

It is easier to use an if modifier with element reference and define the selection in positive terms with simple loops:

```ruby
array = [1, 2, 3, 4, 5]

index = 0
loop do
  p array[index] if array[index].odd? # positive selection
  index += 1 # aka index = index + 1
  break if index == array.size
end

string = "hello"

index = 0
loop do
  p string[index] if string[index].match?(/[^aeiou]/) # positive selection
  index += 1
  break if index == string.length
end
```

#### Using A While Loop

```ruby
array = [1, 2, 3, 4, 5]

index = -1
while index < array.size - 1 do
  index += 1
  next if array[index].even?
  p array[index]
end

string = "hello"

index = -1
while index < string.length - 1 do
  index += 1
  next if string[index].match?(/[aeiou]/)
  p string[index]
end
```

#### Using An Until Loop

```ruby
array = [1, 2, 3, 4, 5]

index = -1
until index == array.size - 1 do
  index += 1
  next if array[index].even?
  p array[index]
end

string = "hello"

index = -1
until index == string.length - 1 do
  index += 1
  next if string[index].match?(/[aeiou]/)
  p string[index]
end
```

#### Using A For Loop

```ruby
array = [1, 2, 3, 4, 5]

for number in array
  next if number.even?
  p number
end

string = "hello"
# for loops won't iterate through a string in ruby
```

### Using Iterating Ruby Methods

#### Using `#each` or `#each_char`

```ruby
array = [1, 2, 3, 4, 5]

array.each do |element|
  next if element.even?
  p element
end

string = "hello"

string.each_char do |char|
  next if char.match?(/[aeiou]/)
  p char
end
```

#### Using `Integer#upto`

```ruby
array = [1, 2, 3, 4, 5]

0.upto(array.size - 1) do |index|
  next if array[index].even?
  p array[index]
end

string = "hello"

0.upto(string.length - 1) do |index|
  next if string[index].match?(/[aeiou]/)
  p string[index]
end
```

#### Using `Integer#times`

```ruby
array = [1, 2, 3, 4, 5]

array.size.times do |index|
  next if array[index].even?
  p array[index]
end

string = "hello"

string.length.times do |index|
  next if string[index].match?(/[aeiou]/)
  p string[index]
end
```

**None of these options are inherently better than the others.  The circumstances will dictate which might be the most appropriate to use.**