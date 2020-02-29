# frozen_string_literal: true

class Interface
  def welcome_logo
    introduction = <<~INTRODUCTION
      ### Hello and Welcome to the Black Jack Game!! ###

      ░░░░░░░░░▄▄▄▄▄▄▄▄████▄▄▄▄░░░░░░░░░░░░░
      ░░░░░░▄▄█▀▀▀▀░░░░░█░░░░▀▀▀▀██▄▄░░░░░░░
      ░░░▄█▀▀░██░░░░░░░█▀░░░░░░░░▄███░░░░░░░
      ▄█▀▀░░░░██░░░░░█▄█░░░░░▄░▄█▀░░▀█▄░░░░░
      ░▀█░░░░███░░░▄███▀░░▄████▀░░░░░░▀█▄░░░
      ░░▀█░░░░██░░▀████░░▀███▀░▄▄░░░░░░░█▄░░
      ░░░▀█▄░████░░░░█▀▄▄█▀▀░░████▄░░░░░░▀█▄
      ░░░░░█▄░▀▀█░░░▄████▄░░░░██████░░░▄█▀▀░
      ░░░░░░█▄░░█░░░██▀▀█░░░░░▀▀▀▀▀▀░▄█▀░░░░
      ░░░░░░░▀█░██▄▄█░░██▄░░░░░░░░░▄█▀░░░░░░
      ░░░░░░░░▀█▄██▀░░▄█▄██▄░░░░░▄█▀░░░░░░░░
      ░░░░░░░░░█▀░░░░░█░▀░░██▄▄▄█▀░░░░░░░░░░
      ░░░░░░░░░█░░░░░░█░░░▀░░█▀░░░░░░░░░░░░░
      ░░░░░░░░░█░░░░░░█░░░░▄█▀░░░░░░░░░░░░░░
      ░░░░░░░░░█▄░░░░░▀░░░░█░░░░░░░░░░░░░░░░
      ░░░░░░░░░▄█░░░░░░░░░█▀░░░░░░░░░░░░░░░░
      ░░░░░░░░███▄▄▄░░░░░▄▀░░░░░░░░░░░░░░░░░
      ░░░░░░░▀████████▄▄█▀░░░░░░░░░░░░░░░░░░
      ░░░░░░░░░░▀▀▀█████▄░░░░░░░░░░░░░░░░░░░

    INTRODUCTION
    puts introduction
  end

  def game_rules
    game_info = <<~INFO

      -------------------------------- RULES --------------------------------
      - Dealer deals 2 cards to the players and two to himself;
      - Blackjack card values: All cards count their face value in blackjack;
      - Picture cards count as 10 and the ace can count as either 1 or 11;
      - Card suits have no meaning in blackjack;
      - The winner is the one, whose score will be 21;
      - Or the one whose result will be closest to 21.

    INFO
    puts game_info
  end

  def main_menu_choice
    main_menu = <<~MAIN
      -------------------------------------------
         ## Type  '1' ##
         - For start the game
         ## Type  '2' ##
         - For watching game rules
         ## Type  '3' ##
         - For see players current balance
      ⬇⬇⬇⬇ Enter your answer ⬇⬇⬇⬇
    MAIN
    puts main_menu
    gets.chomp.to_i
  end

  def start_logo
    start_game = <<~START

      ------------------------------------------------
      ----------- # The New Game Started # -----------
      ------------------------------------------------

    START
    puts start_game
  end

  def end_logo
    end_game = <<~FINISH

      ------------------------------------------------
      ----------------- # Good Bye # -----------------
      ------------------------------------------------

    FINISH
    puts end_game
  end

  def initialization
    print 'Enter your name here --> '
    gets.chomp.capitalize
  end

  def welcome_info(user)
    puts "Hey #{user.name}! Hope you enjoy this game! Let's start!\n "
  end

  def current_balance(user, dealer)
    puts "Your current balance: $#{user.balance}"
    puts "Dealer current balance: $#{dealer.balance}\n "
  end

  def deal_info
    puts 'Dealer deals two cards'
  end

  def bet_info(bet, user, dealer)
    puts "The size of the bet: $#{bet}"
    current_balance(user, dealer)
  end

  def cards_info(user, dealer)
    puts 'Your cards:'
    user.hand.card_front
    puts "Your current score points: -#{user.hand.score_points}-"
    puts 'Dealer cards:'
    dealer.hand.card_back
  end

  def user_turn_info
    user_turn = <<~TURN
      -----------------------------
      --------# YOUR  TURN #--------
              # Type   '1' #
              ---> Skip <---

              # Type    '2' #
              -> Take Card <-

              # Type     '3' #
              -> Show Cards <-

      ⬇⬇⬇ Eneter your answer ⬇⬇⬇
    TURN
    puts user_turn
    gets.chomp.to_i
  end

  def skip_turn(player)
    puts "#{player.name}, choose to skip a move\nMove skipped!"
  end

  def take_card(player)
    puts "#{player.name}, choose to get a card\nCard dealt!"
  end

  def open_cards(player)
    puts "#{player.name}, choose to open cards\nCards are open!"
  end

  def dealer_turn_info
    puts "# Now it's the Dealer's turn #\n "
  end

  def results_info(user, dealer)
    puts 'Your cards:'
    user.hand.card_front
    puts "Your current score points: #{user.hand.score_points}\n "
    puts 'Dealer cards:'
    dealer.hand.card_front
    puts "Dealer current score points: #{dealer.hand.score_points}\n "
  end

  def draw
    puts "### Its a draw, chips returned! ###\n "
  end

  def win(player)
    puts "### THE WINNER IS ---> #{player.name} <--- ###\nWinnings credited to the balance!"
    puts "#{player.name} current balance is: $#{player.balance}\n "
  end

  def condition_info(user)
    condition_menu = <<~CONDITION
      ----# Hey #{user.name} #----"
          ####################
              ⬇ Type '1' ⬇
          To Continue the Game

              ⬇ Type '0' ⬇
          To Exit the Game
          ####################
      ⬇ Enter your answer
    CONDITION
    puts condition_menu
  end
end
