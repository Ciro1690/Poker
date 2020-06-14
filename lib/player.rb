require_relative 'hand'
require 'colorize'

class Player

    attr_reader :hand, :pot, :deck

    CARD_COLORS = {
        "clubs" => :green,
        "diamonds" => :blue,
        "hearts" => :red,
        "spades" => :black
    }

    def initialize(deck, pot)
        @hand = Hand.new(deck)
        @pot = pot
        @deck = deck
    end

    def print_hand
        @hand.holdings.each do |card|
            print card.value.colorize(CARD_COLORS[card.suit])
        end
    end

    def discard
        print "Would you like to discard a card? (y/n) "
        answer = gets.chomp

        if answer == 'y'
            print "Which card would you like to discard? "
            card_index = gets.chomp
            @hand.holdings[card_index.to_i] = deck.draw
            print_hand
            discard
        end
    end

    def decide(bet=0)
        if bet = 0
            print "What would you like to bet? "
            starting_bet = gets.chomp
            @pot -= starting_bet
            return starting_bet
        else
            print "Would you like to fold, see or raise? "
            answer = gets.chomp

            if answer == "fold"
                @hand.holdings.delete
            elsif answer == "see"
                @pot -= bet
            elsif answer == "raise"
                print "How much would you like to raise? "
                raise = gets.chomp
                @pot -= raise.to_i
            end
        end
    end
end