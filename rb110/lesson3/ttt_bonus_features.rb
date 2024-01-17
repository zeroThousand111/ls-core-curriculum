require 'pry'
require 'pry-byebug'

# constants

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

# helper methods

def prompt(msg)
  puts "=> #{msg}"
end

def valid_input_string?(str)
  str.to_i.to_s == str
end

def valid_choice?(str)
  str == '1' || str == '2'
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

# game methods

# starting methods for player choices

def set_target_rounds
  prompt("Welcome to Tic Tac Toe!")
  input = 0
  loop do
    prompt("How many rounds to win the match?  Type a number greater than 1.")
    prompt("(3 or 5 rounds is recommended)")
    input = gets.chomp
    break if valid_input_string?(input) && input.to_i > 0
    prompt("Sorry, that's not a valid number, please try again.")
  end
  input.to_i
end

def computer_choice
  ['PLAYER', 'COMPUTER'].sample
end

def player_choice
  answer = nil
  loop do
    prompt("Who goes first: PLAYER or COMPUTER?")
    prompt("Choose 1 for PLAYER | Choose 2 for COMPUTER")
    answer = gets.chomp
    break if valid_input_string?(answer) && valid_choice?(answer)
    prompt("Sorry, that's not a valid choice, please try again.")
  end

  if answer.to_i == 1
    'PLAYER'
  elsif answer.to_i == 2
    'COMPUTER'
  end
end

def starting_chooser?
  chooser = nil
  first = nil

  loop do
    prompt("Who should choose who goes first: PLAYER or COMPUTER?")
    prompt("Type 1 for PLAYER | Type 2 for COMPUTER")
    chooser = gets.chomp
    break if valid_input_string?(chooser) && valid_choice?(chooser)
    prompt("Sorry, that's not a valid choice, please try again.")
  end

  if chooser.to_i == 1
    first = player_choice
  elsif chooser.to_i == 2
    first = computer_choice
  end
  first
end

# main game methods

def find_square(line, brd, marker)
  if brd.values_at(line[0], line[1], line[2]).count(marker) == 2
    brd.select { |k, v| line.include?(k) && v == INITIAL_MARKER }.keys.first
  end
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(line[0], line[1], line[2]).count(PLAYER_MARKER) == 3
      return 'PLAYER'
    elsif brd.values_at(line[0], line[1], line[2]).count(COMPUTER_MARKER) == 3
      return 'COMPUTER'
    end
  end
  nil
end

def declare_winner(player_score, computer_score)
  if player_score > computer_score
    'PLAYER'
  else
    'COMPUTER'
  end
end

# rubocop:disable Metrics / MethodLength, Metrics / ParameterLists, Metrics / AbcSize, Metrics / Methodlength
# rubocop:disable Layout / Linelength
def display_board(brd, player_score, computer_score, tie_score, target_rounds,
                  last_winner, first_player)
  system 'clear'
  puts "- - - - Tic Tac Toe - - - -"
  puts "PLAYER is an #{PLAYER_MARKER}.  COMPUTER is a #{COMPUTER_MARKER}."
  puts "#{first_player} takes the first turn."
  puts "The target to win the match is #{target_rounds} rounds!"
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
  puts "Current score (rounds): PLAYER #{player_score} - COMPUTER #{computer_score} - TIED #{tie_score}"
  puts "The previous round was won by: #{last_winner}"
  puts ""
end
# rubocop:enable Metrics / MethodLength, Metrics / ParameterLists, Metrics / AbcSize, Metrics / Methodlength
# rubocop:enable Layout / Linelength

def initialise_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def alternate_player(current_player)
  current_player == 'PLAYER' ? 'COMPUTER' : 'PLAYER'
end

def place_piece!(brd, current_player)
  if current_player == 'PLAYER'
    player_places_piece!(brd)
  else
    computer_places_piece!(brd)
  end
end

def player_places_piece!(brd)
  square = ' '
  loop do
    prompt("choose a square (#{joinor(empty_squares(brd))})")
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)

    prompt("Sorry, that's not a valid choice, please try again.")
  end

  brd[square] = PLAYER_MARKER
end

# rubocop:disable Metrics / MethodLength
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
# rubocop:enable Metrics / MethodLength

def board_full?(brd)
  empty_squares(brd).empty?
end

# main game loop
# rubocop:disable Metrics / BlockLength
loop do
  system 'clear'
  target_rounds = set_target_rounds
  first_player = starting_chooser?
  current_player = first_player
  player_score = 0
  computer_score = 0
  tie_score = 0
  last_winner = "no-one (it's the first round)"

  # one round loop
  loop do
    board = initialise_board

    # rubocop:disable Layout / Linelength
    display_board(board, player_score, computer_score, tie_score, target_rounds, last_winner, first_player)
    

    # loop for alternate players to take turns
    loop do
      display_board(board, player_score, computer_score, tie_score, target_rounds, last_winner, first_player)
      place_piece!(board, current_player)
      # binding.pry
      current_player = alternate_player(current_player)
      break if someone_won?(board) || board_full?(board)
    end

    display_board(board, player_score, computer_score, tie_score, target_rounds, last_winner, first_player)

    if someone_won?(board)
      if detect_winner(board) == 'PLAYER'
        player_score += 1
        last_winner = 'PLAYER'
      elsif detect_winner(board) == 'COMPUTER'
        computer_score += 1
        last_winner = 'COMPUTER'
      end
      prompt("The winner of the round was #{last_winner}!")
    else
      prompt("It's a TIE!")
      tie_score += 1
      last_winner = 'no-one! The round was tied'
    end

    first_player = alternate_player(first_player)
    break if player_score == target_rounds || computer_score == target_rounds
    prompt("Press the ENTER key to continue to the next round...")
    gets.chomp
  end

  prompt("The match was won by #{declare_winner(player_score, computer_score)}")
  prompt("The final score is PLAYER #{player_score} - COMPUTER #{computer_score} - TIED #{tie_score}")
  prompt("Play again? (y or n)")
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end
# rubocop:enable Layout / Linelength
# rubocop:enable Metrics / BlockLength

# outro after game

prompt("Thanks for playing Tic Tac Toe.  Good bye!")
