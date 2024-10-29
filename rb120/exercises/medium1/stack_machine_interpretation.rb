=begin
This is one of the hardest exercises in this exercise set. It uses both exceptions and Object#send, neither of which we've discussed in detail before now. Think of this exercise as one that pushes you to learn new things on your own, and don't worry if you can't solve it.

You may remember our Minilang language from back in the RB101-RB109 Medium exercises. We return to that language now, but this time we'll be using OOP. If you need a refresher, refer back to that exercise.

Write a class that implements a miniature stack-and-register-based programming language that has the following commands:

- n Place a value n in the "register". Do not modify the stack.
- PUSH Push the register value on to the stack. Leave the value in the register.
- ADD Pops a value from the stack and adds it to the register value, storing the - result in the register.
- SUB Pops a value from the stack and subtracts it from the register value, - storing the result in the register.
- MULT Pops a value from the stack and multiplies it by the register value, - storing the result in the register.
- DIV Pops a value from the stack and divides it into the register value, storing - the integer result in the register.
- MOD Pops a value from the stack and divides it into the register value, storing - the integer remainder of the division in the register.
- POP Remove the topmost item from the stack and place in register
- PRINT Print the register value
- All operations are integer operations (which is only important with DIV and MOD).

Programs will be supplied to your language method via a string passed in as an argument. Your program should produce an error if an unexpected item is present in the string, or if a required stack value is not on the stack when it should be (the stack is empty). In all error cases, no further processing should be performed on the program.

You should initialize the register to 0.

-----

HINT:

For error handling, you will likely need exceptions. See the Ruby documentation for handling exceptions and for the Exception class. You may also find this blog article on Getting Started With Ruby Exceptions helpful.

Custom exceptions are usually derived from the StandardError exception class, like so:

class MyCustomError < StandardError; end
You may also find Object#send to be useful when evaluating the Minilang code.

If you have a variable str that points to a string, and you want to determine if it is a number, you can use a regular expression in an if statement, like this:

if str =~ /\A[-+]?\d+\z/
  puts "It's a number!"
else
  puts "It's not a number."
end

Regular expressions (regex) are very useful for string operations, but we don't cover them in any detail until RB130. If you haven't already read our book, Introduction to Regular Expressions, you may do so now, but it isn't necessary - this hint is all you need to know about regex for this problem.

------

# MY NOTES

## General Thoughts
- Minilang will be a custom class, and so most of it's instance methods will need to be written for it, including private helper methods
- 
## Data Structure
- what data structure should I use for the register and the stack?
- what did I use last time?
  - `register` is a local variable 
  - the stack is an Array

## The `eval` Method
- is this a ruby core library method, or something I have to write for the the Minilang class?
- YES!  It is Kernel#eval.  Docs here https://docs.ruby-lang.org/en/3.2/Kernel.html#method-i-eval
- It has something to do with evaluating a string object as ruby code
- when I call .eval on a string object I get a NoMethodError raised because `eval` is a private method for String objects!  Maybe this means I need to write a custom `eval` instance method for my MiniLang class?

## PREVIOUS ALGORITHM

1. Chop up the input string into component parts
2. Take each component and act upon it according to the stack language
3. Recognise components of input string:
  a. instruction for the minilanguage; or
  b. an Integer
   - component.to_i will be either an Integer or 0 if not an Integer
4. Act on component

### Parsing the Arguments
The integers are objects to be sent to the register and stack.  The strings are instructions, aka method calls.  How to parse them?  

def minilang(string)
  register = 0
  stack = []
  instructions = string.split(' ')
  
  instructions.each do |substring|
    case substring
    when 'PRINT' then puts register
    when 'PUSH'  then stack.push(register)
    when 'POP'   then register = stack.pop
    when 'ADD'   then register += stack.pop.to_i
    when 'SUB'   then register -= stack.pop.to_i
    when 'MULT'  then register *= stack.pop.to_i
    when 'DIV'   then register /= stack.pop.to_i
    when 'MOD'   then register = register % stack.pop.to_i
    else 
      register = substring.to_i # if numeric String
    end
  end
end

##Object#send

- what is this?  See the docs!
- its a way of sending an instance method a set of arguments.  The first argument, a symbol, is the name of the instance method invoked, and the rest of the arguments the arguments sent to that invocation.

Example from the docs:
class Klass
  def hello(*args)
    "Hello " + args.join(' ')
  end
end
k = Klass.new
k.send :hello, "gentle", "readers"   #=> "Hello gentle readers"

I don't have to use this method to execute my solution, so I won't!
=end

# progress note: I'm able to perform all but two functions.  These two require the current .eval method to stop, but not abort or exit the whole execution of other instantiations of new `MiniLang` object below them in the `main`.  This might be a `begin/rescue` structure thing to do this.

require 'pry'
require 'pry-byebug'

class UnrecognisedInstructionError < StandardError
  def initialize(substring)
    puts "Invalid token: #{substring}"
    abort # or exit
  end
end

class EmptyStackError < StandardError
  def initialize
    puts "Empty stack!"
    abort # or exit
  end
end

class Minilang
  attr_accessor :register, :stack
  attr_reader :instructions

  def initialize(instructions)
    @register = 0
    @stack = []
    @instructions = instructions.split(' ') # an array of strings
  end

  def eval
    instructions.each do |substring|
      # binding.pry
      if substring =~ /\A[-+]?\d+\z/
        add_number_to_register(substring)
      else
        perform_instruction(substring)
      end
    end
  end

  private

  def perform_instruction(substring)
    # binding.pry
    case substring
    when 'PRINT' then puts register
    when 'POP'   then pop
    when 'ADD'   then self.register += stack.pop.to_i
    when 'SUB'   then self.register -= stack.pop.to_i
    when 'PUSH'  then self.stack.push(register)
    when 'MULT'  then self.register *= stack.pop.to_i
    when 'DIV'   then self.register /= stack.pop.to_i
    when 'MOD'   then self.register = register % stack.pop.to_i
    when 'STACK' then p stack # my custom output branch of the case statement
    else 
      raise UnrecognisedInstructionError.new(substring)
    end
  end

  def add_number_to_register(substring)
    self.register = substring.to_i # if numeric String
  end

  def pop
    raise EmptyStackError.new unless !stack.empty?
    self.register = stack.pop
  end

end

# LS Tests

Minilang.new('PRINT').eval
# 0

Minilang.new('5 PUSH 3 MULT PRINT').eval
# 15

Minilang.new('5 PRINT PUSH 3 PRINT ADD PRINT').eval
# 5
# 3
# 8

Minilang.new('5 PUSH 10 PRINT POP PRINT').eval
# 10
# 5

Minilang.new('5 PUSH POP POP PRINT').eval # I don't want PRINT to work here and I want a custom exception to print a message and stop execution. But I need code below to continue to work not the whole program to stop!

# Empty stack!

Minilang.new('3 PUSH PUSH 7 DIV MULT PRINT ').eval
# 6

Minilang.new('4 PUSH PUSH 7 MOD MULT PRINT ').eval
# 12

# Minilang.new('-3 PUSH 5 XSUB PRINT').eval # this will require a different custom exception class to be created
# Invalid token: XSUB

Minilang.new('-3 PUSH 5 SUB PRINT').eval
# 8

Minilang.new('6 PUSH').eval
# (nothing printed; no PRINT commands)