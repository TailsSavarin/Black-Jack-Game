# frozen_string_literal: true

require_relative 'card'

class CardDeck
  attr_reader :deck

  def initialize
    @cards = []
    Card::SUITS.each do |suit|
      Card::RANKS.each { |rank| @cards << Card.new(rank, suit) }
    end
    @cards.shuffle!
  end

  def deal
    @cards.pop
  end
end
