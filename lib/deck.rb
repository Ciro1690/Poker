require_relative 'card'

class Deck

    SUITS = ['diamonds','hearts','spades','clubs']
    #VALUES = ['A','K','Q','J','T','9','8','7','6','5','4','3','2']
    VALUES = {
        'A' => 14,
        'K' => 13,
        'Q' => 12,
        'J' => 11,
        'T' => 10,
        '9' => 9,
        '8' => 8,
        '7' => 7,
        '6' => 6,
        '5' => 5,
        '4' => 4,
        '3' => 3,
        '2' => 2
        }
    attr_reader :cards

    def initialize
        @cards = []
        fill_deck
        shuffle
    end

    def fill_deck
        VALUES.each do |key,value|
            SUITS.each do |suit|
                @cards << Card.new(key,suit)
            end
        end
    end

    def shuffle
        @cards.shuffle!
    end

    def draw
        @cards.shift
    end
end