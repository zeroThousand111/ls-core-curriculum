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

def prompt(msg)
  puts "=> #{msg}"
end

# rubocop disable Metrics / MethodLength, Metrics / AbcSize
def display_board(brd, player_score, computer_score, tie_score, target_games, last_winner)
  system 'clear'
  puts "- - - Tic Tac Toe - - - "
  puts "You are a #{PLAYER_MARKER}.  Computer is #{COMPUTER_MARKER}."
  puts "The target to win is #{target_games} games!"
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
  puts ""
  puts "Current score: Player #{player_score} - Computer #{computer_score} - Ties #{tie_score}"
  puts "The previous game was won by #{last_winner}"
  puts ""
end
# rubocop enable Metrics / MethodLength, Metrics / AbcSize

def initialise_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def player_places_piece!(brd)
  square = ' '
  loop do
    prompt("choose a square (#{joinor(empty_squares(brd))})")
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt("Sorry, that's not a valid choice")
  end

  brd[square] = PLAYER_MARKER
end

def computer_places_piece!(brd)
  square = empty_squares(brd).sample
  brd[square] = COMPUTER_MARKER
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(line[0], line[1], line[2]).count(PLAYER_MARKER) == 3
      return 'Player'
    elsif brd.values_at(line[0], line[1], line[2]).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end
  nil
end

def joinor(input_array, delimiter=', ', final='or')
  case input_array.size
  when 0 then ''
  when 1 then input_array[0].to_s
  when 2 then input_array.join(" #{final} ")
  else 
    input_array[-1] = "#{final} #{input_array[-1]}"
    input_array.join(delimiter)
  end
end

def set_target_games
  prompt("Welcome to Tic Tac Toe!")
  input = 0
  loop do
    prompt("How many games to win the match? (type a number: 3 or 5 recommended)")
    input = gets.chomp
    break if input.to_i.to_s == input
    prompt("Sorry, that's not a valid number")
  end
  input.to_i
end

def declare_winner(player_score, computer_score)
  if player_score > computer_score
    'Player'
  else 
    'Computer'
  end
end

player_score = 0
computer_score = 0
tie_score = 0
last_winner = "none (it's the first round)"
target_games = set_target_games

loop do
  loop do 
  board = initialise_board
  display_board(board, player_score, computer_score, tie_score, target_games, last_winner)

    loop do
      display_board(board, player_score, computer_score, tie_score, target_games, last_winner)
      player_places_piece!(board)
      break if someone_won?(board) || board_full?(board)
      computer_places_piece!(board)
      break if someone_won?(board) || board_full?(board)
    end
  
    display_board(board, player_score, computer_score, tie_score, target_games, last_winner)
  
    if someone_won?(board)
      if detect_winner(board) == 'Player'
        player_score += 1
        last_winner = 'Player'
      elsif detect_winner(board) == 'Computer'
        computer_score += 1
        last_winner = 'Computer'
      end
    else
      prompt("Its a tie!")
      tie_score += 1
      last_winner = 'The game was tied'
    end
    
    break if player_score == target_games || computer_score == target_games
  end
  
  prompt("The match was won by #{declare_winner(player_score, computer_score)}")
  prompt("The final score is Player #{player_score} - Computer #{computer_score} - Ties #{tie_score}")
  prompt("Play again? (y or n)")
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt("Thanks for playing Tic Tac Toe.  Good bye!")
