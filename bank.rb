# frozen_string_literal: true

class Bank
  attr_reader :total_amount

  def initialize(total_amount = 0)
    @total_amount = total_amount
  end

  def replenish_bank(amount)
    self.total_amount += amount
  end

  def withdraw_bank(amount)
    return unless amount >= self.total_amount

    self.total_amount -= amount
  end

  def reset_bank
    @total_amount = 0
  end
end
