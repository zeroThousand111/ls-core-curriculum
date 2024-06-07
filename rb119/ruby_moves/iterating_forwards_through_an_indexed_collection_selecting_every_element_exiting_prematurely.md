## Iterating Forwards Through an Indexed Collection, Selecting Every Element, Finishing Prematurely

Sometimes the seemingly simplest step of a multi-step problem can cause the biggest challenge.  Moving through an indexed collection should be straightforward, but what if you need to stop iterating through it *before* you reach the last element?  It seems easy, until it isn't.

**The task:**  Sequentially select every element in an indexed collection from the lowest index number to a predetermined index that is not the highest index in the collection.  For the sake of this example, the break point will be the penultimate index.

**Notes:**  You might want to do something with each element when it is selected, such as output it, interpolate it into a string or push it to a new array collection.  For the sake of simplicity, in the case of these code snippet illustrations, the selected element is passed as an argument to the `Kernel#p` method and is output to the console.  Each snippet may return a different value.

**Example collections:**

`array = [0, 1, 2, 3, 4]`

<img src="https://i.imgur.com/j5drSW2.gif" width="500" />

**Expected output:**

```
# => 0
# => 1
# => 2
# => 3
```

`string = "hello"`

**Expected output:**

```
# => "h"
# => "e"
# => "l"
# => "l"
```

### Using Loops
#### Using A Simple Loop

```ruby
array = [0, 1, 2, 3, 4]

current_index = 0

loop do
  p array[current_index]
  current_index += 1
  break if current_index > array.size - 2
end

string = "hello"

current_index = 0

loop do
  p string[current_index]
  current_index += 1
  break if current_index > array.size - 2
end
```

N.B.  One way of imagining the last index number in an array that has `n` elements, is it is `array.size - 1`.  Coincidentally, this index can also be written as `array[-1]` in the context of using a negative integer argument passed to the `Array#slice` method.  It follows that the penultimate index number must be `array[-2]` or `array.size - 2`, and the link continues all the way backwards through the indexed collection.  The same analogy can be used for strings, which also are indexed collections.

So why isn't our `break` modified by  `if` when `current_index == array.size - 2` or `current_index >= array.size - 2`?  It's because the way the simple loops are constructed here, in a format I'm used to, `current_index` is incremented after the current value of the collection is output and before the `break` statement.  We have have to wait to break out of the loop until `current_index` is one more than the index of the current value we want to stop at.  So it's important to remember that the greater than comparison operator `>` should be used (and not `==` or `>=`) in a conditional break statement if you want to use the negative index integer in your calculation.

If you can't get out of the habit of using `==` or `>=`, then you have to remember to use one more than the negative integer.  In this case:

```ruby
array = [0, 1, 2, 3, 4]

current_index = 0

loop do
  p array[current_index]
  current_index += 1
  break if current_index >= array.size - 1 # not current_index > array.size - 2
end

string = "hello"

current_index = 0

loop do
  p string[current_index]
  current_index += 1
  break if current_index >= string.length - 1 # not current_index > string.length - 2
end
```

Fortunately, this gets a bit clearer with the other loops and iterators.

#### Using A While Loop

```ruby
array = [0, 1, 2, 3, 4]

current_index = 0
stop_index = array.size - 2

while current_index <= stop_index do
  p array[current_index]
  current_index += 1
end

string = "hello"

current_index = 0
stop_index = array.size - 2

while current_index <= stop_index do
  p string[current_index]
  current_index += 1
end
```

The important thing to note is the use of the *less than or equal to comparison operator* `<=` in the while loop.  This means that the element at the `stop_index` is still included in the loop before it breaks.

#### Using An Until Loop

```ruby
array = [0, 1, 2, 3, 4]

current_index = 0
stop_index = array.size - 2

until current_index > stop_index do
  p array[current_index]
  current_index += 1
end

string = "hello"

current_index = 0
stop_index = array.size - 2

until current_index > stop_index do
  p string[current_index]
  current_index += 1
end
```

The important thing to note is the use of the *greater than comparison operator* `>` in the until loop.  This means that the element at the `stop_index` is still included in the loop before it breaks.

#### Using A For Loop

As far as I'm aware, it's not straightforward (and maybe not possible) to break out of a `for` loop prematurely.

### Using Iterating Ruby Methods

#### Using `#each`

This involves passing a range value to the `#each` method.  I've also clarified what the start and stop indexes are by assigning them to local variables.  It's a lot like the `#upto` method described in a section further below.

```ruby
array = [0, 1, 2, 3, 4]

start_index = 0
stop_index = array.size - 2
(start_index..stop_index).each do |current_index|
  p array[current_index]
end

string = "hello"

start_index = 0
stop_index = string.length - 2
(start_index..stop_index).each do |current_index|
  p string[current_index]
end
```

N.B. This won't work with the `String#each_char` method, which — of course — can't be invoked upon a range value.

Whilst it is not essential, I find it helpful to assign the start and stop indices to memorably labelled local variables first to aid readability, especially when the tunnel vision of a live interview is in full effect.  Here I've used `start_index` and `stop_index` with the current value of the index labelled as the block parameter `current_index`.

#### Using `Integer#upto`

This is very similar to the `#each` method above, but I prefer the syntax and readability with `#upto`.

```ruby
array = [0, 1, 2, 3, 4]

start_index = 0
stop_index = array.size - 2
start_index.upto(stop_index) do |current_index|
  p array[current_index]
end

string = "hello"

start_index = 0
stop_index = string.length - 2
start_index.upto(stop_index) do |current_index|
  p string[current_index]
end
```

#### Using `Integer#times`

This is a little counterintuitive and using a negative index doesn't work, in the same way that it didn't fit so well for a simple loop.  Remember that `#times(n)` sequentially passes the integers `0` through to `n - 1` to the block on every iteration of the method.  The stop index needs to be `array.size - 1` or `string.length - 1` and not `- 2`.

```ruby
array = [0, 1, 2, 3, 4]

stop_index = array.size - 1
stop_index.times do |current_index|
  p array[current_index]
end

string = "hello"

stop_index = string.length - 1
stop_index.times do |current_index|
  p string[current_index]
end
```
