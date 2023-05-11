VALID_CHOICES = %w(rock paper scissors lizard spock)

ABBREVIATIONS = %w(r p s l v)

WINNING_CONDITIONS =
  {
    'rock' => ['scissors', 'lizard'],
    'paper' => ['rock', 'spock'],
    'scissors' => ['paper', 'lizard'],
    'lizard' => ['spock', 'paper'],
    'spock' => ['rock', 'scissors']
  }

CONVERSION_HASH =
  {
    'r' => 'rock',
    'p' => 'paper',
    's' => 'scissors',
    'l' => 'lizard',
    'v' => 'spock'
  }

def prompt(message)
  puts "=> #{message}"
end

def display_welcome_message
  welcome_message = <<~WELCOME
  => Welcome to Rock, Paper, Scissors, Lizard, Spock!
  => You'll play a number of rounds against the computer.
  => The player who wins three rounds first, wins the match!
  
  WELCOME
  puts welcome_message
end

def display_round(n)
  beginning_message = <<-ROUNDS
   * * * * * * * * * * * * * * * * * * * * * * * * * * * *

=> Round #{n}!
  ROUNDS
  puts beginning_message
end

def get_input
  prompt("Choose one: #{VALID_CHOICES.join(', ')}")
  prompt("Type in the letter that corresponds to your choice:")
  prompt(ABBREVIATIONS.join(', ').to_s)
  gets.chomp
end

def input_to_choices(string)
  CONVERSION_HASH[string.downcase]
end

def valid_choice?(input)
  if VALID_CHOICES.include?(input)
    input
  else
    prompt("That's not a valid choice.")
  end
end

def get_user_choice
  loop do
    input = get_input
    choice = input_to_choices(input)
    return choice if valid_choice?(choice)
  end
end

def get_computer_choice
  VALID_CHOICES.sample
end

def display_choices(player, computer)
  prompt("You chose #{player}; Computer chose #{computer}...")
  prompt("Thinking...")
end

def win?(first, second)
  WINNING_CONDITIONS[first].include?(second)
end

def display_results(player, computer)
  if win?(player, computer)
    prompt("You won!")
  elsif win?(computer, player)
    prompt("Computer won!")
  else
    prompt("It's a tie!")
  end
end

def display_current_scores(player, computer, tied, round)
  current_scores = <<-SCORES

=> After round #{round} the scores are:
=> Player: #{player}
=> Computer: #{computer}
=> Tied games: #{tied}
  
  SCORES
  puts current_scores
end

def display_won_three_games?(player1, player2)
  if player1 == 3
    prompt("Congratulations! You won 3 games!")
  elsif player2 == 3
    prompt("Bad luck! The computer won 3 games!")
  end
end

def determine_won_three_games?(player1, player2)
  player1 == 3 || player2 == 3
end

def play_again?
  prompt("Do you want to play another 'best of three' again?")
  prompt("Press 'y' for YES. Any other key for NO.")
  gets.chomp
end

loop do
  player_score = 0
  computer_score = 0
  tie = 0
  round = 0
  system "clear"

  display_welcome_message

  loop do
    round += 1
    display_round(round)
    player_choice = get_user_choice
    computer_choice = get_computer_choice
    system "clear"
    display_choices(player_choice, computer_choice)
    system "sleep 1"
    display_results(player_choice, computer_choice)

    if win?(player_choice, computer_choice)
      player_score += 1
    elsif win?(computer_choice, player_choice)
      computer_score += 1
    else
      tie += 1
    end

    display_current_scores(player_score, computer_score, tie, round)
    display_won_three_games?(player_score, computer_score)
    break if determine_won_three_games?(player_score, computer_score)
  end

  answer = play_again?
  break unless answer.downcase.start_with?('y')
end

prompt("Thank you for playing. Good bye!")
