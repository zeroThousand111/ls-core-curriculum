# Using the Card class from the previous exercise, create a Deck class that contains all of the standard 52 playing cards. Use the following code to start your work:

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

  protected
  def <=>(other)
    self.interpret_rank <=> other.interpret_rank
  end

  def interpret_rank
    case rank
    when 2..10 then rank
    when 'Jack' then 11
    when 'Queen' then 12
    when 'King' then 13
    when 'Ace' then 14
    end
  end
end

class Deck
  RANKS = ((2..10).to_a + %w(Jack Queen King Ace)).freeze
  SUITS = %w(Hearts Clubs Diamonds Spades).freeze

  attr_accessor :deck

  def initialize
    @deck = []
    SUITS.each do |suit|
      RANKS.each do |rank|
        deck << Card.new(rank, suit)
      end
    end
    self.deck.shuffle!
    
    # display_deck
  end

  def draw
    deck.class
    if deck.empty?
      self.deck = Deck.new
    else
      self.deck.pop
    end
  end

  def empty?
    deck.empty?
  end

  def pop
    deck.pop
  end

  def ==(other)
    # self.deck == other.deck
    52.times do |index|
      self.deck[index] == other.deck[index]
    end
  end

  # my own helper methods
  def display_deck
    deck.each do |card|
      puts card
    end
  end
    
end

=begin
The Deck class should provide a #draw method to deal one card. The Deck should be shuffled when it is initialized and, if it runs out of cards, it should reset itself by generating a new set of 52 shuffled cards.

Examples:

=end

deck = Deck.new
drawn = []
52.times { drawn << deck.draw }
puts drawn.count { |card| card.rank == 5 } == 4
puts drawn.count { |card| card.suit == 'Hearts' } == 13

drawn2 = []
52.times { drawn2 << deck.draw }
drawn != drawn2 # Almost always.

=begin
Note that the last line should almost always be true; if you shuffle the deck 1000 times a second, you will be very, very, very old before you see two consecutive shuffles produce the same results. If you get a false result, you almost certainly have something wrong.
=end