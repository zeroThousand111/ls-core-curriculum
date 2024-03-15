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

INPUT:

OUTPUT:

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
1. Requirement — The important, generalized steps required to navigate from the input to the desired output.
  a. Approach — The process that will be utilized to accomplish each Requirement.
    i. Procedure — Specific details to implement the Approach.


1.TRANSFORM the string argument into a sequence of instructions
  a.Split the string into words and Integers
  b.Create an array of instructions from the split argument String
    i.instructions = string.split(' ')
2.READ the first instruction (and move through the array of instructions)
  a.Use a simple loop?
  b.Use #each
    i.
3.COMPREHEND the next instruction
  a.if the next substring is a numeric string
    i.substring.to_i.to_s == substring
  b.if the next substring is 'PUSH'
  c.etc
    i.
4.ACT upon each instruction
  a.Create helper methods?
  b.
    i.
5.
  a.
    i.
______________________________________________________________________________

Now CODE with intent!
=end

require 'pry'
require 'pry-byebug'

# solution 1 - using an IF statement

def minilang(string)
  register = 0
  stack = []
  instructions = string.split(' ')
  # binding.pry
  instructions.each do |substring|
    # numeric integer
    if substring.to_i.to_s == substring
      register = substring.to_i
    # PRINT
    elsif substring == 'PRINT'
      puts register
    # PUSH
    elsif substring == 'PUSH'
      stack.push(register)
    # POP
    elsif substring == 'POP'
      register = stack.pop
    # ADD
    elsif substring == 'ADD'
      register += stack.pop.to_i
    # SUB
    elsif substring == 'SUB'
      register -= stack.pop.to_i
    # MULT
    elsif substring == 'MULT'
      register *= stack.pop.to_i
    # DIV
    elsif substring == 'DIV'
      register /= stack.pop.to_i
    # MOD
    elsif substring == 'MOD'
      register = register % stack.pop.to_i
    end
  end
end


# -------------------

# solution 2 - using a WHEN statement

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

# -------------------

# solution 3 - 

# -------------------

# solution 4 - 

# -------------------

# solution 5 - 

# -------------------

# Print Tests

# minilang('8 PRINT') # 8
# minilang('8 PUSH POP PRINT') # 8
# minilang('1 PUSH 2 PUSH 99 POP PRINT') # 2
# minilang('10 8 PUSH ADD PRINT') # 16

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

# Test Cases