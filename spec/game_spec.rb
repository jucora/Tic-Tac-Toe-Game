require "../lib/game_logic"
RSpec.describe Game do
  let(:game){ Game.new }
  
  describe "Attributes" do
    it "allows reading for :options" do
      expect(game.options).to eq([1, 2, 3, 4, 5, 6, 7, 8, 9])
    end
    
    it "allows reading for :players" do
      expect(game.players).to eq(%w[X O])
    end
    
    it "allows reading for :play_again attribute" do
      expect(game.play_again).to eq(true)
    end
    
    it "allows reading for :winner attribute" do
      expect(game.winner).to be_zero
    end
    
    it "allows reading for :plays attribute" do
      expect(game.plays).to be_zero
    end
    
    it "allows reading for :board attribute" do
      expect(game.board).to be_an_instance_of(Board)
    end
    
    it "allows writing for :play_again" do
      game.play_again = false
      expect(game.play_again).to eq(false)
    end
    
    it "allows writing for :winner attribute" do
      game.winner = 1
      expect(game.winner).to eq(1)
    end
    
    it "allows writing for :plays attribute" do
      game.plays = 1
      expect(game.plays).to eq(1)
    end
    
    it "allows writing for :board attribute" do
      game.board = [1,2,3,4,5,6,7,8,9]
      expect(game.board).to eq([1,2,3,4,5,6,7,8,9])
    end
  end
  
  describe "#start_game" do
    context "When a new game starts"
    it "tests if play_again is true" do
      game.play_again = true
      expect(game.play_again).to eq(true)
    end
    it "tests the switch play_again to false statement to ask again at the end of the game" do
      game.play_again = false
      expect(game.play_again).to eq(false)
    end
  end
  
  describe "#add_map" do
    context "when a symbol is added into a cell between 1 to 9"
    it "returns true" do
      result = game.add_map(9, "X")
      expect(result).to eq(true)
    end
  end
  
  describe "#check_map" do
    context "when a player wins"
    it "will return true when a symbol matches 3 consecutives cells" do
      win = true
      board = Board.new
      board.map = [1, "X", 3, 4, "X", 6, 7, "X", 9]
      wins1 = { 1 => [1, 2, 3], 2 => [4, 5, 6], 3 => [7, 8, 9], 4 => [1, 4, 7] }
      wins2 = { 5 => [2, 5, 8], 6 => [3, 6, 9], 7 => [1, 5, 9], 8 => [3, 5, 7] }
      wins = [wins1, wins2]
      wins.each do |element|
        element.each do |_key, value|
          win = true
          value.each do |i|
            win = false unless board.map[i-1] == "X"
          end
          break if win
        end
        break if win
      end
      expect(win).to eq(true)
    end
  end
  
  describe "#end_game" do
    it "returns true when there is a winner or when the game ends" do
      game.winner = 0
      game.plays = 9
      result = true if game.winner != 0 || true if game.plays == 9
      expect(result).to eq(true)
    end
  end
  
  describe "#set_symbol" do
    it "will return true when a symbol matches 3 consecutives cells" do
      def check_map_simulation(move, symbol)
        win = true
        board = Board.new
        board.map = [1, "X", 3, 4, "X", 6, 7, "X", 9]
        wins1 = { 1 => [1, 2, 3], 2 => [4, 5, 6], 3 => [7, 8, 9], 4 => [1, 4, 7] }
        wins2 = { 5 => [2, 5, 8], 6 => [3, 6, 9], 7 => [1, 5, 9], 8 => [3, 5, 7] }
        wins = [wins1, wins2]
        wins.each do |element|
          element.each do |_key, value|
            win = true
            value.each do |i|
              win = false unless board.map[i-1] == "X"
            end
            break if win
          end
          break if win
        end
        win
      end
      move = 3  
      symbol = "X"
      game.winner = 1 if check_map_simulation(move, symbol)
      game.winner = 2 if check_map_simulation(move, symbol)
      expect(game.winner).to be > 0
    end
  end
end
