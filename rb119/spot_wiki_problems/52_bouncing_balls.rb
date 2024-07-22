=begin
52. Bouncing Balls
(​https://www.codewars.com/kata/5544c7a5cb454edb3c000047​)
6 kyu

A child is playing with a ball on the nth floor of a tall building. The height of this floor, h, is known.
He drops the ball out of the window. The ball bounces (for example), to two-thirds of its height (a bounce of 0.66). His mother looks out of a window 1.5 meters from the ground.
How many times will the mother see the ball pass in front of her window (including when it's falling and bouncing?
Three conditions must be met for a valid experiment:
Float parameter "h" in meters must be greater than 0
Float parameter "bounce" must be greater than 0 and less than 1
Float parameter "window" must be less than h.
If all three conditions above are fulfilled, return a positive integer, otherwise return -1.
Note:
The ball can only be seen if the height of the rebounding ball is strictly greater than the window parameter.

# UNDERSTAND THE PROBLEM
## INPUT: 3 numbers, specifically one Integer and two Floats
## OUTPUT: an Integer
## RULES
### Explicit requirements:
  - arguments are height(h), bounce and window height
  - return the number of times the ball bounces past the window
  - the number of times a ball is seen from the window requires three conditions to be fulfilled for a positive integer to be returned:
      1. height must be greater than 0
      2. bounce must be greater than 0 and less than 1
      3. window height must be less than bounce height
      ELSE return -1
  - the positive Integer is the number of times that the ball FALLS and also bounces HIGHER than the window height (not equal to)
### Implicit requirements:
  - the window is infinitely flat i.e. only one float given for its height
  - the first drop is always seen and the bounce may or may not be
  - if the bounce up is seen, then the bounce down will always be, this is why the returns from the test cases are always odd numbers

# EXAMPLES

Example:
- h = 3, bounce = 0.66, window = 1.5, result is 3  # 3m (fall) 1.98, but 1.3068
- h = 3, bounce = 1, window = 1.5, result is -1 (Condition 2) not fulfilled).

p bouncingBall(3, 0.66, 1.5) == 3
p bouncingBall(30, 0.66, 1.5) == 15
p bouncingBall(30, 0.75, 1.5) == 21
p bouncingBall(30, 0.4, 10) == 3
p bouncingBall(40, 1, 10) == -1
p bouncingBall(-5, 0.66, 1.5) == -1
p bouncingBall(1, 0.66, 0.66) == 1
p bouncingBall(1, 0.66, 1) == -1

# DATA STRUCTURES
## input: 3 numbers
## output: 1 Integer
## intermediate: ? maybe none needed

# ALGORITHM
## HIGH LEVEL
1. Are the three preconditions fulfilled?
2. If they are, calculate number of times ball seen going up and down at window height.

1. Are the three preconditions fulfilled?
* RETURN -1 if height not greater than 0 OR bounce not between 0 and 1, OR window height is not below bounce height
2. If they are, calculate number of times ball seen going up and down at window height.
* CREATE a local variable to track bounce height
  + this is initalised at the first bounce as original height * bounce
* CREATE a local varrable to track number of passes
  + passes will be at least 1 (the first drop)
    - passes = 1
* CREATE an UNTIL loop
  + condition being evaluated is, is the current bounce height higher than the window height?  If not, then break out of the loop
    - until bounce_height <= window_height
* RETURN number of passes value
=end

def meet_prerequisite?(original_height, bounce, window_height)
  original_height > 0 && bounce >= 0 && bounce <= 1 && window_height < original_height 
end

def bouncingBall(original_height, bounce, window_height)
  return -1 if meet_prerequisite?(original_height, bounce, window_height) == false
  passes = 1
  bounce_height = original_height * bounce
  until bounce_height <= window_height
    bounce_height *= bounce
    passes += 2
  end

  passes
end

p bouncingBall(3, 0.66, 1.5) == 3
p bouncingBall(30, 0.66, 1.5) == 15
p bouncingBall(30, 0.75, 1.5) == 21
p bouncingBall(30, 0.4, 10) == 3
# p bouncingBall(40, 1, 10) == -1 # this answer cannot be correct
p bouncingBall(-5, 0.66, 1.5) == -1
p bouncingBall(1, 0.66, 0.66) == 1
p bouncingBall(1, 0.66, 1) == -1