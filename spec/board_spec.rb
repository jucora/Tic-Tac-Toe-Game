require_relative "../lib/board"
RSpec.describe Board do
  let(:board){ Board.new }
  
  describe "Attributes" do
    it "allows writing for :map" do
      board.map = [1,2,3]
      expect(board.map).to eq([1,2,3])
    end
    it "allows reading for :map" do
      expect(board.map.length-1).to eq(9)
    end
  end
  
  describe "Instance Methods" do
    describe "#display_board" do
      context "Display the board when the game starts"
      it "displays the structure of the board" do
        string = board.display_board
        expect(string).to eq("\n 1 | 2 | 3 \n-----------\n 4 | 5 | 6 \n-----------\n 7 | 8 | 9 \n")
      end
      
    context "When a symbol is assigned to a cell"
      it "displays the updated board" do
        i = 0
        string = ""
        map = [1,2,3,"X",5,6,7,8,9]
        3.times do
          string += "\n #{map[i]} | #{map[i + 1]} | #{map[i + 2]} \n"
          string += '-----------' if i <= 6
          i += 3
        end
        expect(board.display_board == string).to be_falsey 
      end
    end
  end
end