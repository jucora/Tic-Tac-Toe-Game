require_relative 'player.rb'
require_relative 'board.rb'


class Game
  attr_accessor :play_again, :winner, :plays
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
  end
  
  def start_game
    while self.play_again do
      main = Main.new
      self.play_again = false
      player1 = main.setPlayer1(self)
      player2 = main.setPlayer2(player1)
      game = Game.new()
      while true
        break if main.option(player1, self)
        break if main.option(player2, self)
      end
      if main.endGame(self)
        self.play_again = true
        game.plays = 0
      end
    end
  end
  
  def add_map(val, symbol)
    result = false
    i = 1
    9.times do
      if $map[i] == val
        $map[i] = symbol
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
          win = false unless $map[i] == symbol
        end
        break if win
      end
      break if win
    end
    win
  end
end