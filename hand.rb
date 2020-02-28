# frozen_string_literal: true

class Hand
  MAX_CARDS = 3
  BACK_SIDE = '
███████
█═════█
█═════█
█═════█
█═════█
█═════█
███████'
  attr_accessor :cards

  def initialize
    @cards = []
  end

  def score_points
    max_score = Gameplay::MAX_SCORE
    points = cards.sum(&:score)
    points -= 10 if points > max_score && cards.any?(&:ace?)
    points = 0 if points > max_score
    points
  end

  def take_card(card_deck)
    if can_add?
      @cards << card_deck.deal
    else
      puts "You can't take more, 3 cards is the maximum"
    end
  end

  def can_add?
    @cards.length <= MAX_CARDS
  end

  def limit_cards?
    @cards.length >= MAX_CARDS
  end

  def card_front
    cards.each do |card|
      puts "
███████
█ #{card.rank} ══█
█═════█
█═ #{card.suit} ═█
█═════█
█══ #{card.rank} █
███████"
    end
  end

  def card_back
    cards.each { |card| puts BACK_SIDE }
  end

  def clear_cards
    @cards.clear
  end
end
