=begin
Create an object-oriented number guessing class for numbers in the range 1 to 100, with a limit of 7 guesses per game. The game should play like this:

---
You have 7 guesses remaining.
Enter a number between 1 and 100: 104
Invalid guess. Enter a number between 1 and 100: 50
Your guess is too low.

You have 6 guesses remaining.
Enter a number between 1 and 100: 75
Your guess is too low.

You have 5 guesses remaining.
Enter a number between 1 and 100: 85
Your guess is too high.

You have 4 guesses remaining.
Enter a number between 1 and 100: 0
Invalid guess. Enter a number between 1 and 100: 80

You have 3 guesses remaining.
Enter a number between 1 and 100: 81
That's the number!

You won!
--- 
You have 7 guesses remaining.
Enter a number between 1 and 100: 50
Your guess is too high.

You have 6 guesses remaining.
Enter a number between 1 and 100: 25
Your guess is too low.

You have 5 guesses remaining.
Enter a number between 1 and 100: 37
Your guess is too high.

You have 4 guesses remaining.
Enter a number between 1 and 100: 31
Your guess is too low.

You have 3 guesses remaining.
Enter a number between 1 and 100: 34
Your guess is too high.

You have 2 guesses remaining.
Enter a number between 1 and 100: 32
Your guess is too low.

You have 1 guess remaining.
Enter a number between 1 and 100: 32
Your guess is too low.

You have no more guesses. You lost!
---

Note that a game object should start a new game with a new number to guess with each call to #play.
=end

class GuessingGame
  def initialize
    @number_of_guesses = 7
    @mystery_number = (1..100).to_a.sample
    @guess = nil
  end

  def play
    system "clear"
    loop do
      display_status
      ask_for_guess
      display_guess_feedback
      self.number_of_guesses -= 1
      break if number_of_guesses == 0 || correct_guess?
    end
    display_outcome
  end

  private

  attr_reader :mystery_number
  attr_accessor :guess, :number_of_guesses

  def display_status
    puts ""
    puts "You have #{number_of_guesses} guesses remaining."
  end

  def ask_for_guess
    puts "Enter a number between 1 and 100:"
    self.guess = gets.chomp.to_i
  end

  def display_guess_feedback
    if guess > mystery_number
      puts "Your guess is too high."
    elsif guess < mystery_number
      puts "Your guess is too low."
    else
      puts "That's the number!"
    end
  end

  def correct_guess?
    guess == mystery_number 
  end

  def display_outcome
    puts ""
    if correct_guess?
      puts "You won!"
    else
      puts "You have no more guesses. You lost!"
    end
  end
end

game = GuessingGame.new
game.play
