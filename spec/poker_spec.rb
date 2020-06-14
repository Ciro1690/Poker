require 'deck'
require 'card'
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
            expect(deck.cards[0]).to eq()
        end
    end
end