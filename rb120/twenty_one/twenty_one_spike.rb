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
    attr_accessor   :hand, :total, :busted

    def initialize #(type_of_player)
        @hand = []
        @total = 0
        @busted = false
    end

    def calculate_total
        value_of_hand = 0
        hand.each do |_, _, face_value|
          value_of_hand += face_value
        end
        @total = adjust_total_for_aces(value_of_hand)
        change_busted_status?
    end

    private

    def change_busted_status?
        @busted = true if @total > 21
    end

    def adjust_total_for_aces(value_of_hand)
        if @total > 21
            aces_in_hand = count_aces_in_hand
            return value_of_hand - (10 * aces_in_hand)
        else
            return value_of_hand
        end
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
end

class Player < Participant
    def initialize
      super
    end
end

class Dealer < Participant
    def initialize
      super
    end

    def display_one_card
        "The dealer has the #{hand[0][0].upcase} of #{hand[0][1].upcase}, and an unknown card."
    end
end

class Deck
    attr_reader :deck

    DECK_OF_CARDS = [
        ["two", "spades", 2], ["three", "spades", 3], ["four", "spades", 4], ["five", "spades", 5], ["six", "spades", 6], ["seven", "spades", 7], ["eight", "spades", 8], ["nine", "spades", 9], ["ten", "spades", 10], ["jack", "spades", 10], ["queen", "spades", 10], ["king", "spades", 10], ["ace", "spades", 11], ["two", "diamonds", 2], ["three", "diamonds", 3], ["four", "diamonds", 4], ["five", "diamonds", 5], ["six", "diamonds", 6], ["seven", "diamonds", 7], ["eight", "diamonds", 8], ["nine", "diamonds", 9], ["ten", "diamonds", 10], ["jack", "diamonds", 10], ["queen", "diamonds", 10], ["king", "diamonds", 10], ["ace", "diamonds", 11], ["two", "hearts", 2], ["three", "hearts", 3], ["four", "hearts", 4], ["five", "hearts", 5], ["six", "hearts", 6], ["seven", "hearts", 7], ["eight", "hearts", 8], ["nine", "hearts", 9], ["ten", "hearts", 10], ["jack", "hearts", 10], ["queen", "hearts", 10], ["king", "hearts", 10], ["ace", "hearts", 11], ["two", "spades", 2], ["three", "spades", 3], ["four", "spades", 4], ["five", "spades", 5], ["six", "spades", 6], ["seven", "spades", 7], ["eight", "spades", 8], ["nine", "spades", 9], ["ten", "spades", 10], ["jack", "spades", 10], ["queen", "spades", 10], ["king", "spades", 10], ["ace", "spades", 11]
    ]

    def initialize
      @deck = create_deck
    end
  
    def deal
        deck.shift
    end

    private

    def create_deck
        deck = DECK_OF_CARDS.shuffle
    end
end
  
class Game
    attr_reader :deck, :player, :dealer
    def initialize
        # create randomised deck
        @deck = Deck.new
        # create player object
        @player = Player.new #("player")
        # create dealer object
        @dealer = Dealer.new #("dealer")
    end

    def start
      deal_cards
      show_initial_cards
      player_turn
    #   dealer_turn
    #   show_result
    end
 
    private

    # game methods

    def player_turn
        loop do
            choice = get_player_choice
            if choice == 'h'
                player_hit
                display_player_hand
            elsif choice == 's'
                display_stay
            end
            break if choice == 's'  || player.busted
        end
        display_busted if player.busted
    end

    def get_player_choice
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

    # deck methods

    def deal_cards
        player.hand << deck.deal << deck.deal
        dealer.hand << deck.deal << deck.deal
    end

    def player_hit
        player.hand << deck.deal
    end

    # display methods

    def show_initial_cards
        clear_screen
        puts "You have been dealt two cards from the deck."
        player.calculate_total
        display_player_hand
        puts ""
        display_dealer_hand
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
        player.hand.each do |card, suit, _|
            puts "#{card.upcase} of #{suit.capitalize}"
        end
    end

    def display_dealer_hand
        puts dealer.display_one_card
    end

    def display_total
        "The total value of your cards is #{player.total}"
    end

    def display_busted
        puts "Your total is #{player.total} and so you are BUST!"
    end

    def display_stay
        puts "You have decided to stay."
        display_player_hand
    end

    def clear_screen
        system "clear"
    end
end
  
Game.new.start