require 'ship'

describe 'Ship' do
let (:ship){Ship.new 'C4'}

  context 'Ship Creation' do

    it 'knows its position when its created' do
      expect(ship.position).to eq 'C4'
    end

    it 'is in its position when created' do
      expect(ship.position).to_not eq 'C5'
    end
  end
  
  context 'Ship Status' do

    it 'is floating when created' do
      expect(ship.status).to eq :floating
    end 

    it 'is not floating when hit' do
        ship.hit 
        expect(ship.status).to eq :sunk
    end

  end


end