require_relative "../lib/game_logic"
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
  end
  
  describe "#start_game" do
    context "When a new game starts"
    it "tests if play_again is true" do
      expect(game.play_again).to eq(true)
    end
  end
  
  describe "#add_map" do
    context "when a symbol is added into a cell between 1 to 9"
    it "returns true" do
      result = game.add_map(9, "X")
      expect(result).to eq(true)
    end
    
    it "returns false when the player selects an option out of the range 1 to 9" do
      result = game.add_map(10, "O")
      expect(result).to eq(false)
    end
  end
  
  describe "#check_map" do
    context "when a player wins"
    it "will return true when a symbol matches 3 consecutives cells" do
      val = 1
      symbol = "X"
      win = false
      3.times do
        game.add_map(val, symbol)
        win = game.check_map(val, symbol)
        val += 1
      end
      expect(win).to eq(true)
    end
  end
  
  describe "#end_game" do
    it "returns true when there is a winner or when the game ends" do
      player = Player.new("John", 1, "X")
      game.winner = 1
      game.plays = 9
      result = game.end_game(game, player)
      expect(result).to eq(true)
    end
  end
  
  describe "#set_symbol" do
    it "will return if the winner is the player 1 or player 2" do
      symbol = "O"
      player = Player.new("John", 2, symbol)
      val = 1
      win = false
      move = 1
      3.times do
        game.add_map(val, symbol)
        win = game.check_map(val, symbol)
        val += 1
      end
      winner= game.set_symbol(player, game, move)
      expect(winner).to eq(2)
    end  
  end
end
