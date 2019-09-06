
require_relative '../lib/game.rb'

class Main
  def initialize
    @name_1
    @name_2
  end
  
  def setPlayer1(game)
    puts "\n================================="
    puts "* WELCOME TO THE TIC TAC TOE GAME *"
    puts "==================================="
    puts "\nName of player 1: "
    @name_1 = gets.chomp
    puts "\nSelect O or X for player 1: "
    symbol = gets.chomp
    symbol.capitalize!
    puts "\nName of player 2: "
    @name_2 = gets.chomp
    while !game.players.include?symbol
      puts 'Please select O or X :'
      symbol = gets.chomp
      symbol.capitalize!
    end
    player1 = Player.new(1, symbol)
    return player1
  end

  def setPlayer2(player1)
    if player1.symbol == "X"
      player2 = Player.new(2, 'O')
    else
      player2 = Player.new(2, 'X')
    end
    return player2;
  end

  def option(player, board, game)
    result = false
    print board.display_board
    print "\nPlayer #{player.value} options [1-9]: "
    move = gets.chomp
    while !game.options.include? move.to_i
      print "\nselect a number from 1 to 9: "
      move = gets.chomp
    end
    while !board.add_map(move.to_i, player.symbol.to_s)
      print "\nInvalid Option, select again: "
      move = gets.chomp
    end
    if player.value == 1
      board.winner = 1 if board.check_map(move.to_i, player.symbol.to_s)
    else
      board.winner = 2 if board.check_map(move.to_i, player.symbol.to_s)
    end
    result = true if board.winner != 0
    result = true if board.plays == 9
    print board.display_board if player == 1 && result
    return result
  end

  def endGame(game, board)
    print board.display_board
    if board.winner == 1
      print "\n *****#{@name_1} Wins ***** \n"
    else board.winner == 2
      print "\n *****#{@name_2} Wins ***** \n"
    
    end

    puts "\n Do you want to play again? (y/n) :  "
    ans = gets.chomp
    if ans == "y" || ans.to_i == "Y"
      return true
    elsif ans == "n" || ans.to_i == "N"
      puts "Adios amigo!"
      return false
    end
  end
end

main = Main.new
game = Game.new()
game.play_again = true

while game.play_again
  game.play_again = false
  player1 = main.setPlayer1(game)
  player2 = main.setPlayer2(player1)
  board = Board.new()
  while true
    break if main.option(player1, board, game)
    break if main.option(player2, board, game)
  end
  if main.endGame(game, board)
    game.play_again = true
    board.plays = 0
  end
end