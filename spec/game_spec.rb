require "../../lib/game_logic"
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