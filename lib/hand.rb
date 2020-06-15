class Hand

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

    attr_reader :holdings, :ranking

    def initialize(deck)
        @holdings = bubble_sort([deck.draw,deck.draw,deck.draw,deck.draw,deck.draw])
        @hand_string = ""
        @holdings.each do |card|
            @hand_string += card.value 
        end

        valsArr = []
        File.foreach("pokerhands.txt") {|line| (valsArr << line) if line.include?(@hand_string) }
        first_suit = @holdings[0].suit

        if  @holdings.all? {|card| card.suit == first_suit}
            valsArr = valsArr[1].split(' ')
        else
            valsArr = valsArr[0].split(' ')
        end

        @hand_name = valsArr[1...-1].join(' ')
        @ranking = valsArr[0].to_i
    end

    def bubble_sort(cards)
        return cards if cards.size <= 1
        swap = true

        while swap
            swap = false
            (cards.length - 1).times do |card_index|
                if VALUES[cards[card_index].value] < VALUES[cards[card_index+1].value]
                    cards[card_index], cards[card_index+1] = cards[card_index+1], cards[card_index]
                    swap = true
                end
            end
        end
        cards
    end
end
