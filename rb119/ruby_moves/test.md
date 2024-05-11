## Iterating Forwards Through a Collection, Selecting Every Element

Sequentially select every element in a collection from the lowest index number to the highest.  You might want to do something with each element, such as output it, interpolate it into a string or push it to a new array collection.

Example collections:

`array = [1, 2, 3, 4, 5]`

<picture>
 <source media="(prefers-color-scheme: dark)" srcset="https://i.imgur.com/IcXWx0A.gif">
 <source media="(prefers-color-scheme: light)" srcset="https://i.imgur.com/IcXWx0A.gif">
 <img alt="A gif animation of each element of an array of integers [0, 1, 2, 3, 4] being selected sequentially in a forwards motion" src="https://i.imgur.com/IcXWx0A.gif">
</picture>

`string = "hello"`

<picture>
 <source media="(prefers-color-scheme: dark)" srcset="https://i.imgur.com/iVgZds7.gif">
 <source media="(prefers-color-scheme: light)" srcset="https://i.imgur.com/iVgZds7.gif">
 <img alt="A gif animation of a string object "hello" where each character is selected sequentially in a forwards motion" src="https://i.imgur.com/iVgZds7.gif">
</picture>

### Using Loops
#### Using A Simple Loop

```ruby
array = [1, 2, 3, 4, 5]

index = 0
loop do
  array[index]
  index += 1 # aka index = index += 1
  break if index == array.size
end

string = "hello"

index = 0
loop do
  string[index]
  index += 1 # index = index += 1
  break if index == string.length
end
```

#### Using a While Loop

```ruby
array = [1, 2, 3, 4, 5]

index = 0
while index < array.size do
  array[index]
  index += 1 # aka index = index += 1
end

string = "hello"

index = 0
while index < string.length do
  string[index]
  index += 1 # index = index += 1
end
```

#### Using an Until Loop

```ruby
array = [1, 2, 3, 4, 5]

index = 0
until index >= array.size do
  array[index]
  index += 1 # aka index = index += 1
end

string = "hello"

index = 0
until index >= string.length do
  string[index]
  index += 1 # index = index += 1
end
```

#### Using a For Loop

```ruby
array = [1, 2, 3, 4, 5]

for number in array
  number
end

string = "hello"
# for loops won't iterate through a string in ruby
```

### Using Iterating Ruby Methods

#### Using `#each` or `#each_char`

```ruby
array = [1, 2, 3, 4, 5]

array.each do |element|
  element
end

string = "hello"

string.each_char do |char|
  char
end
```

#### Using `Integer#upto`

```ruby
array = [1, 2, 3, 4, 5]

0.upto(array.size) do |index|
  array[index]
end

string = "hello"
0.upto(string.length) do |index|
  string[index]
end
```

#### Using `Integer#times`

```ruby
array = [1, 2, 3, 4, 5]

array.size.times do |index|
  array[index]
end

string = "hello"
string.size.times do |index|
  string[index]
end
```

**None of these options are better than the others or best.  The circumstances will dictate which might be most appropriate to use.**

---