=begin
Rock, Paper Scissors Bonus Features
Make RPSLS different classes
=end

class Rock
  attr_reader :name

  def initialize
    @name = 'rock'
  end

  def >(other_move)
    other_move.is_a?(Scissors) || other_move.is_a?(Lizard)
  end

  def <(other_move)
    other_move.is_a?(Paper) || other_move.is_a?(Spock)
  end
end

class Paper
  attr_reader :name

  def initialize
    @name = 'paper'
  end

  def >(other_move)
    other_move.is_a?(Rock) || other_move.is_a?(Spock)
  end

  def <(other_move)
    other_move.is_a?(Scissors) || other_move.is_a?(Lizard)
  end
end

class Scissors
  attr_reader :name

  def initialize
    @name = 'scissors'
  end

  def >(other_move)
    other_move.is_a?(Paper) || other_move.is_a?(Lizard)
  end

  def <(other_move)
    other_move.is_a?(Rock) || other_move.is_a?(Spock)
  end
end

class Lizard
  attr_reader :name

  def initialize
    @name = 'lizard'
  end

  def >(other_move)
    other_move.is_a?(Paper) || other_move.is_a?(Spock)
  end

  def <(other_move)
    other_move.is_a?(Scissors) || other_move.is_a?(Rock)
  end
end

class Spock
  attr_reader :name

  def initialize
    @name = 'Spock'
  end

  def >(other_move)
    other_move.is_a?(Scissors) || other_move.is_a?(Rock)
  end

  def <(other_move)
    other_move.is_a?(Lizard) || other_move.is_a?(Paper)
  end
end

class Move
  NAMES = ['rock', 'paper', 'scissors', 'lizard', 'spock']
end

class Player
  attr_accessor :move, :name

  def initialize
    set_name
  end
end

class Human < Player
  def set_name
    n = ""
    loop do
      puts "What is your name?"
      n = gets.chomp
      break unless n.empty?
      puts "Sorry, must enter a value for your name."
    end
    self.name = n.upcase
  end

  def choose_object(string_choice)
    case string_choice
    when 'rock'
      Rock.new
    when 'paper'
      Paper.new
    when 'scissors'
      Scissors.new
    when 'lizard'
      Lizard.new
    when 'spock'
      Spock.new
    end
  end

  def choose
    string_choice = nil
    loop do
      puts "Please choose rock, paper, scissors, lizard or Spock."
      string_choice = gets.chomp.downcase
      break if Move::NAMES.include?(string_choice)
      puts "Sorry, invalid choice."
    end
    self.move = choose_object(string_choice)
  end
end

class Computer < Player
  CHOICES = [Rock.new, Paper.new, Scissors.new, Lizard.new, Spock.new]

  def set_name
    self.name = ['R2D2', 'C3PO', 'Hal2000', 'Marvin'].sample
  end

  def choose
    self.move = CHOICES.sample
  end
end

class RPSGame
  attr_accessor :human, :computer

  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def display_welcome_message
    puts "Welcome to Rock, Paper, Scissors, Lizard, Spock!"
    puts ""
  end

  def display_moves
    puts "#{human.name} chose #{human.move.name}."
    puts "#{computer.name} chose #{computer.move.name}."
    puts ""
  end

  def display_winner
    if human.move > computer.move
      puts "#{human.name} won!"
    elsif human.move < computer.move
      puts "#{computer.name} won!"
    else
      puts "Its a tie!"
    end
  end

  def display_goodbye_message
    puts "Thanks for playing Rock, Paper, Scissors, Lizard, Spock.  Goodbye!"
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp
      break if ['y', 'n'].include?(answer.downcase)
      puts "Sorry, must be y or n."
    end

    return false if answer.downcase == 'n'
    return true if answer.downcase == 'y'
    false
  end

  # game orchestration

  def play
    display_welcome_message
    loop do
      human.choose
      computer.choose
      display_moves
      display_winner
      break unless play_again?
    end
    display_goodbye_message
  end
end

RPSGame.new.play
