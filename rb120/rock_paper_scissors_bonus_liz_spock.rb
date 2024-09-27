=begin
Rock, Paper Scissors Bonus Features
Adding Lizard & Spock move options to RPSGame
=end

class Move
  VALUES = ['rock', 'paper', 'scissors', 'lizard', 'spock']

  def initialize(value)
    @value = value
  end

  def rock?
    @value == 'rock'
  end

  def paper?
    @value == 'paper'
  end

  def scissors?
    @value == 'scissors'
  end

  def lizard?
    @value == 'lizard'
  end

  def spock?
    @value == 'spock'
  end

  def rock_other_move_greater(other_move)
    other_move.scissors? || other_move.lizard?
  end

  def paper_other_move_greater(other_move)
    other_move.rock? || other_move.spock?
  end

  def scissors_other_move_greater(other_move)
    other_move.paper? || other_move.lizard?
  end

  def lizard_other_move_greater(other_move)
    other_move.paper? || other_move.spock?
  end

  def spock_other_move_greater(other_move)
    other_move.scissors? || other_move.rock?
  end

  # AbcSize, Cyclometric Complexity & Perceived Complexity issues here

  # def >(other_move)
  #   (rock? && (other_move.scissors? || other_move.lizard?)) ||
  #     (paper? && (other_move.rock? || other_move.spock?)) ||
  #     (scissors? && (other_move.paper? || other_move.lizard?)) ||
  #     (lizard? && (other_move.paper? || other_move.spock?)) ||
  #     (spock? && (other_move.scissors? || other_move.rock?))
  # end

  # def <(other_move)
  #   (rock? && (other_move.paper? || other_move.spock?)) ||
  #     (paper? && (other_move.scissors? || other_move.lizard?)) ||
  #     (scissors? && (other_move.rock? || other_move.spock?)) ||
  #     (lizard? && (other_move.scissors? || other_move.rock?)) ||
  #     (spock? && (other_move.lizard? || other_move.paper?))
  # end

  def >(other_move)
    (rock? && rock_other_move_greater(other_move)) ||
      (paper? && paper_other_move_greater(other_move)) ||
      (scissors? && scissors_other_move_greater(other_move)) ||
      (lizard? && lizard_other_move_greater(other_move)) ||
      (spock? && spock_other_move_greater(other_move))
  end

  def <(other_move)
    (rock? && (other_move.paper? || other_move.spock?)) ||
      (paper? && (other_move.scissors? || other_move.lizard?)) ||
      (scissors? && (other_move.rock? || other_move.spock?)) ||
      (lizard? && (other_move.scissors? || other_move.rock?)) ||
      (spock? && (other_move.lizard? || other_move.paper?))
  end

  def to_s
    @value
  end
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

  def choose
    choice = nil
    loop do
      puts "Please choose rock, paper, scissors, lizard or spock."
      choice = gets.chomp
      break if Move::VALUES.include?(choice)
      puts "Sorry, invalid choice."
    end
    self.move = Move.new(choice)
  end
end

class Computer < Player
  def set_name
    self.name = ['R2D2', 'C3PO', 'Hal2000', 'Marvin'].sample
  end

  def choose
    self.move = Move.new(Move::VALUES.sample)
  end
end

class Score
  attr_accessor :human_score, :computer_score, :ties

  def initialize
    @human_score = 0
    @computer_score = 0
    @ties = 0
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
    puts "#{human.name} chose #{human.move}."
    puts "#{computer.name} chose #{computer.move}."
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
