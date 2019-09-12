require_relative '../lib/player'

julian = Player.new('julian')

RSpec.describe Player do
  context 'check player objects can receive name, icon and bet_amount'do

    it 'ensures object can receive a name' do
        julian.name = 'fish'
      expect(julian.name).to eq 'fish'
    end

    it 'ensures object can receive a icon' do
        julian.icon = 'X'
        expect(jullian.icon).to eq 'X'
    end



  end


end
