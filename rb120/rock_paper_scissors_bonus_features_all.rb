=begin
Rock, Paper Scissors | All Bonus Features
=end

module Displayable
  def line_break
    puts ""
    puts " - - - - -"
    puts ""
  end
end

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
    other_move.is_a?(Spock) || other_move.is_a?(Scissors)
  end

  def <(other_move)
    other_move.is_a?(Rock) || other_move.is_a?(Scissors)
  end
end

class Spock
  attr_reader :name

  def initialize
    @name = 'Spock'
  end

  def >(other_move)
    other_move.is_a?(Rock) || other_move.is_a?(Scissors)
  end

  def <(other_move)
    other_move.is_a?(Paper) || other_move.is_a?(Lizard)
  end
end

class Move
  attr_reader :value

  VALUES = ['rock', 'paper', 'scissors', 'lizard', 'spock']

  def initialize(value)
    case value
    when 'rock'
      @value = Rock.new
    when 'paper'
      @value = Paper.new
    when 'scissors'
      @value = Scissors.new
    when 'lizard'
      @value = Lizard.new
    when 'spock'
      @value = Spock.new
    end
  end
end

class Player
  attr_accessor :move, :name

  include Displayable

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
      line_break
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
    self.name = ['R2D2', 'C3PO', 'HAL2000', 'MARVIN'].sample
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

class History
  attr_accessor :round, :results

  def initialize
    @round = 0
    @results = []
  end

  def record_results(human_move, computer_move)
    results << [round, human_move, computer_move]
    self.round += 1
  end

  def display_results
    results.each do |sub_array|
      puts "In round #{sub_array[0]} human chose #{sub_array[1]} and computer chose #{sub_array[2]}."
    end
  end
end

class RPSGame
  attr_accessor :human, :computer, :score, :history

  include Displayable

  ROUNDS_TO_WIN = 3

  def initialize
    @human = Human.new
    @computer = Computer.new
    @score = Score.new
    @history = History.new
  end

  def display_welcome_message
    line_break
    puts "Welcome to Rock, Paper, Scissors, Lizard, Spock!"
    puts "Are you ready, #{human.name}?"
    puts "Match finishes when one player has won #{ROUNDS_TO_WIN} rounds."
  end

  def display_moves
    line_break
    puts "#{human.name} chose #{human.move.value.name}."
    puts "#{computer.name} chose #{computer.move.value.name}."
  end

  def display_score
    puts "#{human.name} : #{score.human_score}"
    puts "#{computer.name} : #{score.computer_score}"
    puts "#{score.ties} rounds have been tied."
  end

  def display_current_score
    line_break
    puts "The current score is:"
    display_score
  end

  def display_final_score
    line_break
    puts "The final score is:"
    display_score
  end

  def display_match_winner
    line_break
    if score.human_score >= ROUNDS_TO_WIN
      puts "Congratulations, #{human.name}, you won the match!"
    elsif score.computer_score >= ROUNDS_TO_WIN
      puts "Commiserations, #{human.name}..."
      puts "You lost the match to #{computer.name}!"
    end
  end

  def human_round_win
    puts "#{human.name} won!"
    score.human_score += 1
  end

  def computer_round_win
    puts "#{computer.name} won!"
    score.computer_score += 1
  end

  def tied_round
    puts "Its a tie!"
    score.ties += 1
  end

  def record_history
    history.record_results(human.move.value.name, computer.move.value.name)
  end

  def determine_round_winner
    if human.move.value > computer.move.value
      human_round_win
    elsif human.move.value < computer.move.value
      computer_round_win
    else
      tied_round
    end
    display_current_score
    record_history
  end

  def display_goodbye_message
    line_break
    puts "Thanks for playing Rock, Paper, Scissors, Lizard, Spock #{human.name}"
    puts "Goodbye!"
    line_break
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

  def match_finished?
    score.human_score == ROUNDS_TO_WIN || score.computer_score == ROUNDS_TO_WIN
  end

  def reset_scores
    score.human_score = 0
    score.computer_score = 0
    score.ties = 0
  end

  def play_one_round
    human.choose
    computer.choose
    display_moves
    determine_round_winner
  end

  def play_one_match
    loop do # one round
      play_one_round
      break if match_finished?
    end
    display_final_score
    display_match_winner
    line_break
    history.display_results
    reset_scores
  end

  def play # orchestration engine
    display_welcome_message
    loop do # one match
      play_one_match
      break unless play_again?
    end
    display_goodbye_message
  end
end

RPSGame.new.play
