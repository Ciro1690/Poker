class Hand

    attr_reader :holdings

    def initialize(deck)
        @holdings = [deck.draw,deck.draw,deck.draw,deck.draw,deck.draw]
        @ranking = 0
    end
end