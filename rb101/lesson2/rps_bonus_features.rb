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

def get_input
  prompt("Choose one: #{VALID_CHOICES.join(', ')}")
  prompt("Type in the letter that corresponds to your choice:")
  prompt(ABBREVIATIONS.join(', ').to_s)
  gets.chomp
end

def win?(first, second)
  WINNING_CONDITIONS[first].include?(second)
end

def input_to_choices(string)
  CONVERSION_HASH[string]
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

loop do
  choice = ''
  player_score = 0
  computer_score = 0
  tie = 0
  round = 0
  system "clear"
  
  loop do
    round += 1
    prompt("Round #{round}!")
    loop do
      input = get_input
      choice = input_to_choices(input)
      if VALID_CHOICES.include?(choice)
        break
      else
        prompt("That's not a valid choice.")
      end
    end

    computer_choice = VALID_CHOICES.sample

    prompt("You chose #{choice}; Computer chose #{computer_choice}")

    display_results(choice, computer_choice)

    if win?(choice, computer_choice)
      player_score += 1
    elsif win?(computer_choice, choice)
      computer_score += 1
    else
      tie += 1
    end

    display_current_scores(player_score, computer_score, tie, round)

    if player_score == 3
      prompt("Congratulations! You won 3 games!")
      break
    elsif computer_score == 3
      prompt("Bad luck! The computer won 3 games!")
      break
    else
      next
    end
  end

  prompt("Do you want to play another 'best of three' again?")
  prompt("Press 'y' for yes. Any other key for no.")
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt("Thank you for playing. Good bye!")
