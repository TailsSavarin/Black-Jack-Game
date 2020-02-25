# frozen_string_literal: true

# General Player class
class Player
  attr_reader :name, :cards, :bank

  def initialize(name)
    @name = name
    @bank = Bank.new(100)
    @cards = []
  end
end
