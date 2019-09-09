require_relative 'game_logic.rb'
class Board
attr_accessor :map
  def initialize
    @map = []    
    i = 1
    9.times do
      @map[i] = i
      i += 1
    end
  end
  
  def display_board
    i = 1
    string = ''
    3.times do
      string += "\n #{@map[i]} | #{@map[i + 1]} | #{@map[i + 2]} \n"
      string += '-----------' if i <= 6
      i += 3
    end
    string
  end
  
end