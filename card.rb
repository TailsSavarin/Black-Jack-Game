# frozen_string_literal: true

class Card
  RANK_AND_SCORE = {
    '2 ' => 2,
    '3 ' => 3,
    '4 ' => 4,
    '5 ' => 5,
    '6 ' => 6,
    '7 ' => 7,
    '8 ' => 8,
    '9 ' => 9,
    '10' => 10,
    'J ' => 10,
    'Q ' => 10,
    'K ' => 10,
    'A ' => 11
  }.freeze
  SUIT = ['♠', '♥', '♣', '♦'].freeze

  attr_reader :rank, :suit, :score

  def initialize(rank, suit, score)
    @rank = rank
    @suit = suit
    @score = score
  end
end
