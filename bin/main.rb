
require_relative '../lib/game.rb'

class Main
  def setPlayer1(game)
    print "\nSelect O or X for player 1: "
    symbol = gets.chomp
    symbol.capitalize!
    while !game.players.include?symbol
      print 'Please select O or X :'
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
      print "\n ***** player 1 Wins ***** \n"
    else board.winner == 2
      print "\n ***** Player 2 Wins ***** \n"
    
    end

    print "\n To play again enter 1:  "
    ans = gets.chomp
    if ans.to_i == 1
      return true
    else
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