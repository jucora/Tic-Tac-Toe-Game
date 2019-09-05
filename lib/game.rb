
require_relative 'player.rb'
require_relative 'board.rb'

class Game
  attr_accessor :play_again
  attr_reader :options, :players

  def initialize
    @play_again = true
    @options = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    @players = %w[X O]
  end
end