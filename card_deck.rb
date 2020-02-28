# frozen_string_literal: true

require_relative 'card'

class CardDeck
  SUITS = %w[♠ ♥ ♣ ♦].freeze
  RANKS = [*(2..10), 'J', 'Q', 'K', 'A'].freeze

  attr_reader :deck

  def initialize
    @cards = []
    SUITS.each do |suit|
      RANKS.each { |rank| @cards << Card.new(rank, suit) }
    end
    @cards.shuffle!
  end

  def deal
    @cards.pop
  end
end
