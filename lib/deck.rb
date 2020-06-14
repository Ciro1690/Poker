class Deck

    SUITS = ['diamonds','hearts','spades','clubs']
    VALUES = ['2','3','4','5','6','7','8','9','10','J','Q','K','A']

    attr_reader :cards

    def initialize
        @cards = []
        fill_deck
    end

    def fill_deck
        VALUES.each do |value|
            SUITS.each do |suit|
                @cards << Card.new(value,suit)
            end
        end
    end
end