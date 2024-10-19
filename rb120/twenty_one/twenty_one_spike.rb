=begin
Twenty-One is a card game consisting of a dealer and a player, where the participants try to get as close to 21 as possible without going over.

Here is an overview of the game:
- Both participants are initially dealt 2 cards from a 52-card deck.
- The player takes the first turn, and can "hit" or "stay".
- If the player busts, he loses. If he stays, it's the dealer's turn.
- The dealer must hit until his cards add up to at least 17.
- If he busts, the player wins. If both player and dealer stays, then the highest total wins.
- If both totals are equal, then it's a tie, and nobody wins.
=end

class Participant
    # attr_reader :type_of_player
    attr_accessor   :hand

    # what goes in here? all the redundant behaviors from Player and Dealer?

    def initialize #(type_of_player)
        # what would the "data" or "states" of a Player object entail?
        # maybe cards? a name?
        @hand = []
        # @type_of_player = type_of_player
    end

    def display_cards
        puts "Your hand is:"
        hand.each do |card, suit, _|
            puts "#{card.upcase} of #{suit.capitalize}"
        end
        puts ""
        puts "The total value of your cards is #{total}"
    end
  
    def busted? # factor in aces. how to change value of ace cards if total > 21?
        adjusted_total = total
        aces_in_hand = count_aces_in_hand
        adjusted_total -= 10 * aces_in_hand
        adjusted_total > 21
    end

    def count_aces_in_hand
        count = 0
        hand.each do |card|
            if card[0] == 'ace'
                count += 1
            end
        end
        count
    end

    def display_busted
        puts "Your total is #{total} and so you are BUST!"
    end

    def stay
        puts "You have decided to stay."
        display_cards
    end
  
    def total
      total = 0
      hand.each do |_, _, value|
        total += value
      end
      total
    end
end

# class Player < Participant - probably don't need separate class for player
#     def initialize
#       # what would the "data" or "states" of a Player object entail?
#       # maybe cards? a name?
#     end
# end

# class Dealer < Participant - probably don't need separate class for dealer
#     def initialize
#       # seems like very similar to Player... do we even need this?
#     end
# end

class Deck
    attr_reader :deck

    # limited deck to test spike at first
    # DECK_OF_CARDS = [
    #     ['2S', 2], ['3S', 3], ['4S', 4], ['5S', 5], ['6S', 6], ['7S', 7], ['8S', 8], ['9S', 9], ['10S', 10], ['JofS', 10], ['QofS', 10], ['KofS', 10], ['AofS', 11], ['2D', 2], ['3D', 3], ['4D', 4], ['5D', 5], ['6D', 6], ['7D', 7], ['8D', 8], ['9D', 9], ['10D', 10], ['JofD', 10], ['QofD', 10], ['KofD', 10], ['AofD', 11]
    # ]

    DECK_OF_CARDS = [
        ["two", "spades", 2], ["three", "spades", 3], ["four", "spades", 4], ["five", "spades", 5], ["six", "spades", 6], ["seven", "spades", 7], ["eight", "spades", 8], ["nine", "spades", 9], ["ten", "spades", 10], ["jack", "spades", 10], ["queen", "spades", 10], ["king", "spades", 10], ["ace", "spades", 11], ["two", "diamonds", 2], ["three", "diamonds", 3], ["four", "diamonds", 4], ["five", "diamonds", 5], ["six", "diamonds", 6], ["seven", "diamonds", 7], ["eight", "diamonds", 8], ["nine", "diamonds", 9], ["ten", "diamonds", 10], ["jack", "diamonds", 10], ["queen", "diamonds", 10], ["king", "diamonds", 10], ["ace", "diamonds", 11], ["two", "hearts", 2], ["three", "hearts", 3], ["four", "hearts", 4], ["five", "hearts", 5], ["six", "hearts", 6], ["seven", "hearts", 7], ["eight", "hearts", 8], ["nine", "hearts", 9], ["ten", "hearts", 10], ["jack", "hearts", 10], ["queen", "hearts", 10], ["king", "hearts", 10], ["ace", "hearts", 11], ["two", "spades", 2], ["three", "spades", 3], ["four", "spades", 4], ["five", "spades", 5], ["six", "spades", 6], ["seven", "spades", 7], ["eight", "spades", 8], ["nine", "spades", 9], ["ten", "spades", 10], ["jack", "spades", 10], ["queen", "spades", 10], ["king", "spades", 10], ["ace", "spades", 11]
    ]

    def initialize
      # obviously, we need some data structure to keep track of cards - use an array of 'cards'
      @deck = create_deck
      # array, hash, something else?
      # hashes () {[name]=>face_value]}
      # name
    end
  
    def deal
      # does the dealer or the deck deal? - the deck to avoid confusion with the dealer also being a player
      # deal must mutate deck object by removing cards from deck when they are added to either hand (so cards can't be used twice)
        deck.shift
    end

    private

    def create_deck
        # need to be able to create and shuffle deck

        # implementation where each card is an array ['name', value]
        deck = DECK_OF_CARDS.shuffle

        # implementation where each card is a new Card object
        # deck = []
        # DECK_OF_CARDS.each do |card|
        #     deck << Card.new(card[0], card[1])
        # end
        # deck.shuffle
        # p deck
    end
end

# class Card
#     def initialize(name, face_value)
#       @name = name
#       @face_value = face_value
#       # or alt
#       # @suit e.g. 'diamonds'
#       # @name e.g. 'two'
#       # @face_value
#     end

#     def card_name
#         "#{name.upcase} of #{suit.capitalize}"
#     end

#     # def to_s
#     #     "#{name.upcase} of #{suit.capitalize}"
#     # end
# end
  
class Game
    attr_reader :deck, :player, :dealer
    def initialize
        # create randomised deck
        @deck = Deck.new
        # create player object
        @player = Participant.new #("player")
        # create dealer object
        @dealer = Participant.new #("dealer")
    end

    def start
      deal_cards
      show_initial_cards
      player_turn
    #   dealer_turn
    #   show_result
    end
 
    private

    def deal_cards
        player.hand << deck.deal << deck.deal
        dealer.hand << deck.deal << deck.deal
    end

    def show_initial_cards
        puts "You have been dealt two cards from the deck."
        player.display_cards
    end

    def player_turn
        loop do
            choice = get_player_choice
            if choice == 'h'
                player_hit
                player.display_cards
            elsif choice == 's' # is it necessary to even check?
                player.stay # is this necessary to have a method doing nothing?
            end
            break if choice == 's'  || player.busted?
        end
        player.display_busted if player.busted?
    end

    def get_player_choice
        valid_choices = ['h', 's']
        choice = nil
        loop do
            puts "Would you like to hit or stay?  Press h or s"
            choice = gets.chomp.downcase
            break if valid_choices.include?(choice)
            puts "That's not a valid answer."
        end
        choice
    end

    def player_hit
        player.hand << deck.deal
    end

end
  
Game.new.start