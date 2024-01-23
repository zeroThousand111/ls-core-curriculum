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

TARGET_SCORE = 21

DEALER_STAY_VALUE = 17

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

def display_scoreboard(player_rounds, dealer_rounds, tied_rounds, name)
  puts "* * * *   Scoreboard - rounds won so far:   * * * * * *"
  puts ""
  puts "#{name}: #{player_rounds} | DEALER: #{dealer_rounds} \
  | TIED: #{tied_rounds}"
  display_line_break
end

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

def display_final_hands_and_scores(player_cards, dealer_cards, player_total,
                                   dealer_total)
  display_player_cards(player_cards, 'all')
  puts "The value of your hand was #{player_total}."
  display_dealer_cards(dealer_cards, 'all')
  puts "The value of the dealer's hand was " \
       "#{dealer_total}."
end

def display_line_break
  puts ""
  puts "* * * * * * * * * * * * * * * * * * * * * * * * * * * *"
  puts ""
end

def display_round_winner(player_cards, dealer_cards, name,
                         player_total, dealer_total)
  if busted?(player_total)
    player_busted(player_cards, dealer_cards, name, player_total, dealer_total)
  elsif busted?(dealer_total)
    dealer_busted(player_cards, dealer_cards, name, player_total, dealer_total)
  elsif player_total > dealer_total
    player_win(player_cards, dealer_cards, name, player_total, dealer_total)
  elsif player_total < dealer_total
    dealer_win(player_cards, dealer_cards, name, player_total, dealer_total)
  else
    neither_win(player_cards, dealer_cards, name, player_total, dealer_total)
  end
end

def player_busted(player_cards, dealer_cards, name, player_total, dealer_total)
  display_line_break
  display_final_hands_and_scores(player_cards, dealer_cards,
                                 player_total, dealer_total)
  puts ""
  puts "Sorry, #{name}, you went bust!"
end

def dealer_busted(player_cards, dealer_cards, name, player_total, dealer_total)
  display_line_break
  display_final_hands_and_scores(player_cards, dealer_cards, player_total,
                                 dealer_total)
  puts ""
  puts "The DEALER went bust"
  puts "Congratulations, #{name}! You won!"
end

def player_win(player_cards, dealer_cards, name, player_total, dealer_total)
  display_line_break
  display_final_hands_and_scores(player_cards, dealer_cards, player_total,
                                 dealer_total)
  puts ""
  puts "Congratulations, #{name}!  YOU won!"
end

def dealer_win(player_cards, dealer_cards, name, player_total, dealer_total)
  display_line_break
  display_final_hands_and_scores(player_cards, dealer_cards, player_total,
                                 dealer_total)
  puts ""
  puts "Commiserations, #{name}! The DEALER won!"
end

def neither_win(player_cards, dealer_cards, name, player_total, dealer_total)
  display_line_break
  display_final_hands_and_scores(player_cards, dealer_cards, player_total,
                                 dealer_total)
  puts ""
  puts "Well that's a turn up, #{name}! "
  puts "The values of both hands are the same: it is a TIE!"
end

# rubocop:disable Style/RedundantInterpolation

def declare_match_winner(player_rounds, dealer_rounds, tied_rounds, name)
  if player_rounds > dealer_rounds
    match_winner = "#{name}"
  elsif dealer_rounds > player_rounds
    match_winner = "DEALER"
  end
  display_line_break
  puts "The final scores are:"
  puts "#{name} - #{player_rounds}"
  puts "DEALER - #{dealer_rounds}"
  puts "TIED - #{tied_rounds}"
  puts ""
  puts "The match winner is #{match_winner}!"
end

# rubocop:enable Style/RedundantInterpolation

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
  if total > TARGET_SCORE && aces > 0
    case aces
    when 1 then total -= 10
    when 2 then total -= 20
    when 3 then total -= 30
    when 4 then total -= 40
    end
  end
  total
end

def busted?(total)
  total > TARGET_SCORE
end

# rubocop:disable Lint / DuplicateBranch
# rubocop:disable Style / ConditionalAssignment

def determine_winner(player_total, dealer_total)
  if busted?(player_total)
    winner = :dealer
  elsif busted?(dealer_total)
    winner = :player
  elsif player_total > dealer_total
    winner = :player
  elsif player_total < dealer_total
    winner = :dealer
  else
    winner = :neither
  end
  winner
end

# rubocop:enable Lint / DuplicateBranch

# dealer decision method

# rubocop:disable Lint/ConstantResolution

def dealer_turn!(dealer_cards, deck, dealer_total)
  loop do
    break if busted?(dealer_total) || dealer_total >= DEALER_STAY_VALUE

    hit!(dealer_cards, deck)
    dealer_total = calculate_min_hand_value(dealer_cards)
  end
end

# rubocop:enable Lint/ConstantResolution

# player decision methods

def player_turn!(player_cards, deck, name, player_total)
  answer = nil
  loop do
    break if busted?(player_total)

    display_player_cards(player_cards, 'all')
    puts ""
    puts "Hit or Stay, #{name}?"
    puts "Type 'stay' or 's' to stay; or any other key to hit..."
    answer = gets.chomp # do i need input validation here?
    break if valid_answer?(answer) || busted?(player_total)

    hit!(player_cards, deck)
    player_total = calculate_min_hand_value(player_cards)
  end
end

def play_again?(name)
  display_line_break
  puts "Do you want to play another match again, #{name}?"
  puts "Press Y for YES, any other key for NO."
  gets.chomp
end

# main game

system 'clear'
welcome_screen
name = ask_name

# rubocop:disable Metrics/BlockLength

loop do # 5-round match loop
  player_rounds = 0
  dealer_rounds = 0
  tied_rounds = 0
  round_winner = nil
  system 'clear'

  # rubocop:disable Lint/ConstantResolution

  loop do # 1-round loop
    welcome_screen
    deck = initialise_deck
    player_cards = deal_new_hand!(deck)
    player_total = calculate_min_hand_value(player_cards)
    dealer_cards = deal_new_hand!(deck)
    dealer_total = calculate_min_hand_value(dealer_cards)
    display_scoreboard(player_rounds, dealer_rounds, tied_rounds, name)
    display_dealer_cards(dealer_cards, 'hidden')
    player_turn!(player_cards, deck, name, player_total)
    player_total = calculate_min_hand_value(player_cards)
    loop do
      break if busted?(player_total) || dealer_total >= DEALER_STAY_VALUE
      dealer_turn!(dealer_cards, deck, dealer_total)
      dealer_total = calculate_min_hand_value(dealer_cards)
    end
    display_round_winner(player_cards, dealer_cards, name, player_total,
                         dealer_total)
    round_winner = determine_winner(player_total, dealer_total)
    if round_winner == :player
      player_rounds += 1
    elsif round_winner == :dealer
      dealer_rounds += 1
    else
      tied_rounds += 1
    end
    break if player_rounds >= 5 || dealer_rounds >= 5
    puts ""
    puts "Press ENTER to continue to the next round..."
    gets.chomp
  end

  declare_match_winner(player_rounds, dealer_rounds, tied_rounds, name)
  answer = play_again?(name)
  break unless answer.downcase == 'y'
end

# rubocop:enable Metrics/BlockLength
# rubocop:enable Lint/ConstantResolution

# outro

display_line_break
puts "Thanks for playing Twenty-One, #{name}!"
puts "I hope to see you again soon!"
display_line_break
