=begin
Assume you're playing a game in which cards of the same rank are unequal. In such a game, each suit also has a ranking. Suppose that, in this game, a 4 of Spades outranks a 4 of Hearts which outranks a 4 of Clubs which outranks a 4 of Diamonds. A 5 of Diamonds, though, outranks a 4 of Spades since we compare ranks first. Update the Card class so that #min and #max pick the card of the appropriate suit if two or more cards of the same rank are present in the Array.

# Suit ranking
1. Spades
2. Hearts
3. Clubs
4. Diamonds
=end

class Card
  include Comparable

  attr_reader :rank, :suit

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
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

# My tests

cards = [Card.new('Ace', 'Hearts'),
Card.new('Ace', 'Diamonds'),
Card.new('Ace', 'Clubs')]

puts cards
puts cards.min == Card.new('Ace', 'Diamonds')
puts cards.max == Card.new('Ace', 'Hearts')