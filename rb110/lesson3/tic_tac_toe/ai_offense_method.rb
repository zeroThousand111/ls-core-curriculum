=begin
______________________________________________________________________________
*****Understand the PROBLEM*****
______________________________________________________________________________
THE PROBLEM:
The defensive minded AI is pretty cool, but it's still not performing as well as it could because if there are no impending threats, it will pick a square at random. We'd like to make a slight improvement on that. We're not going to add in any complicated algorithm (there's an extra bonus below on that), but all we want to do is piggy back on our find_at_risk_square from bonus #3 above and turn it into an attacking mechanism as well. The logic is simple: if the computer already has 2 in a row, then fill in the 3rd square, as opposed to moving at random.


______________________________________________________________________________
*****ALGORITHM*****
______________________________________________________________________________

1. Iterate through WINNING_LINES sub-arrays
2. If there are two (of three) squares in a sub-array of WINNING_LINES with the COMPUTER_MARKER
  a. Identify the key 
3. If there are two (of three) squares in a sub-array of WINNING_LINES with the PLAYER_MARKER
  a. 
4. If not, then pick a random square from those squares marked with INITIAL_MARKER.


Strategy B: 
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
  square = nil
  
  # defence strategy first
  square = WINNING_LINES.each do |line|
    find_square(line, brd, PLAYER_MARKER)
    break if square
  end
  
  # offence strategy second
  if !square
    square = WINNING_LINES.each do |line|
      find_square(line, brd, COMPUTER_MARKER)
    break if square
    end
  end
  
  # pick random square last
  if !square 
     square = empty_squares(brd).sample
  end
  
  brd[square] = COMPUTER_MARKER
end

def initialise_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def find_square(line, brd, marker)
  if brd.values_at(*line).count(marker) == 2
    return brd.select{|k,v| line.include?(k) && v == INITIAL_MARKER}.keys.first
  else
    nil
  end
end

# -------------------


