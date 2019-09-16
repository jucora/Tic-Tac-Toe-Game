require_relative '../lib/player'

RSpec.describe Player do
  let(:player){Player.new('fish', 1, "X")}
  
  describe 'Attributes :name, :icon and :symbol are readable'do
    it 'can read :name attribute' do
      expect(player.name).to eq ('fish')
    end
    
    it 'can read :value attribute' do
        expect(player.value).to eq(1)
    end

    it 'can read :symbol attribute' do
        expect(player.symbol).to eq('X')
    end
  end
end
