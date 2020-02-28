# frozen_string_literal: true

class Player
  START_BALANCE = 100
  BET = 10
  WIN = 20

  attr_accessor :balance
  attr_reader :hand

  def initialize(balance = START_BALANCE)
    @balance = balance
    @hand = Hand.new
  end

  def can_bet?
    @balance >= BET
  end

  def place_bet
    if can_bet?
      @balance -= BET
    else
      puts 'You cannot place a bet, your balance is to low!'
    end
  end

  def draw_bet
    @balance += BET
  end

  def win_bet
    @balance += WIN
  end
end
