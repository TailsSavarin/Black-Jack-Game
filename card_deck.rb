# frozen_string_literal: true

require_relative 'card'

class CardDeck
  attr_reader :cards_deck

  def initialize
    @cards_deck = []
    deck_creation
  end

  def deck_creation
    Card::RANK_AND_SCORE.each do |rank, score|
      Card::SUIT.each do |suit|
        @cards_deck << Card.new(rank, suit, score)
      end
    end
  end

  def shuffle_deck
    @cards_deck.shuffle!
  end
end
