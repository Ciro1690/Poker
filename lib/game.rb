require_relative 'player'
require_relative 'deck'

class Game

    attr_reader :deck, :player1, :player2

    def initialize
        @deck = Deck.new
        @deck.shuffle
        @player1 = Player.new(deck,1500)
        @player2 = Player.new(deck,1500)
        @current_player = @player1

        until game_over?
            take_turn(@current_player)
        end
    end

    def game_over?
        if @player1.pot == 0
            print "player2 wins!"
            return true
        elsif @player2.pot == 0
            print "player1 wins!"
            return true
        end
        return false
    end

    def take_turn
        if @current_player == @player1
            @current_player = @player2
        else
            @current_player = @player1
        end
    end

    def winning_hand?(hand1,hand2)
        hand1.ranking > hand2.ranking
    end
end