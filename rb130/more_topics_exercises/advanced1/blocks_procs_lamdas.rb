# Group 1
my_proc = proc { |thing| puts "This is a #{thing}." }
puts my_proc        # #<Proc:0x000000010d1aacd0 blocks_procs_lamdas.rb:2>
puts my_proc.class  # => Proc
my_proc.call        # This is a .
my_proc.call('cat') # This is a cat.

=begin
Group 1 concerns blocks and Proc objects.

On line 2, a `Proc` object is instantiated using the `proc` keyword before a block.  I didn't know this syntax before, but its similar to lambdas in Group 2 below.
On line 3, `my_proc` is passed to `Kernel#puts` and outputs an encoding of the Proc object via the `Proc#to_s` method.
On line 4, the `#class` method is called on `my_proc`, and returns Proc
On line 5, the `Proc#call` method? is invoked on `my_proc` without an argument;the string in the Proc is returned, without the interpolated argument.  Notably, this does not raise an `ArgumentError`, because procs exhibit lenient arity.
On line 6, the `#call` method is invoked again, this time with a string argument, which is interpolated into the string in the proc and output when passed to `#puts`.
=end

# Group 2
my_lambda = lambda { |thing| puts "This is a #{thing}." }
my_second_lambda = -> (thing) { puts "This is a #{thing}." }
puts my_lambda        # #<Proc:0x00000001071fac68 blocks_procs_lamdas.rb:19 (lambda)>
puts my_second_lambda # #<Proc:0x00000001071fac18 blocks_procs_lamdas.rb:20 (lambda)>
puts my_lambda.class  # Proc
my_lambda.call('dog') # This is a dog.
my_lambda.call        # blocks_procs_lamdas.rb:19:in `block in <main>': wrong number of arguments (given 0, expected 1) (ArgumentError)
my_third_lambda = Lambda.new { |thing| puts "This is a #{thing}." } # blocks_procs_lamdas.rb:26:in `<main>': uninitialized constant Lambda (NameError)

=begin
Group 2 concerns lambdas, a variety of Proc object.

On line 19, a new lambda is instantiated and assigned to `my_lambda`, using one kind of syntax.
On line 20, another new lambda is instantiated with the "stabby lambda syntax" and is assigned to `my_second_lambda`.
On line 21, `my_lambda` is passed to the `#puts` method and an encoding of the lambda is output, from `Proc#to_s`.
On line 22, `my_second_lambda` is passed to `#puts` and an encoding of that lambda is output.
On line 23, the `#class` method is invoked upon `my_lambda`, which returns the Proc class.  This demonstrates that lambdas are `Proc` objects.
On line 24, the `Proc#call` method is invoked upon `my_lambda` and a string argument is passed to the method invocation.  The lambda is executed and a string is output with the argument interpolated into the string output.
On line 25, `#call` is again invoked upon `my_lambda`, but this time no argument is passed to the method invocation, which results in an `ArgumentError` being raised.  This demonstrates that, unlike procs, lambdas exhibit strict arity.
On line 26, a third lambda is attempted to be instantiated and assigned to `my_third_lambda` using a third different kind of syntax `Lambda.new`.  However, there is no `Lambda` class defined, and so this raises a `NameError`.
=end

# Group 3
def block_method_1(animal)
  yield
end

block_method_1('seal') { |seal| puts "This is a #{seal}."} # => This is a .
block_method_1('seal') # => blocks_procs_lamdas.rb:43:in `block_method_1': no block given (yield) (LocalJumpError) from blocks_procs_lamdas.rb:47:in `<main>'

=begin
Group 3 concerns a method definition `block_method_1` — defined on lines 42 to 44 — that requires a block, because it has the `yield` keyword on line 43 with no conditional modifier (such as `if block_given?`).  

On line 46, the method is invoked with an argument and a block.  It outputs the content of the block, but without the value of the block parameter `seal` interpolated.  This is because no argument has been passed to the block by `yield`, because no parameters have been defined with `yield`.  This demonstrates that blocks exhibit lenient arity.  No `ArgumentError` is raised despite the block expecting one argument to be passed.

On line 47, the same method is invoked with an argument but without a block.  This raises a `LocalJumpError` because the method must yield to a block, but none has been passed at the time of this invocation.
=end

# Group 4
def block_method_2(animal)
  yield(animal)
end

block_method_2('turtle') { |turtle| puts "This is a #{turtle}."} # => This is a turtle.
block_method_2('turtle') do |turtle, seal|
  puts "This is a #{turtle} and a #{seal}."
end
# => This is a turtle and a .
block_method_2('turtle') { puts "This is a #{animal}."} # => blocks_procs_lamdas.rb:66:in `block in <main>': undefined local variable or method `animal' for main:Object (NameError)

=begin
Group 4 concerns another method `block_method_2`, defined on lines 58 to 60, which takes one argument and yields that argument to a block.  A block is required, because no conditional modifier has been specified.

On line 62, the method is invoked with a string argument and a single-line block with one block parameter defined.  The argument is passed to the block when the interpreter encounters the `yield` keyword.  The block outputs the string in the block, with the value of `turtle` interpolated into it.
On line 63, the method is invoked with the same string argument and a multi-line block, which this time has two parameters defined for it.  Only one argument can be passed when the method yields to the block, because only one has been given.  It outputs the string with the first argument interpolated and leaves the second place blank.  Notably, the block does not raise an `ArgumentError`.  This is because blocks exhibit lenient arity (like procs).
On line 67, the same method is invoked with one argument and a single-line block, but the block doesn't have any parameters defined this time.  When the method yields to the block, it doesn't raise an `ArgumentError` from passing an argument to a block with no defined parameters (lenient arity still applies) but a `NameError` is raised, because the block contains reference to `animal`, which hasn't been defined.  No arguments have been able to be accepted by the block, because no parameters were defined for it.
=end

# ----

=begin
MY SUMMARY
This code demonstrates the following things about blocks, procs and lambdas:

1. There are at least two syntaxes to define a proc object, and two for lambdas, and, of course, two for blocks too (being single-line and multi-line blocks).
2. Procs and blocks exhibit lenient arity.  Passing too many or too few arguments to them does not raise an `ArgumentError`.
3. Methods and lambdas exhibit strict arity.  Passing too many or too few arguments to them does raise an `ArgumentError`.
4. Lambdas are a type of `Proc` object.  There is no `Lambda` class defined in ruby's built-in classes.
5. Calling `Proc#to_s` on procs and lambdas outputs an encoding of that chunk of code which includes the line on which it was initialised, which will give clues about its binding.
6. Method definitions that have the `yield` keyword with no conditional modifier must be passed a block argument, else they will raise a `LocalJumpError`.
7. Whilst blocks are lenient about too many or too few arguments being passed to them, the content of the block might not execute properly if too few arguments are passed in.
8. For an argument to be passed successfully to a block when it is executed, the `yield` keyword must pass a specific number of arguments AND parameters must be defined in the block definition.
=end

=begin
LS SOLUTION

Group 1:

A new Proc object can be created with a call of proc instead of Proc.new
A Proc is an object of class Proc
A Proc object does not require that the correct number of arguments are passed to it. If nothing is passed, then nil is assigned to the block variable.
Group 2

A new Lambda object can be created with a call to lambda or ->. We cannot create a new Lambda object with Lambda.new
A Lambda is actually a different variety of Proc.
While a Lambda is a Proc, it maintains a separate identity from a plain Proc. This can be seen when displaying a Lambda: the string displayed contains an extra "(lambda)" that is not present for regular Procs.
A lambda enforces the number of arguments. If the expected number of arguments are not passed to it, then an error is thrown.
Group 3

A block passed to a method does not require the correct number of arguments. If a block variable is defined, and no value is passed to it, then nil will be assigned to that block variable.
If we have a yield and no block is passed, then an error is thrown.
Group 4

If we pass too few arguments to a block, then the remaining ones are assigned a nil value.
Blocks will throw an error if a variable is referenced that doesn't exist in the block's scope.
Comparison

Lambdas are types of Proc's. Technically they are both Proc objects. An implicit block is a grouping of code, a type of closure, it is not an Object.
Lambdas enforce the number of arguments passed to them. Implicit blocks and Procs do not enforce the number of arguments passed in.
=end