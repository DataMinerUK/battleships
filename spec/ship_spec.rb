require 'ship'

describe 'Ship' do
let (:ship){Ship.new 'C4', 1, :vertical}

  context 'Ship Creation' do

    it 'knows its position when its created' do
      expect(ship.position).to eq 'C4'
    end

    it 'is in its position when created' do
      expect(ship.position).to_not eq 'C5'
    end

    it 'has a size' do
      expect(ship.size).to eq 1
    end

    it 'has an orientation' do
      expect(ship.orientation).to eq :vertical
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

    it 'can be hit and records the number of hits' do
      ship.hit
      expect(ship.hits).to eq 1
    end

  end


end