require_relative 'player.rb'
require_relative 'board.rb'


class Game
  attr_accessor :play_again, :winner, :plays, :board
  attr_reader :options, :players
  
  def initialize
    @plays = 0
    @wins1 = { 1 => [1, 2, 3], 2 => [4, 5, 6], 3 => [7, 8, 9], 4 => [1, 4, 7] }
    @wins2 = { 5 => [2, 5, 8], 6 => [3, 6, 9], 7 => [1, 5, 9], 8 => [3, 5, 7] }
    @wins = [@wins1, @wins2]
    @winner = 0
    @play_again = true
    @options = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    @players = %w[X O]
    @board = Board.new
  end
  
  def start_game
    while self.play_again do
      main = Main.new
      self.play_again = false
      player1 = main.setPlayer1(self)
      player2 = main.setPlayer2(player1)
      game = Game.new()
      while true
        break if main.option(player1, self, @board)
        break if main.option(player2, self, @board)
      end
      if main.endGame(self, @board)
        self.play_again = true
        game.plays = 0
      end
    end
  end
  
  def add_map(val, symbol)
    result = false
    i = 1
    9.times do
      if @board.map[i] == val
        @board.map[i] = symbol
        @plays += 1
        result = true
      end
      i += 1
    end
    result
  end

  def check_map(_val, symbol)
    win = true
    @wins.each do |element|
      element.each do |_key, value|
        win = true
        value.each do |i|
          win = false unless @board.map[i] == symbol
        end
        break if win
      end
      break if win
    end
    win
  end
  
  def end_game(game, player)
    result = true if game.winner != 0
    result = true if game.plays == 9
    @board.display_board if player == 1 && result
    return result
  end
  
  def set_symbol(player, game, move)
    if player.value == 1
      game.winner = 1 if game.check_map(move.to_i, player.symbol.to_s)
    else
      game.winner = 2 if game.check_map(move.to_i, player.symbol.to_s)
    end
  end
end