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
def display_board(brd, player_score, computer_score, tie_score, target_games, last_winner, first_player)
  system 'clear'
  puts "- - - Tic Tac Toe - - - "
  puts "You are a #{PLAYER_MARKER}.  Computer is #{COMPUTER_MARKER}."
  puts "#{first_player} takes the first turn."
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
  puts "The previous round was won by #{last_winner}"
  puts ""
end
# rubocop enable Metrics / MethodLength, Metrics / AbcSize

def starting_chooser?
  chooser = nil
  first = nil
  loop do
    prompt("Who should choose who goes first: Player or Computer?")
    prompt("Type 1 for Player | Type 2 for Computer")
    chooser = gets.chomp.to_i
    
    if chooser == 1
      loop do
        prompt("Who goes first: Player or Computer?")
        prompt("Choose 1 for Player | Choose 2 for Computer")
        answer = gets.chomp.to_i
        if answer == 1
          first = 'Player'
        elsif answer == 2
          first = 'Computer'
        end
        break if first !=nil
        prompt("Sorry, that's not a valid choice")
      end
      
    elsif chooser == 2
      first = ['Player', 'Computer'].sample
    end
    
    break if first != nil
    prompt("Sorry, that's not a valid choice")
  end
  first
end

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

def find_square(line, brd, marker)
  if brd.values_at(line[0], line[1], line[2]).count(marker) == 2
    return brd.select{|k,v| line.include?(k) && v == INITIAL_MARKER}.keys.first
  else
    nil
  end
end

def computer_places_piece!(brd)
  square = nil
  
  # offence strategy first
  WINNING_LINES.each do |line|
    square = find_square(line, brd, COMPUTER_MARKER)
    break if square
  end
  
  # defence strategy second
  if !square
    WINNING_LINES.each do |line|
      square = find_square(line, brd, PLAYER_MARKER)
    break if square
    end
  end
  
  # pick square 5 if available
  if !square && brd[5] == INITIAL_MARKER
    square = 5
  end
  
  # pick random square last
  if !square 
     square = empty_squares(brd).sample
  end
  
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

def alternate_player(current_player)
  current_player == 'Player' ? 'Computer' : 'Player'
end

def place_piece!(brd, current_player)
  if current_player == 'Player'
    player_places_piece!(brd)
  else
    computer_places_piece!(brd)
  end
end

# main game loop

loop do
  target_games = set_target_games
  # binding.pry
  current_player = starting_chooser?
  player_score = 0
  computer_score = 0
  tie_score = 0
  last_winner = "none (it's the first round)"
  loop do 
  board = initialise_board
  display_board(board, player_score, computer_score, tie_score, target_games, last_winner, current_player)
    
    # new loop for alternate players to take turns
    loop do
      display_board(board, player_score, computer_score, tie_score, target_games, last_winner, current_player)
      place_piece!(board, current_player)
      current_player = alternate_player(current_player)
      break if someone_won?(board) || board_full?(board)
    end
  
    display_board(board, player_score, computer_score, tie_score, target_games, last_winner, current_player)
  
    if someone_won?(board)
      if detect_winner(board) == 'Player'
        player_score += 1
        last_winner = 'Player'
      elsif detect_winner(board) == 'Computer'
        computer_score += 1
        last_winner = 'Computer'
      end
      prompt("The winner was #{last_winner}!")
    else
      prompt("It's a tie!")
      tie_score += 1
      last_winner = 'no-one! The game was tied'
    end
    
    break if player_score == target_games || computer_score == target_games
    prompt("Press the Enter key to continue to the next round...")
    gets.chomp
  end
  
  prompt("The match was won by #{declare_winner(player_score, computer_score)}")
  prompt("The final score is Player #{player_score} - Computer #{computer_score} - Ties #{tie_score}")
  prompt("Play again? (y or n)")
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt("Thanks for playing Tic Tac Toe.  Good bye!")
