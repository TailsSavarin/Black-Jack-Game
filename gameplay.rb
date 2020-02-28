# frozen_string_literal: true

require_relative 'interface'
require_relative 'user'
require_relative 'dealer'
require_relative 'hand'
require_relative 'card_deck'

class Gameplay
  MAX_SCORE = 21

  def initialize
    @interface = Interface.new
    interface.welcome_logo
    initialize_player
    interface.welcome_info(user)
    game_menu
    interface.end_logo
  end

  protected

  attr_reader :interface, :user, :dealer, :card_deck

  def game_menu
    condition = true
    while condition && can_play?
      main_menu
      interface.condition_info(user)
      condition = gets.chomp.to_i != 0
    end
  end

  def main_menu
    loop do
      choice = interface.main_menu_choice
      case choice
      when 1
        interface.start_logo
        start_game
        turn_menu
        results
        clear_hands
        break
      when 2
        interface.game_rules
      when 3
        interface.current_balance(user, dealer)
      end
    end
  end

  def start_game
    initialize_deck
    deal_cards
    make_bet
  end

  def results
    interface.results_info(user, dealer)
    if draw?
      interface.draw
      user.draw_bet
      dealer.draw_bet
    elsif user_win?
      user.win_bet
      interface.win(user)
    else
      dealer.win_bet
      interface.win(dealer)
    end
  end

  def initialize_player
    name = interface.initialization
    @user = User.new(name)
    @dealer = Dealer.new
  end

  def clear_hands
    user.hand.clear_cards
    dealer.hand.clear_cards
  end

  def initialize_deck
    @card_deck = CardDeck.new
  end

  def deal_cards
    interface.deal_info
    2.times { user.hand.take_card(card_deck) }
    2.times { dealer.hand.take_card(card_deck) }
  end

  def make_bet
    bet = Player::BET
    user.place_bet
    dealer.place_bet
    interface.bet_info(bet, user, dealer)
  end

  def turn_condition?
    user.hand.limit_cards? && dealer.hand.limit_cards?
  end

  def turn_menu
    loop do
      if turn_condition?
        interface.open_cards(user)
        break
      else
        interface.cards_info(user, dealer)
        choice = interface.user_turn_info
        case choice
        when 1
          interface.skip_turn(user)
        when 2
          interface.take_card(user)
          user.hand.take_card(card_deck)
        when 3
          interface.open_cards(user)
          break
        end

        dealer_turn
      end
    end
  end

  def dealer_turn
    interface.dealer_turn_info
    if dealer.hand.score_points < 17
      interface.take_card(dealer)
      dealer.hand.take_card(card_deck)
    else
      interface.skip_turn(dealer)
    end
  end

  def draw?
    user.hand.score_points == dealer.hand.score_points
  end

  def user_win?
    user.hand.score_points > dealer.hand.score_points
  end

  def can_play?
    user.can_bet? && dealer.can_bet?
  end
end
