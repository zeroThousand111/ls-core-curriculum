=begin
Rock, Paper Scissors Bonus Features
Adding History-Keeping Function on top of
Score-Keeping Function to RPSGame

THIS CODE HAS ISSUES WITH ZERO-ING THE SCORE AFTER ONE MATCH!

Data structure?
A hash with round integer as key and outcome as a string
{1=>"Round 1. Computer chose rock.  Name chose paper.  Name won."}
Or simpler just an array of strings
[
  "Round 1. Computer chose rock.  Name chose paper.  Name won.", 
  "Round 2. Computer chose paper.  Name chose paper.  It was a tie!."
  ]
  
Use output from game interpolated into the string.

OR 2D array

[
  [round, player_choice, computer_choice, who_won],
  [round, player_choice, computer_choice, who_won],
  etc
]

Then 
=end

# class History
#   attr_accessor :array, :round

#   def initialize
#     @array = []
#     @round = 1
#   end
  
#   def record_history
#     array << [round, human.move, computer.move]
#     @round += 1
#   end
  
#   def display_history
#     puts " "
#     puts "Here is a breakdown of the match..."
#     puts array
#     array.each do |results|
#       puts "In round #{results[0]}, player chose #{results[1]}, Computer chose #{results[2]}" #", and so #{results[3]}."
#     end
#     puts " "
#   end
# end

class Move
  VALUES = ['rock', 'paper', 'scissors']

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

  def >(other_move)
    (rock? && other_move.scissors?) ||
      (paper? && other_move.rock?) ||
      (scissors? && other_move.paper?)
  end

  def <(other_move)
    (rock? && other_move.paper?) ||
      (paper? && other_move.scissors?) ||
      (scissors? && other_move.rock?)
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
      puts "Please choose rock, paper or scissors."
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
  attr_accessor :human, :computer, :score, :history_array, :round
  
  NO_OF_GAMES_TO_WIN = 3

  def initialize
    @human = Human.new
    @computer = Computer.new
    @score = Score.new
    @history_array = []
    @round = 1
  end
  
  def record_history
    history_array << [round, human.move, computer.move]
    @round += 1
  end
  
  def display_history
    puts " "
    puts "Here is a breakdown of the match..."
    history_array.each do |results|
      puts "In round #{results[0]}, #{human.name} chose #{results[1]}, #{computer.name} chose #{results[2]}" #", and so #{results[3]}."
    end
    puts " "
  end

  def display_welcome_message
    puts "Welcome to Rock, Paper, Scissors!"
    puts "The winner is the player who reaches a score of #{NO_OF_GAMES_TO_WIN}"
    puts ""
  end

  def display_moves
    puts "#{human.name} chose #{human.move}."
    puts "#{computer.name} chose #{computer.move}."
    puts ""
  end

  def display_score
    puts ""
    puts "The current score is..."
    puts "#{human.name} #{score.human_score}"
    puts "#{computer.name} #{score.computer_score}"
    puts "...and #{score.ties} tied rounds!"
  end

  def human_wins_round
    puts "#{human.name} won the round!"
    score.human_score += 1
  end

  def computer_wins_round
    puts "#{computer.name} won the round!"
    score.computer_score += 1
  end

  def display_round_winner
    if human.move > computer.move
      human_wins_round
    elsif human.move < computer.move
      computer_wins_round
    else
      puts "Its a tie!"
      score.ties += 1
    end
    display_score
  end

  def display_match_winner
    if score.human_score == NO_OF_GAMES_TO_WIN
      puts "Congratulations, #{human.name}, you won the match!"
    else
      puts "Commisserations, #{human.name}, #{computer.name} won the match."
    end
  end

  def display_goodbye_message
    puts "Thanks for playing Rock, Paper, Scissors.  Goodbye!"
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

  def play_one_round
    human.choose
    computer.choose
    display_moves
    display_round_winner
    record_history
  end

  def play # the orchestration engine
    display_welcome_message
    
    loop do
      loop do
        play_one_round
        break if score.human_score == NO_OF_GAMES_TO_WIN || score.computer_score == NO_OF_GAMES_TO_WIN
      end
      display_match_winner
      display_history
      break unless play_again?
    end
    display_goodbye_message
  end
end

RPSGame.new.play
