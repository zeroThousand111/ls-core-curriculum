=begin
In the previous two exercises, you developed a Card class and a Deck class. You are now going to use those classes to create and evaluate poker hands. Create a class, PokerHand, that takes 5 cards from a Deck of Cards and evaluates those cards as a Poker hand. If you've never played poker before, you may find this overview of poker hands useful.

You should build your class using the following code skeleton:

The exact cards and the type of hand will vary with each run.

Most variants of Poker allow both Ace-high (A, K, Q, J, 10) and Ace-low (A, 2, 3, 4, 5) straights. For simplicity, your code only needs to recognize Ace-high straights.

If you are unfamiliar with Poker, please see this description of the various hand types. Since we won't actually be playing a game of Poker, it isn't necessary to know how to play.
=end

# Include Card and Deck classes from the last two exercises.

require 'pry'
require 'pry-byebug'

class Deck
  attr_reader :cards

  RANKS = ((2..10).to_a + %w(Jack Queen King Ace)).freeze
  SUITS = %w(Hearts Clubs Diamonds Spades).freeze

  def initialize
    reset_deck
  end

  def draw
    reset_deck if cards.empty?
    cards.pop
  end

  private

  def reset_deck
    @cards = []
    SUITS.each do |suit|
      RANKS.each do |rank|
        cards << Card.new(rank, suit)
      end
    end
    @cards.shuffle! # shuffles deck in place
  end
end

class Card
  include Comparable

  attr_reader :rank, :suit

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def to_s
    "#{rank} of #{suit}"
  end

  def <=>(other_card)
    if convert_rank(rank) > convert_rank(other_card.rank)
      1
    elsif convert_rank(rank) < convert_rank(other_card.rank)
      -1
    elsif convert_rank(rank) == convert_rank(other_card.rank)
      0
    else
      nil
    end
  end

  def convert_rank(rank)
    case rank
    when 'Jack' then 11
    when 'Queen' then 12
    when 'King' then 13
    when 'Ace' then 14
    else
      rank
    end
  end
end

class PokerHand
  attr_reader :hand

  ROYAL_FLUSH_FACES = ['Ace', 'King', 'Queen', 'Jack', 10]
  REF_RANKS = [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]

  def initialize(deck)
    @hand = []
    5.times do |_|
      hand << deck.draw
    end
  end

  def print
    puts hand
  end

  def evaluate
    case
    when royal_flush?     then 'Royal flush'
    when straight_flush?  then 'Straight flush'
    when four_of_a_kind?  then 'Four of a kind'
    when full_house?      then 'Full house'
    when flush?           then 'Flush'
    when straight?        then 'Straight'
    when three_of_a_kind? then 'Three of a kind'
    when two_pair?        then 'Two pair'
    when pair?            then 'Pair'
    else                       'High card'
    end
  end

  private

  def royal_flush?
    # all cards are same suit AND ten, jack, queen, king & ace all present
    all_faces = hand.all? { |card| ROYAL_FLUSH_FACES.include?(card.rank) }
    all_same_suit? && all_faces
  end

  def straight_flush?
    # all cards are in a straight and all in same suit
    all_same_suit? && is_a_straight?
  end

  def four_of_a_kind?
    # four of the cards are the same rank
    create_tally_hash.any? { |key, value| value == 4 }
  end

  def full_house?
    # a full house is a three of a kind AND a pair
    pair? && three_of_a_kind?
  end

  def flush?
    # a flush is five cards of the same suit
    all_same_suit?
  end

  def straight?
    is_a_straight?
  end

  def three_of_a_kind?
    create_tally_hash.any? { |key, value| value == 3 }
  end

  def two_pair?
    tally_hash = create_tally_hash
    number_of_pairs = tally_hash.count { |k,v| v == 2 }
    number_of_pairs >= 2
  end

  def pair?
    create_tally_hash.any? { |key, value| value == 2 }
  end

  # my helper methods

  def all_same_suit?
    hand.all? do |card|
      card.suit == hand.first.suit
    end
  end

  def is_a_straight?
    # sort the ranks of the hand into order - use Enumberable#sort
    sorted_hand = hand.each_with_object([]) { |card, array| array << card.convert_rank(card.rank) }.sort

    # create test array
    start_index = REF_RANKS.index(sorted_hand[0])
    reference_array = (REF_RANKS[start_index]..(REF_RANKS[start_index + 4])).to_a

    # return true if sorted_hand is the same array as reference_array
    sorted_hand == reference_array
  end

  def create_tally_hash
    # format for the hash is 'rank' => frequency_count
    tally_hash = {}
    hand.each do |card|
      if tally_hash.include?(card.rank)
        tally_hash[card.rank] += 1
      else
        tally_hash[card.rank] = 1
      end
    end
    tally_hash
  end
end

# Danger danger danger: monkey
# patching for testing purposes.
class Array
  alias_method :draw, :pop
end

# LS Tests
hand = PokerHand.new(Deck.new)
hand.print
puts hand.evaluate

# Test that we can identify each PokerHand type.

hand = PokerHand.new([
  Card.new(10,      'Hearts'),
  Card.new('Ace',   'Hearts'),
  Card.new('Queen', 'Hearts'),
  Card.new('King',  'Hearts'),
  Card.new('Jack',  'Hearts')
])
puts hand.evaluate == 'Royal flush'

hand = PokerHand.new([
  Card.new(8,       'Clubs'),
  Card.new(9,       'Clubs'),
  Card.new('Queen', 'Clubs'),
  Card.new(10,      'Clubs'),
  Card.new('Jack',  'Clubs')
])
puts hand.evaluate == 'Straight flush'  # do this one next

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(3, 'Diamonds')
])
puts hand.evaluate == 'Four of a kind'

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(5, 'Hearts')
])
puts hand.evaluate == 'Full house'

hand = PokerHand.new([
  Card.new(10, 'Hearts'),
  Card.new('Ace', 'Hearts'),
  Card.new(2, 'Hearts'),
  Card.new('King', 'Hearts'),
  Card.new(3, 'Hearts')
])
puts hand.evaluate == 'Flush'

hand = PokerHand.new([          
  Card.new(8,      'Clubs'),
  Card.new(9,      'Diamonds'),
  Card.new(10,     'Clubs'),
  Card.new(7,      'Hearts'),
  Card.new('Jack', 'Clubs')
])
puts hand.evaluate == 'Straight'

hand = PokerHand.new([
  Card.new('Queen', 'Clubs'),
  Card.new('King',  'Diamonds'),
  Card.new(10,      'Clubs'),
  Card.new('Ace',   'Hearts'),
  Card.new('Jack',  'Clubs')
])
puts hand.evaluate == 'Straight'

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(6, 'Diamonds')
])
puts hand.evaluate == 'Three of a kind'

hand = PokerHand.new([
  Card.new(9, 'Hearts'),
  Card.new(9, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(8, 'Spades'),
  Card.new(5, 'Hearts')
])
puts hand.evaluate == 'Two pair'

hand = PokerHand.new([
  Card.new(2, 'Hearts'),
  Card.new(9, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(9, 'Spades'),
  Card.new(3, 'Diamonds')
])
puts hand.evaluate == 'Pair'

hand = PokerHand.new([
  Card.new(2,      'Hearts'),
  Card.new('King', 'Clubs'),
  Card.new(5,      'Diamonds'),
  Card.new(9,      'Spades'),
  Card.new(3,      'Diamonds')
])
puts hand.evaluate == 'High card'

=begin
Output:
5 of Clubs
7 of Diamonds
Ace of Hearts
7 of Clubs
5 of Spades
Two pair
true
true
true
true
true
true
true
true
true
true
true
true
true
=end
