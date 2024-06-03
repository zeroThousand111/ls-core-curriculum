## Select All Permutations of an Indexed Collection

**The task:**  Select every possible permutation of an indexed collection.  In other words select every possible arrangement of that collection of elements.  *This is not an easy problem to solve and involves methods and concepts not fully covered in the RB110/119 material, but it can be a useful step in problem solving and so is worth exploring and remembering*.

**Notes:**  You might want to do something with each permutation when it is selected, such as output it or push it to a new array collection.   Whilst they are intended to **perform** the same kind of **action**, each snippet below may **return** a different value.

### Example 1 - All Permutations of a String

**Example collection:** `string = "abc"`

<img src="https://i.imgur.com/IW1qw6q.gif" width="500" />

**Expected output:**
```
# => "abc"
# => "acb"
# => "bac"
# => "bca"
# => "cab"
# => "cba"
```

#### Using Recursive Backtracking Patterns

A programming pattern known as **backtracking** can be used to create every possible permutation.  It is a recursive pattern.

I found a link on [StackOverflow](https://stackoverflow.com/questions/49619530/algorithm-backtracking-how-to-do-recursion-without-storing-state) that suggests this solution:  

```ruby
def permute(str)
  case str.length
  when 0, 1
    str
  when 2
    [str, str.reverse]
  else
    first = str[0]
    sz = str.size-1
    permute(str[1..-1]).flat_map { |s| (0..sz).map { |i| s.dup.insert(i,first) } }
  end
end

puts permute("abc") # prints out each element of the array returned by the method
```

It doesn't take long to find helpful web pages explaining backtracking.  If you want to continue down the rabbit hole [Geek for Geeks](https://www.geeksforgeeks.org/backtracking-algorithms/) has a comprehensive explainer.

Fortunately, for rubyists, there is a method for this situation...

#### Using `Array#permutation`

The docs for this ruby core library method are [here](https://docs.ruby-lang.org/en/3.2/Array.html#method-i-permutation) (version 3.2).

The solution has a number of components:
1. to prepare things for the method we want to use, the string is passed to `String#chars`, which returns an array of characters; and
2. the array of characters has the `Array#permutation` method invoked upon it;
	a.  this method is passed an Integer argument of what size of permutation to pass to the block, in this case we want the same size as the number of characters in the string;
	b. this method is also passed a block where each permutation is passed into that block, bound to a block parameter, and an action can be taken on each one.  In this case each subarray is joined by `Array#join` into a string and then shovelled into an array.

```ruby
string = "abc"
array_of_permutations = []
string.chars.permutation(string.length) { |word| array_of_permutations << word.join }  
p array_of_permutations
```

#### Assembling Subarrays of Permutations 

This method is courtesy of Drew Dowdy.  Its a way of building an array `permutations` containing subarrays of all possible permutations of the input string and then joining each subarray into a string at the end.

```ruby
def make_permutations(string)
  array_of_characters = string.chars
  permutations = [[array_of_characters.shift]]

  until array_of_characters.empty?
    current_char = array_of_characters.shift
    new_permutations = []
    permutations.each do |perm|
      (0..perm.size).each do |i|
        new_permutations << perm.dup.insert(i, current_char)
      end
    end
    permutations = new_permutations
  end
  
  permutations.map { |perm| perm.join }
end

p make_permutations("abc")
# => ["cba", "bca", "bac", "cab", "acb", "abc"] i.e. the strings we want but in a different order in the returned array.
```

### Example 2 - All Permutations of the Digits of an Integer

**The task:**  Select every possible integer from the digits that make up an integer and then collect them in a new array.  In other words, create every possible permutation of an array of the digits that make up that integer.

**Example collections and criteria:** `number = "12345"`

**Expected output:**
```
# => [12345, 12354, 12435, 12453, 12534, 12543, 13245, 13254, 13425, 13452, 13524, 13542, 14235, 14253, 14325, 14352, 14523, 14532, 15234, 15243, 15324, 15342, 15423, 15432, 21345, 21354, 21435, 21453, 21534, 21543, 23145, 23154, 23415, 23451, 23514, 23541, 24135, 24153, 24315, 24351, 24513, 24531, 25134, 25143, 25314, 25341, 25413, 25431, 31245, 31254, 31425, 31452, 31524, 31542, 32145, 32154, 32415, 32451, 32514, 32541, 34125, 34152, 34215, 34251, 34512, 34521, 35124, 35142, 35214, 35241, 35412, 35421, 41235, 41253, 41325, 41352, 41523, 41532, 42135, 42153, 42315, 42351, 42513, 42531, 43125, 43152, 43215, 43251, 43512, 43521, 45123, 45132, 45213, 45231, 45312, 45321, 51234, 51243, 51324, 51342, 51423, 51432, 52134, 52143, 52314, 52341, 52413, 52431, 53124, 53142, 53214, 53241, 53412, 53421, 54123, 54132, 54213, 54231, 54312, 54321]
```

#### Using `Array#permutation`

```ruby
number = 12345
array_of_possible_integers = []
number.digits.permutation(number.to_s.length) { |n| array_of_possible_integers << n.join.to_i }

p array_of_possible_integers
```

`Integer#digits` inexplicably creates an array of digits of the integer calling object in reverse order.  To recreate *exactly* the expected output the `Array#reverse` method can be included in the method chain i.e. `#digits.reverse.permutation`, or the `array_of_possible_integers` can be sorted in numerical order with `#sort` at the end, but if you aren't bothered by the order in which the permutations are added to the array, the above doesn't need modifying.

#### Assembling Subarrays of Permutations 

As before, this method is courtesy of Drew Dowdy, adapted for permutations of an integer rather than an input string:

```ruby
def make_permutations(number)
  digits = number.to_s.chars
  permutations = [[digits.shift]]

  until digits.empty?
    current_digit = digits.shift
    new_permutations = []
    permutations.each do |perm|
      (0..perm.size).each do |i|
        new_permutations << perm.dup.insert(i, current_digit)
      end
    end
    permutations = new_permutations
  end
  
  permutations.map { |perm| perm.join }
end
```