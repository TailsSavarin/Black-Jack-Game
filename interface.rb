# frozen_string_literal: true

class Interface
  INTRODUCTION = "
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
░░░░░░░░░░▀▀▀█████▄░░░░░░░░░░░░░░░░░░░\n "
  START_QUESTION = "
######## Do you want to start the game? ########
------------------# yes/no #--------------------\n "
  START_GAME = "
------------------------------------------------
----------- # The New Game Started # -----------
------------------------------------------------\n "
  END_GAME = "
------------------------------------------------
----------------- # Good Bye # -----------------
------------------------------------------------\n "

  GAME_INFO = "
--------------------------- RULES -------------------------------------
- Dealer deals 2 cards to the players and two to himself;
- Blackjack card values: All cards count their face value in blackjack;
- Picture cards count as 10 and the ace can count as either 1 or 11;
- Card suits have no meaning in blackjack;
- The winner is the one, whose score will be 21;
- Or the one whose result will be closest to 21.\n "
  MAIN_MENU = "
-- Type '1' for start the game
-- Type '2' for watching game rules
-- Type '3' for see players current balance\n
------------ Enter your answer ------------"
  USER_TURN = "
-------- YOUR TURN --------
-- Type '1'
-- To skip\n
-- Type '2'
-- To take card\n
-- Type '3'
-- For show cards\n
--- Eneter your answer ---"

  def welcome_logo
    puts INTRODUCTION
  end

  def game_rules
    puts GAME_INFO
  end

  def main_menu_choice
    puts MAIN_MENU
    gets.chomp.to_i
  end

  def start_logo
    puts START_GAME
  end

  def end_logo
    puts END_GAME
  end

  def initialization
    print 'Enter your name here --> '
    gets.chomp.capitalize
  end

  def welcome_info(user)
    puts "Hey #{user.name}! Hope you enjoy this game!\nLet's start!"
  end

  def current_balance(user, dealer)
    puts "Your current balance: $#{user.balance}\n"
    puts "Dealer current balance: $#{dealer.balance}\n"
  end

  def deal_info
    puts 'Dealer deals two cards'
  end

  def bet_info(bet, user, dealer)
    puts "The size of the bet: $#{bet}\n"
    current_balance(user, dealer)
  end

  def cards_info(user, dealer)
    puts "Your cards:\n "
    user.hand.card_front
    puts "Your current score points: -#{user.hand.score_points}-\n "
    puts "Dealer cards:\n "
    dealer.hand.card_back
  end

  def user_turn_info
    puts USER_TURN
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
    puts "Your cards:\n "
    user.hand.card_front
    puts "Your current score points: #{user.hand.score_points}\n "
    puts "Dealer cards:\n "
    dealer.hand.card_front
    puts "Dealer current score points: #{dealer.hand.score_points}\n "
  end

  def draw
    puts "### Its a draw, chips returned! ###\n "
  end

  def win(player)
    puts "### THE WINNER IS ---> #{player.name} <--- ###\nWinnings credited to the balance!"
    puts "#{player.name} current balance is: $#{player.balance}"
  end

  def condition_info(user)
    puts "------- Hey #{user.name} -------"
    puts "-- Type '1' to continue the game"
    puts "-- Type '0' to exit"
  end
end
