# frozen_string_literal: true

class Card
  SUITS = %w[♠ ♥ ♣ ♦].freeze
  RANKS = [*(2..10), 'J', 'Q', 'K', 'A'].freeze
  HIGH_RANKS = %w[J Q K].freeze

  attr_reader :rank, :suit

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def ace?
    rank == 'A'
  end

  def high_rank?
    HIGH_RANKS.include?(rank)
  end

  def score
    return 11 if ace?
    return 10 if high_rank?

    rank
  end
end
