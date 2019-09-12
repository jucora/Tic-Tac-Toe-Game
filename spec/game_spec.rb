require_relative "../lib/game_logic"
include game_logic

RSpec.describe game_logic do
  context "checks if game is able to create files" do
    it "ensures method creates a file" do
      result = game_logic.create_or_append_file("test")
      expect(result).to eq true
    end

    it "ensures method read a file" do
      result = GameEngine.open_file
      expect(result).to eq "test\n"
    end
  end
end