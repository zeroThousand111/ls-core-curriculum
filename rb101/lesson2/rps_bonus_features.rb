# constants
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

# display methods
def prompt(message)
  puts "=> #{message}"
end

def display_welcome_message
  welcome_message = <<~WELCOME
  => Welcome to Rock, Paper, Scissors, Lizard, Spock!
  => You'll play a number of rounds against the COMPUTER.
  => The player who wins three rounds first, wins the match!
  
  WELCOME
  puts welcome_message
end

def display_round(n)
  round_info = <<-ROUNDS
                    * * * * * * * * * * * * * * * * * *

=> Round #{n}!
  ROUNDS
  puts round_info
end

def display_choices(player, computer)
  prompt("YOU chose #{player}; COMPUTER chose #{computer}...")
end

def display_results(player, computer)
  if win?(player, computer)
    prompt("YOU won!")
  elsif win?(computer, player)
    prompt("COMPUTER won!")
  else
    prompt("It's a TIE!")
  end
end

def display_current_scores(score_hash, round)
  current_scores = <<-SCORES

=> After round #{round} the scores are:
=> YOU: #{score_hash[:player_score]}
=> COMPUTER: #{score_hash[:computer_score]}
=> TIED games: #{score_hash[:tied_games]}
  
  SCORES
  puts current_scores
end

def display_won_three_games(score_hash)
  if score_hash[:player_score] == 3
    prompt("Congratulations! YOU won 3 games!")
  elsif score_hash[:computer_score] == 3
    prompt("Bad luck! The COMPUTER won 3 games!")
  end
end

# input and validation methods
def get_input
  get_input_message = <<~INPUT
  => Choose one: #{VALID_CHOICES.join(', ')}
  => To choose, type in the letter or word that corresponds to your choice:
  => rock(r); paper(p); scissors(s); lizard(l); spock(v).
  INPUT
  puts get_input_message
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
    if input.size < 2
      choice = input_to_choices(input)
    else
      choice = input.downcase
    end
    return choice if valid_choice?(choice)
  end
end

def get_computer_choice
  VALID_CHOICES.sample
end

def prompt_play_again?
  prompt("Do you want to play for another 'best of three' again?")
  prompt("Press 'y' for YES. Any other key for NO.")
  answer = gets.chomp
  answer.downcase.start_with?('y')
end

# calculation methods
def win?(first, second)
  WINNING_CONDITIONS[first].include?(second)
end

def determine_won_three_games?(score_hash)
  score_hash[:player_score] == 3 || score_hash[:computer_score] == 3
end

def update_scores(player, computer, score_hash)
  if win?(player, computer)
    score_hash[:player_score] += 1
  elsif win?(computer, player)
    score_hash[:computer_score] += 1
  else
    score_hash[:tied_games] += 1
  end
end

# main loop
loop do
  round = 0
  score_hash =
    {
      player_score: 0,
      computer_score: 0,
      tied_games: 0
    }

  system "clear"
  display_welcome_message
  loop do
    round += 1
    display_round(round)
    player_choice = get_user_choice
    prompt("COMPUTER is thinking...")
    system "sleep 2"
    computer_choice = get_computer_choice
    system "clear"
    display_choices(player_choice, computer_choice)
    display_results(player_choice, computer_choice)
    update_scores(player_choice, computer_choice, score_hash)
    display_current_scores(score_hash, round)
    display_won_three_games(score_hash)
    break if determine_won_three_games?(score_hash)
  end
  break unless prompt_play_again?
end

prompt("Thank you for playing. Good bye!")
