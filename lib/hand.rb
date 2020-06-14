require_relative 'deck'

class Hand

    attr_reader :holdings

    def initialize(deck)
        @holdings = [deck.draw,deck.draw,deck.draw,deck.draw,deck.draw]
    end
end