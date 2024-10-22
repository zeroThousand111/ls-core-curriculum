# rubocop:disable Layout LineLength
=begin
 - display Dealer's cards at the end of the game regardless of outcome
 - utilise Player and Dealer classes
  - could some display methods go in here?
 X - add a new clear screen after hit or stay
 - introduce a new play again feature
 - introduce a @matches_won instance variable in Participant for Player and Dealer
 X -  create a Card class of object for each card with three instance variables: @face/name, @value and @suit
  X - generate a deck of 52 unique Card objects to collaborate with the Deck object
 - extend end of game messages
  - use a YAML file to offload some strings?
 -
=end
# rubocop:enable Layout LineLength

require 'pry'
require 'pry-byebug'

class Participant
  attr_accessor :hand, :total, :busted

  def initialize
    @hand = []
    @total = 0
    @busted = false
  end

  def calculate_total
    value_of_hand = 0
    hand.each do |card|
      value_of_hand += card.value
    end
    @total = adjust_total_for_aces(value_of_hand)
    change_busted_status?
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
end

class Dealer < Participant
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
        clear_screen
        display_player_hand
      elsif choice == 's'
        clear_screen
        display_stay
      end
      break if choice == 's' || player.busted
    end
    display_busted if player.busted
  end
  # rubocop:enable Metrics/MethodLength

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
    dealer.calculate_total
    loop do
      dealer_hit if dealer.total < 17
      dealer.calculate_total
      break if dealer.total > 16 || dealer.total < 22
    end

    display_dealer_turn
  end

  def determine_winner
    if player.busted || dealer.busted
      display_who_went_bust
    else
      display_who_scored_highest
    end
  end

  # deck methods

  def deal_cards
    player.hand << deck.deal << deck.deal
    dealer.hand << deck.deal << deck.deal
  end

  def player_hit
    player.hand << deck.deal
  end

  def dealer_hit
    dealer.hand << deck.deal
  end

  # display methods

  def show_initial_cards
    clear_screen
    puts "You have been dealt two cards from the deck."
    player.calculate_total
    display_player_hand
    puts ""
    puts display_dealer_hand
  end

  def display_player_hand
    puts ""
    puts "Your hand is:"
    puts ""
    display_all_cards
    puts ""
    player.calculate_total
    puts display_total
  end

  def display_all_cards
    player.hand.each do |card|
      puts "#{card.face.upcase} of #{card.suit.capitalize}"
    end
  end

  def display_dealer_hand
    if dealer.hand.size == 2
      display_dealer_hand_two_cards
    elsif dealer.hand.size > 2
      display_dealer_hand_three_or_more_cards
    end
  end

  def display_dealer_hand_two_cards
    "The dealer has the " \
      "#{dealer.hand[0].face.upcase} of #{dealer.hand[0].suit.upcase}, " \
      "and 1 unknown card."
  end

  def display_dealer_hand_three_or_more_cards
    "The dealer has the " \
      "#{dealer.hand[0].face.upcase} of #{dealer.hand[0].suit.upcase}, " \
      "and #{dealer.hand.size - 1} unknown cards."
  end

  def display_dealer_turn
    if dealer.busted
      display_dealer_busted
    else
      display_dealer_stay
    end
  end

  def display_total
    "The total value of your cards is #{player.total}"
  end

  def display_busted
    puts ""
    puts "Your total is #{player.total} and so you are BUST!"
    puts ""
  end

  def display_stay
    puts "You have decided to stay."
    display_player_hand
  end

  def display_dealer_busted
    puts "The dealer went BUST!"
  end

  def display_dealer_stay
    puts "The dealer has decided to stay."
    puts "The dealer has #{dealer.hand.size} cards in their hand."
  end

  def show_result
    puts ""
    puts "At the end of the match..."
    puts display_dealer_hand
    display_final_totals
    determine_winner
  end

  # rubocop:disable Metrics/AbcSize
  def display_who_went_bust
    if player.busted && dealer.busted
      puts "Both player and dealer went BUST!"
    elsif player.busted && !dealer.busted
      puts "Player went bust.  Dealer wins!"
    elsif !player.busted && dealer.busted
      puts "Dealer went bust.  Player wins!"
    end
  end

  def display_who_scored_highest
    if player.total > dealer.total
      puts "Player scored higher than dealer; PLAYER wins!"
    elsif player.total < dealer.total
      puts "Dealer scored higher than player; DEALER wins!"
    elsif player.total == dealer.total
      puts "The scores are tied!"
    end
  end
  # rubocop:enable Metrics/AbcSize

  def display_final_totals
    puts ""
    puts "Player scored #{player.total}. Dealer scored #{dealer.total}."
    puts ""
  end

  def clear_screen
    system "clear"
  end
end

Game.new.start

# six_of_hearts = Card.new("six", "hearts", 6)
# puts six_of_hearts
# deck = Deck.new
# puts deck.deal
