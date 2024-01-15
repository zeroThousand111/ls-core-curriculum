=begin
______________________________________________________________________________
*****Understand the PROBLEM*****
______________________________________________________________________________
THE PROBLEM:
The computer currently picks a square at random. That's not very interesting. Let's make the computer defensive minded, so that if there's an immediate threat, then it will defend the 3rd square. We'll consider an "immediate threat" to be 2 squares marked by the opponent in a row. If there's no immediate threat, then it will just pick a random square.

INPUT:

a) WINNING_LINES constant Array of sub-arrays
b) Current state of board (a Hash data structure)

OUTPUT:

Instruction to Computer to make the next move the missing piece computer_places_piece!(brd)


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



______________________________________________________________________________
*****DATA STRUCTURES*****
______________________________________________________________________________

______________________________________________________________________________
*****ALGORITHM*****
______________________________________________________________________________

Strategy A: This will instruct Computer to play the FIRST square it identifies as being a threat OR a random square if there is no threat

1.Iterate through WINNING_LINES sub-arrays
2.Identify the FIRST sub_array where TWO squares are already marked by PLAYER_MARKER
 - similar strategy to detect_winner method, but one square must have INITIAL_MARKER
3.Identify which ONE of those THREEE squares are unmarked
4.Pass the key of the INITIAL_MARKER square (1-9) to computer_places_piece! method.
2-4. are covered in one IF statement similar to detect_winner(brd):
  a. IF brd[line[0]] == PLAYER_MARKER && brd[line[1]] == PLAYER_MARKER && brd[line[2]] ==   INITIAL_MARKER then return brd[line[2]]
  b. ELSIF brd[line[0]] == PLAYER_MARKER && brd[line[1]] == INITIAL_MARKER && brd[line[2]] ==   PLAYER_MARKER then return brd[line[1]]
  c. ELSIF brd[line[0]] == INITIAL_MARKER && brd[line[1]] == PLAYER_MARKER && brd[line[2]] == PLAYER_MARKER then return brd[line[1]]
5.
______________________________________________________________________________

Now CODE with intent!
=end

# relevant constants and methods from Tic Tac Toe game

require 'pry'
require 'pry-byebug'

INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'

WINNING_LINES = [
  [1, 2, 3],
  [4, 5, 6],
  [7, 8, 9],
  [1, 4, 7],
  [2, 5, 8],
  [3, 6, 9],
  [1, 5, 9],
  [3, 5, 7]
]

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def computer_places_piece!(brd)
  square = ai_defense(brd)
  brd[square] = COMPUTER_MARKER
end

def initialise_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end


# solution 1 - Strategy A
def ai_defense(brd)
  WINNING_LINES.each do |line|
    # binding.pry
    if brd[line[0]] == PLAYER_MARKER && brd[line[1]] == PLAYER_MARKER && brd[line[2]] == INITIAL_MARKER
      return line[2]
    elsif brd[line[0]] == PLAYER_MARKER && brd[line[1]] == INITIAL_MARKER && brd[line[2]] == PLAYER_MARKER
      return line[1]
    elsif brd[line[0]] == INITIAL_MARKER && brd[line[1]] == PLAYER_MARKER && brd[line[2]] == PLAYER_MARKER
      return line[0]
    end
  end
  empty_squares(brd).sample
end


# -------------------

# solution 2 - 

# -------------------

# Print Tests

# Test Cases
# brd = {1=>' ', 2=>' ', 3=>' ', 4=>' ', 5=>' ', 6=>' ', 7=>' ', 8=>' ', 9=>' ',}
p ai_defense({1=>"X", 2=>" ", 3=>"X", 4=>" ", 5=>" ", 6=>" ", 7=>" ", 8=>" ", 9=>" "}) == 2
p ai_defense({1=>"X", 2=>" ", 3=>" ", 4=>"X", 5=>" ", 6=>" ", 7=>" ", 8=>" ", 9=>" "}) == 7
p ai_defense({1=>" ", 2=>" ", 3=>" ", 4=>" ", 5=>"X", 6=>" ", 7=>"X", 8=>" ", 9=>" "}) == 3
p ai_defense({1=>"X", 2=>" ", 3=>" ", 4=>" ", 5=>" ", 6=>" ", 7=>" ", 8=>" ", 9=>" "}) # random number

# p initialise_board
