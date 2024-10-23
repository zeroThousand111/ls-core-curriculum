# rubocop:disable Layout LineLength
=begin
 X - display Dealer's cards at the end of the game regardless of outcome
 X - utilise Player and Dealer classes
  X - could some display methods go in here?
 X - add a new clear screen after hit or stay
 X - introduce a new play again feature
 X - introduce a @matches_won instance variable in Participant for Player and Dealer
 X -  create a Card class of object for each card with three instance variables: @face/name, @value and @suit
  X - generate a deck of 52 unique Card objects to collaborate with the Deck object
 X - extend end of game messages
  - use a YAML file to offload some strings?
 - fix issue with dealer scoring less than 17 (is this an aces effect?)
=end
# rubocop:enable Layout LineLength

require 'pry'
require 'pry-byebug'

class Participant
  attr_accessor :hand, :total, :busted, :matches_won

  def initialize
    @hand = []
    @total = 0
    @busted = false
    @matches_won = 0
  end

  def participant_reset
    self.hand = []
    self.total = 0
    self.busted = false
  end

  def calculate_total
    value_of_hand = 0
    hand.each do |card|
      value_of_hand += card.value
    end
    @total = adjust_total_for_aces(value_of_hand)
    change_busted_status?
  end

  def hit(current_deck)
    self.hand << current_deck.deal
  end

  def display_whole_hand
    self.hand.each do |card|
      puts "#{card.face.upcase} of #{card.suit.capitalize}"
    end
  end

  private

  def change_busted_status?
    @busted = true if @total > 21
  end

  def adjust_total_for_aces(value_of_hand)
    if value_of_hand > 21
      aces_in_hand = count_aces_in_hand
      return value_of_hand - (10 * aces_in_hand)
    end
    value_of_hand
  end

  def count_aces_in_hand
    count = 0
    hand.each do |card|
      if card.face == 'ace'
        count += 1
      end
    end
    count
  end
end

class Player < Participant
  def display_whole_hand
    puts ""
    puts "Your hand is:"
    puts ""
    super
  end

  def display_total
    puts ""
    puts "The total value of your cards is #{self.total}"
  end
end

class Dealer < Participant
  def display_whole_hand
    puts ""
    puts "The dealer's hand is:"
    puts ""
    super
  end

  def display_some_of_hand
    if self.hand.size == 2
      display_hand_two_cards
    elsif self.hand.size > 2
      display_hand_three_or_more_cards
    end
  end

  def display_total
    "The total value of the dealer's cards is #{self.total}"
  end

  private

  def display_hand_two_cards
    puts "The dealer has the " \
      "#{self.hand[0].face.upcase} of #{self.hand[0].suit.upcase}, " \
      "and 1 unknown card."
  end

  def display_hand_three_or_more_cards
    puts "The dealer has the " \
      "#{self.hand[0].face.upcase} of #{self.hand[0].suit.upcase}, " \
      "and #{self.hand.size - 1} unknown cards."
  end
end

class Deck
  attr_reader :deck

  SUITS = ["hearts", "diamonds", "spades", "clubs"]
  FACES = [
    ["two", 2],
    ["three", 3],
    ["four", 4],
    ["five", 5],
    ["six", 6],
    ["seven", 7],
    ["eight", 8],
    ["nine", 9],
    ["ten", 10],
    ["jack", 10],
    ["queen", 10],
    ["king", 10],
    ["ace", 11]
  ]

  def initialize
    @deck = create_deck.shuffle
  end

  def deal
    deck.shift
  end

  private

  def create_deck
    deck = []
    SUITS.each do |suit|
      FACES.each do |face, value|
        deck << Card.new(face, suit, value)
      end
    end
    deck
  end
end

class Card
  attr_reader :face, :suit, :value

  def initialize(face, suit, value)
    @face = face
    @suit = suit
    @value = value
  end

  def to_s
    "#{face.upcase} of #{suit.upcase}"
  end
end

class Game
  attr_reader :deck, :player, :dealer

  def initialize
    @deck = Deck.new
    @player = Player.new
    @dealer = Dealer.new
  end

  def start
    display_welcome_message
    any_key_to_begin = gets.chomp
    loop do
      one_game
      break unless play_again?
    end
    puts "Thanks for playing Twenty One!  Goodbye!"
  end

  def one_game
    reset_game
    deal_cards
    show_initial_cards
    player_turn
    dealer_turn
    show_result
  end

  private

  # game methods

  # rubocop:disable Metrics/MethodLength
  def player_turn
    loop do
      choice = player_choice
      if choice == 'h' # deliberate separation of doing and displaying methods
        player_hit
      elsif choice == 's'
        player_stay
      end
      break if choice == 's' || player.busted
    end
    display_busted if player.busted
  end
  # rubocop:enable Metrics/MethodLength

  def player_hit
    clear_screen
    puts "You've chosen to hit!"
    player.hit(deck)
    player.display_whole_hand
    player.calculate_total
    player.display_total
  end

  def player_stay
    clear_screen
    display_stay
  end

  def player_choice
    valid_choices = ['h', 's']
    choice = nil
    loop do
      puts ""
      puts "Would you like to hit or stay?  Press h or s"
      choice = gets.chomp.downcase
      break if valid_choices.include?(choice)

      puts "That's not a valid answer."
    end
    choice
  end

  def dealer_turn
    loop do
      dealer.calculate_total
      dealer_hit unless dealer.total > 16
      dealer.calculate_total
      break if dealer.total > 16
    end

    display_dealer_turn
  end

  def dealer_hit
    puts ""
    puts "The dealer has decided to hit..."
    dealer.hit(deck)
    dealer.calculate_total
  end

  def reset_game
    player.participant_reset
    dealer.participant_reset
  end

  def determine_winner
    if player.busted || dealer.busted
      display_who_went_bust
    else
      display_who_scored_highest
    end
  end

  def play_again?
    valid_choices = ['y', 'n']
    choice = nil
    loop do
      puts "Would you like to play again?  (y or n)"
      choice = gets.chomp.downcase
      break if valid_choices.include?(choice)

      puts "That's not a valid choice."
    end

    return true if choice == 'y'

    false
  end

  # deck methods

  def deal_cards
    player.hand << deck.deal << deck.deal
    dealer.hand << deck.deal << deck.deal
  end

  # display methods

  def display_welcome_message
    clear_screen
    puts "Welcome to Twenty One!"
    puts ""
    puts "Press the RETURN key to continue..."
  end

  def show_initial_cards
    clear_screen
    puts "You have been dealt two cards from the deck."
    player.calculate_total
    player.display_whole_hand
    player.display_total
    puts ""
    dealer.display_some_of_hand
  end

  def display_player_hand
    puts ""
    puts "Your hand is:"
    puts ""
    player.display_whole_hand
    puts ""
    player.calculate_total
    player.display_total
  end

  def display_dealer_turn
    if dealer.busted
      display_dealer_busted
    else
      display_dealer_stay
    end
  end

  def display_busted
    puts ""
    puts "Your total is #{player.total} and so you are BUST!"
    puts ""
  end

  def display_stay
    puts "You have decided to stay."
    player.display_whole_hand
  end

  def display_dealer_busted
    puts "The dealer went BUST!"
  end

  def display_dealer_stay
    puts ""
    puts "The dealer has decided to stay."
    puts "The dealer has #{dealer.hand.size} cards in their hand."
  end

  def show_result
    # clear_screen
    puts ""
    puts "At the end of that round..."
    dealer.display_whole_hand
    player.display_whole_hand
    display_final_totals
    determine_winner
    display_matches_won
  end

  # rubocop:disable Metrics/AbcSize
  def display_who_went_bust
    if player.busted && dealer.busted
      puts "Both you and the dealer went BUST!"
    elsif player.busted && !dealer.busted
      puts "You went bust.  Dealer wins!"
      dealer.matches_won += 1
    elsif !player.busted && dealer.busted
      puts "Dealer went bust.  You win!"
      player.matches_won += 1
    end
  end

  def display_who_scored_highest
    if player.total > dealer.total
      puts "You scored higher than the dealer; YOU win!"
      player.matches_won += 1
    elsif player.total < dealer.total
      puts "The Dealer scored higher than you; DEALER wins!"
      dealer.matches_won += 1
    elsif player.total == dealer.total
      puts "The scores are tied!"
    end
  end
  # rubocop:enable Metrics/AbcSize

  def display_final_totals
    puts ""
    puts "Your total is #{player.total}. The dealer's total is #{dealer.total}."
    puts ""
  end

  def display_matches_won
    puts ""
    puts "You have won #{player.matches_won} matches."
    puts "The Dealer has won #{dealer.matches_won} matches."
  end

  def clear_screen
    system "clear"
  end
end

Game.new.start
