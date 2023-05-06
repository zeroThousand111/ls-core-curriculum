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

loop do
  choice = ''
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    prompt("Type in the abbreviation for the above choices:")
    prompt(ABBREVIATIONS.join(', ').to_s)
    input = gets.chomp
    choice = input_to_choices(input)
    if VALID_CHOICES.include?(choice)
      break
    else
      prompt("That's not a valid choice.")
    end
  end

  computer_choice = VALID_CHOICES.sample

  puts "You chose #{choice}; Computer chose #{computer_choice}"

  display_results(choice, computer_choice)

  prompt("Do you want to play again?")
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt("Thank you for playing. Good bye!")
