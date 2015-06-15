require 'ship'

describe 'Ship' do

  context 'Ship Creation' do

    it 'knows its position when its created' do
      ship = Ship.new 'C4'
      expect(ship.position).to eq 'C4'
    end

    it 'is definitely IN its position when created' do
      ship = Ship.new 'C4'
      expect(ship.position).to_not eq 'C5'
    end
  end
  
  context 'ship status' do

    it 'is floating when created' do
      ship = Ship.new 'C4'
      expect(ship.status).to eq :floating
    end 

    xit 'is not floating when hit' do
        ship = Ship.new 'C4'
        ship.hit "C4"
        expect(ship.status).to eq :sunk
    end

  end


end