## Select All Substrings from a String

**The task:**  Sequentially select every possible substring in a string.  (Assume the characters of the string stay in a fixed order.)

**Notes:**  You might want to do something with each substring when it is selected, such as output it or push it to a new array collection.  For the sake of simplicity, in the case of these code snippet illustrations, the selected substring is passed as an argument to the `Kernel#p` method and is output to the console.  Each snippet may return a different value.

This is a similar task to [selecting all subarrays from an array](https://github.com/zeroThousand111/ls-core-curriculum/blob/main/rb119/ruby_moves/select_all_subarrays_from_an_array.md) and the solutions are similar.

**Example collections and criteria:** `string = "abcde"`

<img src="https://i.imgur.com/9d3viNn.gif" width="500" />

**Expected output:**
```
# => "a"
# => "ab"
# => "abc"
# => "abcd"
# => "abcde"
# => "b"
# => "bc"
# => "bcd"
# => "bcde"
# => "c"
# => "cd"
# => "cde"
# => "d"
# => "de"
# => "e"
```

### Two Selection Strategies

I've used two strategies to select substrings using string element reference: 
1. Passing an index range `start_index..stop_index` to `String#slice`;
2. Passing a start index argument and a length argument to `String#slice`.

Because of ruby's syntactic sugar, `String#slice` can also be written `#[]`, which is the syntax I use in the following code snippets.

### Using Loops
#### Using Two Nested Simple Loops and a Range Selection

The first loop controls the start of the range selection, the second controls the end.  Both loops break when the two index counters are comparable with the length of the string, and because the breaks are after the line where the indexes increment, that happens to be the final index number of the string plus 1.

```ruby
string = "abcde"

start_index = 0
loop do
  stop_index = start_index
  loop do
    p string[start_index..stop_index]
    stop_index += 1 # aka stop_index = stop_index + 1
    break if stop_index == string.length
  end
  start_index += 1 
  break if start_index == string.length
end
```

#### Using Two Nested Simple Loops and a Start/Length Selection
This is the same structure as the snippet above, but using passing a start index argument and a length argument to the  `String#slice` method invocation.  This requires a `max_length` variable that decrements on every repeat of the loop.

```ruby
string = "abcde"

start_index = 0
max_length = string.length

loop do
  length = 1
  loop do
    p string[start_index, length] # aka string.slice(start_index, length)
    length += 1
    break if length > max_length
  end
  start_index += 1
  max_length -= 1
  break if start_index == string.length
end
```

#### Using Two Nested While Loops and a Range Selection

```ruby
string = "abcde"

start_index = 0
while start_index < string.length do
  stop_index = start_index
  while stop_index < string.length do
    p string[start_index..stop_index]
    stop_index += 1
  end
  start_index += 1   
end
```

#### Using Two Nested Until Loops and a Range Selection

```ruby
string = "abcde"

start_index = 0
until start_index == string.length do
  stop_index = start_index
  until stop_index == string.length do
    p string[start_index..stop_index]
    stop_index += 1
  end
  start_index += 1   
end
```

#### Using A For Loop

```ruby
string = "abcde"
# for loops won't iterate through a string in ruby
```

### Using Iterating Ruby Methods

#### Using `#each_char` with a Nested Simple Loop and Start/Length Selection

It works, but this is not pretty.  Its a modified version of using two nested simple loops and a `String#slice` selection, but using a chain of `String#each_char` and `Array#with_index` to recreate the outer loop.  The same could be achieved by the method chain `#chars.each_with_index`.  I've labelled the block parameter for each character `char`, but it isn't actually used by the block.

```ruby
string = "abcde"

max_length = string.length

string.each_char.with_index do |char, index|
  length = 1
  loop do
    p string[index, length] # aka string.slice(start_index, length)
    length += 1
    break if length > max_length
  end
  max_length -= 1
end
```

#### Using Two Nested `Integer#upto` Method Invocations and a Range Selection

This is the most succinct of the options and is readable too.

```ruby
string = "abcde"

0.upto(string.length - 1) do |start_index|
  start_index.upto(string.length - 1) do |stop_index|
    p string[start_index..stop_index]
  end
end
```

#### Using Two Nested `Integer#upto` Method Invocations and  Start/Length Selection

```ruby
string = "abcde"

max_length = string.length

0.upto(string.length - 1) do |start_index|
  1.upto(max_length) do |length|
    p string[start_index, length]
  end
  max_length -= 1
end
```

#### Using a `Integer#upto` Nested In An `Integer#times` Method Invocation and Start/Length Selection

```ruby
string = "abcde"

max_length = string.length

(string.length).times do |start_index|
  1.upto(max_length) do |length|
    p string[start_index, length]
  end
  max_length -= 1
end
```

#### Using Nested `#each` Methods on a Range Value

This solution is courtesy of Drew Dowdy.  It uses two range values that have `#each` invoked upon them, passing in incrementing values of block local variables `idx1` and `idx2`, which are used to create all the range values needed to get the required output when they are passed to the `String#slice` method as arguments.  The first range value is an inclusive range `..` from zero to the length of the string, the second range value is an exclusive range `...` from `idx1` to one less than the length of the string.

```ruby
string = "abcde"

(0..string.length).each do |idx1|
  (idx1...string.length).each do |idx2| 
    p string[idx1..idx2]
  end
end
```

**None of these options are inherently better than the others.  The circumstances will dictate which might be the most appropriate to use.**