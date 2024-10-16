class Board
    WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                    [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # cols
                    [[1, 5, 9], [3, 5, 7]]              # diagonals
  
    def initialize
      @squares = {}
      reset
    end
  
    def []=(num, marker)
      @squares[num].marker = marker
    end
  
    def unmarked_keys
      @squares.keys.select { |key| @squares[key].unmarked? }
    end
  
    def full?
      unmarked_keys.empty?
    end
  
    def someone_won?
      !!winning_marker
    end
  
    def winning_marker
      WINNING_LINES.each do |line|
        squares = @squares.values_at(*line)
        if three_identical_markers?(squares)
          return squares.first.marker
        end
      end
      nil
    end
  
    def reset
      (1..9).each { |key| @squares[key] = Square.new }
    end
  
    # rubocop:disable Metrics/AbcSize
    def draw
      puts "     |     |"
      puts "  #{@squares[1]}  |  #{@squares[2]}  |  #{@squares[3]}"
      puts "     |     |"
      puts "-----+-----+-----"
      puts "     |     |"
      puts "  #{@squares[4]}  |  #{@squares[5]}  |  #{@squares[6]}"
      puts "     |     |"
      puts "-----+-----+-----"
      puts "     |     |"
      puts "  #{@squares[7]}  |  #{@squares[8]}  |  #{@squares[9]}"
      puts "     |     |"
    end
    # rubocop:enable Metrics/AbcSize
  
    private
  
    def three_identical_markers?(squares)
      markers = squares.select(&:marked?).collect(&:marker)
      return false if markers.size != 3
      markers.min == markers.max
    end
  end
  
  class Square
    INITIAL_MARKER = " "
  
    attr_accessor :marker
  
    def initialize(marker=INITIAL_MARKER)
      @marker = marker
    end
  
    def to_s
      @marker
    end
  
    def unmarked?
      marker == INITIAL_MARKER
    end
  
    def marked?
      marker != INITIAL_MARKER
    end
  end
  
  class Player
    attr_reader :marker, :name
  
    def initialize(type)
      @type = type
      @name = create_name
      @marker = choose_marker
    end

    private

    def choose_human_marker
        valid_choices = ['x', 'X', 'o', 'O']
        loop do
            puts "Choose if you want to be X or O"
            choice = gets.chomp
            marker_choice = choice.upcase
            break if valid_choices.include?(marker_choice)
            puts "That's not a valid choice."
        end
        marker_choice
    end

    def choose_computer_marker
        if TTTGame::human.marker == 'X'
            marker_choice = 'O'
        elsif TTTGame::human.marker == 'O'
            marker_choice = 'X'
        end
        marker_choice
    end

    def choose_marker
        if type == 'human'
            choice = choose_human_marker
        elsif type == 'computer'
            choice = choose_computer_marker
        end
        choice
    end

    def create_name
        if type == 'human'
          create_human_name
        elsif type == 'computer'
          create_computer_name
        end
    end

    def create_human_name
        human_name = nil
        loop do
          puts "Please enter your name:"
          human_name = gets.chomp
          break unless human_name.empty?
        end
        human_name.upcase
    end

    def create_computer_name
      ["R2D2", "C3PO", "HAL-2000"].sample
    end
  end
  
  class TTTGame
    HUMAN_MARKER = nil
    COMPUTER_MARKER = nil
    FIRST_TO_MOVE = human
  
    attr_reader :board, :human, :computer
  
    def initialize
      @board = Board.new
      @human = Player.new(HUMAN_MARKER)
      @computer = Player.new(COMPUTER_MARKER)
      @current_marker = FIRST_TO_MOVE
      HUMAN_MARKER = player.marker
      COMPUTER_MARKER = computer.marker
    end
  
    def play
      clear
      display_welcome_message
      main_game
      display_goodbye_message
    end
  
    private
  
    def main_game
      loop do
        display_board
        player_move
        display_result
        break unless play_again?
        reset
        display_play_again_message
      end
    end
  
    def player_move
      loop do
        current_player_moves
        break if board.someone_won? || board.full?
        clear_screen_and_display_board if human_turn?
      end
    end
  
    def display_welcome_message
      puts "Welcome to Tic Tac Toe!"
      puts ""
    end
  
    def display_goodbye_message
      puts "Thanks for playing Tic Tac Toe! Goodbye!"
    end
  
    def clear_screen_and_display_board
      clear
      display_board
    end
  
    def human_turn?
      @current_marker == HUMAN_MARKER
    end
  
    def display_board
      puts "#{human.name}, you're a #{human.marker}. #{computer.name } (computer) is a #{computer.marker}."
      puts ""
      board.draw
      puts ""
    end
  
    def human_moves
      puts "Choose a square (#{board.unmarked_keys.join(', ')}): "
      square = nil
      loop do
        square = gets.chomp.to_i
        break if board.unmarked_keys.include?(square)
        puts "Sorry, #{human.name}, that's not a valid choice."
      end
  
      board[square] = human.marker
    end
  
    def computer_moves
      board[board.unmarked_keys.sample] = computer.marker
    end
  
    def current_player_moves
      if human_turn?
        human_moves
        @current_marker = COMPUTER_MARKER
      else
        computer_moves
        @current_marker = HUMAN_MARKER
      end
    end
  
    def display_result
      clear_screen_and_display_board
  
      case board.winning_marker
      when human.marker
        puts "You won!"
      when computer.marker
        puts "#{computer.name} won!"
      else
        puts "It's a tie!"
      end
    end
  
    def play_again?
      answer = nil
      loop do
        puts "Would you like to play again, #{human.name}? (y/n)"
        answer = gets.chomp.downcase
        break if %w(y n).include? answer
        puts "Sorry, must be y or n"
      end
  
      answer == 'y'
    end
  
    def clear
      system "clear"
    end
  
    def reset
      board.reset
      @current_marker = FIRST_TO_MOVE
      clear
    end
  
    def display_play_again_message
      puts "Let's play again, #{human.name}!"
      puts ""
    end
  end
  
  game = TTTGame.new
  game.play