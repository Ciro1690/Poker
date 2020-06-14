require 'game'
require 'rspec'

describe Card do
    subject(:cards) {Card.new('10','hearts')}

    describe "#initialize" do
        it "assigns a suit to a card" do
            expect(cards.suit).to eq('hearts')
        end

        it "assigns a value to a card" do
            expect(cards.value).to eq('10')
        end
    end
end

describe Deck do
    subject(:deck) {Deck.new}

    describe "#initialize" do
        it "populates an array with card objects" do
            expect(deck.cards[0]).to be_a(Card)
        end
    end

    describe "#fill_deck" do
        it "fills cards array with 52 objects" do
            expect(deck.cards.length).to eq(52)
        end
    end

    describe "#shuffle" do
        it "shuffles cards array" do
            deck.cards.should =~ deck.shuffle
            deck.cards[0] != deck.shuffle[0]
            deck.cards[1] != deck.shuffle[1]
        end
    end

    describe "#draw" do
        it "returns the first element of the deck and removes it from the deck" do
            deck.draw
            expect(deck.cards.length).to eq(51)
            expect(deck.draw).to be_a(Card)
        end
    end
end

describe Hand do 
    subject(:deck) {Deck.new}
    subject(:hand) {Hand.new(deck)}

    describe "#initialize" do
        it "assigns holdings to an array of 5 card objects" do
            expect(hand.holdings.length).to eq(5)
            expect(hand.holdings[0]).to be_a(Card)
            expect(deck.cards.length).to eq(47)
        end
    end
end

describe Player do
    subject(:deck) {Deck.new}
    subject(:player) {Player.new(deck,1500)}

    describe "#initialize" do
        it "creates the holdings for a player" do
            expect(player.hand.holdings.length).to eq(5)
        end
        it "creates a pot for a player" do
            expect(player.pot).to eq(1500)
        end
    end
end

describe Game do
    subject(:game) {Game.new}

    describe "#initialize" do
        it "creates a deck" do
            expect(game.deck).to be_a(Deck)
        end
        it "creates two unique players" do
            expect(game.player1).to be_a(Player)
            expect(game.player2).to be_a(Player)
            expect(game.player1).not_to be(game.player2)
        end
        it " "
    end
end
    