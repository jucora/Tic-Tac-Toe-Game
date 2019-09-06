require_relative '../lib/game_logic.rb'
require_relative '../lib/board.rb'

class Main
  def initialize
    @name_1
    @name_2
    @again = false
    @print_board = Board.new
    @game = Game.new
  end
  
  def setPlayer1(game)
    puts "\n================================="
    puts "* WELCOME TO THE TIC TAC TOE GAME *"
    puts "==================================="
    puts "\nName of player 1: "
    @name_1 = gets.chomp
    puts "\nName of player 2: "
    @name_2 = gets.chomp
    puts "\nSelect O or X for player 1: "
    symbol = gets.chomp
    symbol.capitalize!
    while !game.players.include?symbol
      puts 'Please select O or X :'
      symbol = gets.chomp
      symbol.capitalize!
    end
    player1 = Player.new(@name_1, 1, symbol)
    return player1
  end

  def setPlayer2(player1)
    if player1.symbol == "X"
      player2 = Player.new(@name_2, 2, 'O')
    else
      player2 = Player.new(@name_2, 2, 'X')
    end
    return player2;
  end

  def option(player, game)
    result = false
    puts @print_board.display_board
    puts "\n#{player.name} is playing!"
    puts "Please select one cell between 1 to 9: "
    move = gets.chomp
    while !game.options.include? move.to_i
      print "\nselect a number from 1 to 9: "
      move = gets.chomp
    end
    while !game.add_map(move.to_i, player.symbol.to_s)
      print "\nInvalid Option, select again: "
      move = gets.chomp
    end
    @game.validate_move player, game, move
    result = @game.end_game(game, player)
    return result
  end

  def endGame(game)
    
    if game.winner == 1
      puts @print_board.display_board
      print "\n ***** #{@name_1.capitalize} Wins ***** \n"
    elsif game.winner == 2
      puts @print_board.display_board
      print "\n ***** #{@name_2.capitalize} Wins ***** \n"
    else
      puts @print_board.display_board
      puts "GAME OVER... No winners this time!"
    end
    
    while @again == false do
      puts "\n Do you want to play again? (y/n) :  "
      ans = gets.chomp
      if ans == "y" || ans == "Y"
        game = Game.new
        game.start_game
      elsif ans == "n" || ans == "N"
        puts "\n\n\nADIOS AMIGO!!"
        puts "*******************************************"
        puts "Authors: Asha Abdullahi and Julian Belmonte"
        puts "*******************************************"
        exit
      else
        puts "Invalid option, please try again!"
        false
      end
    end
  end
end

game = Game.new
game.start_game
