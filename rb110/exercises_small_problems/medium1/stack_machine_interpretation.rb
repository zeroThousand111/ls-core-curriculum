=begin
______________________________________________________________________________
*****Understand the PROBLEM*****
______________________________________________________________________________
THE PROBLEM:

A stack is a list of values that grows and shrinks dynamically. In ruby, a stack is easily implemented as an Array that just uses the #push and #pop methods.

A stack-and-register programming language is a language that uses a stack of values. Each operation in the language operates on a register, which can be thought of as the current value. The register is not part of the stack. Operations that require two values pop the topmost item from the stack (that is, the operation removes the most recently pushed value from the stack), perform the operation using the popped value and the register value, and then store the result back in the register.

Consider a MULT operation in a stack-and-register language. It multiplies the stack value with the register value, removes the value from the stack, and then stores the result back in the register. Thus, if we start with a stack of 3 6 4 (where 4 is the topmost item in the stack), and a register value of 7, then the MULT operation will transform things to 3 6 on the stack (the 4 is removed), and the result of the multiplication, 28, is left in the register. If we do another MULT at this point, then the stack is transformed to 3, and the register is left with the value 168.

Write a method that implements a miniature stack-and-register-based programming language that has the following commands:

n Place a value n in the "register". Do not modify the stack.
PUSH Push the register value on to the stack. Leave the value in the register.
ADD Pops a value from the stack and adds it to the register value, storing the result in the register.
SUB Pops a value from the stack and subtracts it from the register value, storing the result in the register.
MULT Pops a value from the stack and multiplies it by the register value, storing the result in the register.
DIV Pops a value from the stack and divides it into the register value, storing the integer result in the register.
MOD Pops a value from the stack and divides it into the register value, storing the integer remainder of the division in the register.
POP Remove the topmost item from the stack and place in register
PRINT Print the register value
All operations are integer operations (which is only important with DIV and MOD).

Programs will be supplied to your language method via a string passed in as an argument. Your program may assume that all programs are correct programs; that is, they won't do anything like try to pop a non-existent value from the stack, and they won't contain unknown tokens.

You should initialize the register to 0.

INPUT: A string.  The string contains instructions for operations and also changes to the stack.

OUTPUT: An Integer.  Sometimes multiple Integers.

RULES
EXPLICIT REQUIREMENTS:
  - 
  -
  -
  
IMPLICIT REQUIREMENTS:
  -
  -
  -

______________________________________________________________________________
*****EXAMPLES/TEST CASES*****
______________________________________________________________________________

minilang('PRINT')
# 0

minilang('5 PUSH 3 MULT PRINT')
# 15

minilang('5 PRINT PUSH 3 PRINT ADD PRINT')
# 5
# 3
# 8

minilang('5 PUSH POP PRINT')
# 5

minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT')
# 5
# 10
# 4
# 7

minilang('3 PUSH PUSH 7 DIV MULT PRINT ')
# 6

minilang('4 PUSH PUSH 7 MOD MULT PRINT ')
# 12

minilang('-3 PUSH 5 SUB PRINT')
# 8

minilang('6 PUSH')
# (nothing printed; no PRINT commands)

______________________________________________________________________________
*****DATA STRUCTURES*****
______________________________________________________________________________

______________________________________________________________________________
*****ALGORITHM*****
______________________________________________________________________________

1. Chop up the input string into component parts
2. Take each component and act upon it according to the stack language
3. Recognise components of input string:
  a. instruction for the minilanguage; or
  b. an Integer
   - component.to_i will be either an Integer or 0 if not an Integer
4. Act on component
5.
______________________________________________________________________________

Now CODE with intent!
=end

def transform_array(array)
  array.map do |element|
    if element.to_i.to_s == element
      element.to_i
    else
      element
    end
  end
end

# minilang method with excessive output feedback to track values

# def minilang(input_string, register=0, stack=[])
#   split_array = input_string.split(" ")
#   transformed_array = transform_array(split_array)
#   transformed_array.each do |element|
#     # process_element(element, register, stack) - how could I extract to a method but preserve changes to stack and register?
#     if element.is_a?(Integer)
#       register = element
#       puts "The register is now #{register}"
#     elsif element == "PUSH"
#       stack.push(register)
#       puts "PUSH: The register is now #{register} and the stack is now #{stack}"
#     elsif element == "POP"
#       register = stack.pop
#       puts "POP: The register is now #{register} and the stack is now #{stack}"
#     elsif element == "PRINT"
#       puts "PRINT: The register is currently #{register}"
#     elsif element == "MULT"
#       register = register * stack.pop
#       puts "MULT: The register is now #{register} and the stack is now #{stack}"
#     elsif element == "ADD"
#       register = register + stack.pop
#       puts "ADD: The register is now #{register} and the stack is now #{stack}"
#     elsif element == "SUB"
#       register = register - stack.pop
#       puts "SUB: The register is now #{register} and the stack is now #{stack}"
#     elsif element == "DIV"
#       register = register / stack.pop
#       puts "SUB: The register is now #{register} and the stack is now #{stack}"
#     elsif element == "MOD"
#       register = register % stack.pop
#       puts "SUB: The register is now #{register} and the stack is now #{stack}"
#     end
#   end
# end

# minilang method as envisaged by the problem

def minilang(input_string, register=0, stack=[])
  split_array = input_string.split(" ")
  transformed_array = transform_array(split_array)
  transformed_array.each do |element|
    if element.is_a?(Integer)
      register = element
    elsif element == "PUSH"
      stack.push(register)
    elsif element == "POP"
      register = stack.pop
    elsif element == "PRINT"
      puts register
    elsif element == "MULT"
      register = register * stack.pop
    elsif element == "ADD"
      register = register + stack.pop
    elsif element == "SUB"
      register = register - stack.pop
    elsif element == "DIV"
      register = register / stack.pop
    elsif element == "MOD"
      register = register % stack.pop
    end
  end
end

# -------------------

# My Test Cases

# minilang('9 PRINT PUSH 5 PUSH 2 POP MULT')

# Official Test Cases

minilang('PRINT')
# 0

minilang('5 PUSH 3 MULT PRINT')
# 15

minilang('5 PRINT PUSH 3 PRINT ADD PRINT')
# 5
# 3
# 8

minilang('5 PUSH POP PRINT')
# 5

minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT')
# 5
# 10
# 4
# 7

minilang('3 PUSH PUSH 7 DIV MULT PRINT ')
# 6

minilang('4 PUSH PUSH 7 MOD MULT PRINT ')
# 12

minilang('-3 PUSH 5 SUB PRINT')
# 8

minilang('6 PUSH')
# (nothing printed; no PRINT commands)