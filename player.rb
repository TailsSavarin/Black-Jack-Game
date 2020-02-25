# frozen_string_literal: true

# General Player class
class Player
  attr_reader :name, :cards, :bank

  def initialize(name)
    @name = name
    @bank = bank
    @cards = []
  end
end
