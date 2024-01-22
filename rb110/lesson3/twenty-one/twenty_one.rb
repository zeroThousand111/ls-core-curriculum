# rubocop:disable Layout / LineLength

=begin

High level pseudocode:

1. Initialize deck
2. Deal cards to player and dealer
3. Player turn: hit or stay
  - repeat until bust or "stay"
4. If player bust, dealer wins.
5. Dealer turn: hit or stay
  - repeat until total >= 17
6. If dealer bust, player wins.
7. Compare cards and declare winner.

Naming of cards?
- Suit doesn't really matter here for this game;
  - A deck will therefore be four lots of each card;
- Integers or strings for names of cards?
  - strings seems better because:
    - naming cards for player feedback will require strings;
    - four face cards of each suit have names, not integers;
-

Data Structure for deck, player's cards and dealer's cards?

- Deck can be a big array:
[2, 3, 4, 5, 6, 7, 8, 9, 10, 'jack', 'queen', 'king', 'ace', 2, 3, 4 ...]

The index order can be randomised using `Array#shuffle` during deck creation

- player's cards and dealer's cards each will be an array
e.g. ['2', '7', '3', 'ace', 'queen']

The values of each card could be handled by a Hash in a constant:

CARD_VALUES = {'2' => 2, '3' => 3 ... 'jack' => 10, 'queen' => 10, }
But how to deal with 'ace' having a value of 10 or 1 depending upon the value of the hand?

=end

# rubocop:enable Layout / LineLength

require 'pry'
require 'pry-byebug'

CARD_VALUES = {
  '2' => 2,
  '3' => 3,
  '4' => 4,
  '5' => 5,
  '6' => 6,
  '7' => 7,
  '8' => 8,
  '9' => 9,
  '10' => 10,
  'jack' => 10,
  'queen' => 10,
  'king' => 10,
  'ace' => 11
}

# helper methods

def ask_name
  puts "Please enter your name:"
  gets.chomp.upcase
end

def valid_answer?(input)
  input.downcase == 'stay' || input.downcase == 's'
end

# display methods

# rubocop:disable Metrics / MethodLength

def welcome_screen
  welcome = <<-WELCOME
    8               88
    8     eeee eeeee 8 eeeee    eeeee e     eeeee e    e
    8e    8      8     8   "    8   8 8     8   8 8    8
    88    8eee   8e    8eeee    8eee8 8e    8eee8 8eeee8
    88    88     88       88    88    88    88  8   88
    88eee 88ee   88    8ee88    88    88eee 88  8   88      88 88 88
  WELCOME

  twenty_one = <<~TWENTY_ONE
    ████████╗██╗    ██╗███████╗███╗   ██╗████████╗██╗   ██╗       ██████╗ ███╗   ██╗███████╗
    ╚══██╔══╝██║    ██║██╔════╝████╗  ██║╚══██╔══╝╚██╗ ██╔╝      ██╔═══██╗████╗  ██║██╔════╝
       ██║   ██║ █╗ ██║█████╗  ██╔██╗ ██║   ██║    ╚████╔╝ █████╗██║   ██║██╔██╗ ██║█████╗
       ██║   ██║███╗██║██╔══╝  ██║╚██╗██║   ██║     ╚██╔╝  ╚════╝██║   ██║██║╚██╗██║██╔══╝
       ██║   ╚███╔███╔╝███████╗██║ ╚████║   ██║      ██║         ╚██████╔╝██║ ╚████║███████╗
       ╚═╝    ╚══╝╚══╝ ╚══════╝╚═╝  ╚═══╝   ╚═╝      ╚═╝          ╚═════╝ ╚═╝  ╚═══╝╚══════╝
  TWENTY_ONE

  system 'clear'
  puts ""
  puts welcome
  puts ""
  puts twenty_one
  puts ""
end

# rubocop:enable Metrics / MethodLength

def describe_hand(hand, hidden)
  array = hand.map { |card| card } # a version of deep copy?
  array[-1] = "and #{array[-1]}"
  if hidden == 'hidden'
    array.pop
    array.push("and an unknown card")
  end
  "#{array[0..-2].join(', ')} #{array[-1]}"
end

def describe_busted(hand)
  busted?(hand) ? "yes" : "no"
end

def display_dealer_cards(dealer_cards, quantity)
  puts ""
  puts "The DEALER's cards are: #{describe_hand(dealer_cards, quantity)}"
end

def display_player_cards(player_cards, quantity)
  puts "YOUR cards are: #{describe_hand(player_cards, quantity)}"
end

def player_busted(player_cards, name)
  puts ""
  puts "* * * * * * * * * * * * * * * * * * * *"
  puts ""
  puts "Sorry #{name}, you went bust!"
  display_player_cards(player_cards, 'all')
  puts "(The value of your hand was #{calculate_min_hand_value(player_cards)})"
end

def dealer_busted(name)
  puts ""
  puts "* * * * * * * * * * * * * * * * * * * *"
  puts ""
  puts "The DEALER went bust"
  puts "Congratulations, #{name}! You won!"
end

def player_win(player_cards, dealer_cards, name)
  puts ""
  puts "* * * * * * * * * * * * * * * * * * * *"
  puts ""
  display_player_cards(player_cards, 'all')
  puts "The value of your hand was #{calculate_min_hand_value(player_cards)}"
  display_dealer_cards(dealer_cards, 'all')
  puts "The value of the dealer's hand was " \
       "#{calculate_min_hand_value(dealer_cards)}"
  puts ""
  puts "Congratulations, #{name}!  YOU won!"
end

def dealer_win(player_cards, dealer_cards, name)
  puts ""
  puts "* * * * * * * * * * * * * * * * * * * *"
  puts ""
  display_player_cards(player_cards, 'all')
  puts "The value of your hand was #{calculate_min_hand_value(player_cards)}"
  display_dealer_cards(dealer_cards, 'all')
  puts "The value of the dealer's hand was " \
       "#{calculate_min_hand_value(dealer_cards)}"
  puts ""
  puts "Commiserations, #{name}! The DEALER won!"
end

def neither_win(name)
  puts ""
  puts "* * * * * * * * * * * * * * * * * * * *"
  puts ""
  puts "Well that's a turn up, #{name}! "
  puts "The values of both hands are the same: it is a TIE!"
end

# deck methods

def initialise_deck
  deck = []
  4.times do
    2.upto(10) do |n|
      deck << n.to_s
    end
    deck.push('jack', 'queen', 'king', 'ace')
  end
  deck.shuffle # randomises index numbers
end

def deal_new_hand!(deck)
  cards = []
  2.times do
    cards << deck.pop
  end
  cards
end

def hit!(hand, deck)
  hand << deck.pop
end

# calculation methods

def sum_hand_values(hand)
  total = 0
  hand.each do |card|
    total += CARD_VALUES[card]
  end
  total
end

def calculate_min_hand_value(hand)
  total = sum_hand_values(hand)
  aces = hand.count('ace')
  if total > 21 && aces > 0
    case aces
    when 1 then total -= 10
    when 2 then total -= 20
    when 3 then total -= 30
    when 4 then total -= 40
    end
  end
  total
end

def busted?(hand)
  calculate_min_hand_value(hand) > 21
end

def determine_winner(player_cards, dealer_cards, name)
  if busted?(player_cards)
    player_busted(player_cards, name)
  elsif busted?(dealer_cards)
    dealer_busted(name)
  else
    if calculate_min_hand_value(player_cards) > calculate_min_hand_value(dealer_cards)
      player_win(player_cards, dealer_cards, name)
    elsif calculate_min_hand_value(player_cards) < calculate_min_hand_value(dealer_cards)
      dealer_win(player_cards, dealer_cards, name)
    else
      neither_win(name)
    end
  end
end

# dealer decision method

def dealer_turn!(dealer_cards, deck)
  loop do
    break if busted?(dealer_cards) || calculate_min_hand_value(dealer_cards) > 17

    hit!(dealer_cards, deck)
  end
end

# player decision methods

def player_turn!(player_cards, deck, name)
  answer = nil
  loop do
    break if busted?(player_cards)

    display_player_cards(player_cards, 'all')
    puts ""
    puts "Hit or Stay, #{name}?"
    puts "Type 'stay' or 's' to stay; or any other key to hit..."
    answer = gets.chomp # do i need input validation here?
    break if valid_answer?(answer) || busted?(player_cards)

    hit!(player_cards, deck)
  end
end

def play_again?(name)
  puts ""
  puts "* * * * * * * * * * * * * * * * * * * *"
  puts ""
  puts "Do you want to play again, #{name}?"
  puts "Press Y for YES, any other key for NO."
  gets.chomp
end

# main game

system 'clear'
welcome_screen
name = ask_name
loop do
  system 'clear'
  welcome_screen
  deck = initialise_deck
  player_cards = deal_new_hand!(deck)
  dealer_cards = deal_new_hand!(deck)
  display_dealer_cards(dealer_cards, 'hidden')
  player_turn!(player_cards, deck, name)
  dealer_turn!(dealer_cards, deck)
  determine_winner(player_cards, dealer_cards, name)
  answer = play_again?(name)
  break unless answer.downcase == 'y'
end

# outro

puts ""
puts "* * * * * * * * * * * * * * * * * * * *"
puts ""
puts "Thanks for playing Twenty-One, #{name}!"
puts "I hope to see you again soon!"
puts ""
puts "* * * * * * * * * * * * * * * * * * * *"
