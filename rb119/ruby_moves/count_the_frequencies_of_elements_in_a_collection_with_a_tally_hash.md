## Count the Frequencies of Elements in a Collection with a Tally Hash

**The task:**  Label every element of a collection with a key in a hash and assign the frequency of that object as the value.  In other words, create a hash containing key-value pairs that are the object and the number of times that object appears in the original collection.

### Example 1 - Characters in a String

<img src="https://i.imgur.com/XVkQZzb.gif" width="500" />

**Example collection:** `string = "abbccc"`

**Expected output:**

```
{
  "a" => 1,
  "b" => 2,
  "c" => 3
}
```

#### Using `String#each_char`

```ruby
string = "abbccc"

def create_tally_hash(string)
  tally_hash = {}
  string.each_char do |char|
    if tally_hash.include?(char)
      tally_hash[char] += 1
    else
      tally_hash[char] = 1
    end
  end
  tally_hash
end

pp create_tally_hash(string)
```

#### Using `Enumerable#each_with_object`

```ruby
string = "abbccc"

def create_tally_hash(string)
  tally_hash = string.chars.each_with_object({}) do |char, hash|
    if hash.include?(char)
      hash[char] += 1
    else
      hash[char] = 1
    end
  end
  tally_hash
end

pp create_tally_hash(string)
```

#### Using `Enumerable#tally`

I discovered this very useful and boutique ruby core library method a few weeks after working on the above DIY ones.  The string needs to be turned into an array of characters first.  Other than that, it's embarrassingly simple:

```ruby
string = "abbccc"

pp string.chars.tally

# that's it
```

### Example 2 - An Array of Integers

**Example collection:** `array = [1, 1, 1, 2, 2, 3]`

**Expected output:**

```
{
  1 => 3,
  2 => 2,
  3 => 1
}
```

#### Using  `Array#each`

```ruby
array = [1, 1, 1, 2, 2, 3]

def create_tally_hash(array)
  tally_hash = {}
  array.each do |num|
    if tally_hash.include?(num)
      tally_hash[num] += 1
    else
      tally_hash[num] = 1
    end
  end
  tally_hash
end

pp create_tally_hash(array)
```

#### Using `Enumerable#each_with_object`

```ruby
array = [1, 1, 1, 2, 2, 3]

def create_tally_hash(array)
  tally_hash = array.each_with_object({}) do |num, hash|
    if hash.include?(num)
      hash[num] += 1
    else
      hash[num] = 1
    end
  end
  tally_hash
end

pp create_tally_hash(array)
```
#### Using `Enumerable#tally`

As the previous example of using this method, it's rather simple.  In the case of an array of elements, even easier than with a string.  Just invoke `#tally`:

```ruby
array = [1, 1, 1, 2, 2, 3]

pp array.tally

# that's all folks!
```