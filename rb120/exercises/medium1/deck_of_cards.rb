=begin
Using the Card class from the previous exercise, create a Deck class that contains all of the standard 52 playing cards. Use the following code to start your work:

class Deck
  RANKS = ((2..10).to_a + %w(Jack Queen King Ace)).freeze
  SUITS = %w(Hearts Clubs Diamonds Spades).freeze
end
The Deck class should provide a #draw method to deal one card. The Deck should be shuffled when it is initialized and, if it runs out of cards, it should reset itself by generating a new set of 52 shuffled cards.

Examples:

deck = Deck.new
drawn = []
52.times { drawn << deck.draw }
drawn.count { |card| card.rank == 5 } == 4
drawn.count { |card| card.suit == 'Hearts' } == 13

drawn2 = []
52.times { drawn2 << deck.draw }
drawn != drawn2 # Almost always.
Note that the last line should almost always be true; if you shuffle the deck 1000 times a second, you will be very, very, very old before you see two consecutive shuffles produce the same results. If you get a false result, you almost certainly have something wrong.
=end

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
      # now compare suits
      # return 0 only if two cards are same rank AND same suit
      compare_suits(other_card)
    else
      nil
    end
  end

  private

  def compare_suits(other_card)
    if convert_suit(suit) > convert_suit(other_card.suit)
      1
    elsif convert_suit(suit) < convert_suit(other_card.suit)
      -1
    elsif convert_suit(suit) == convert_suit(other_card.suit)
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

def convert_suit(suit)
  case suit
  when 'Spades' then 4
  when 'Hearts' then 3
  when 'Clubs' then 2
  when 'Diamonds' then 1
  end
end

# My Tests
# deck = Deck.new
# p deck.cards.size == 52
# puts deck.cards.first
# puts deck.draw
# puts deck.draw

# deck = Deck.new
# drawn = []
# 53.times { drawn << deck.draw } # deck should reset itself
# p drawn

# LS tests

deck = Deck.new
drawn = []
52.times { drawn << deck.draw }
puts drawn.count { |card| card.rank == 5 } == 4
puts drawn.count { |card| card.suit == 'Hearts' } == 13

drawn2 = []
52.times { drawn2 << deck.draw }
puts drawn != drawn2 # Almost always.