require 'ship'

describe 'Ship' do
let (:ship){Ship.new 'C4', 2, :vertical}

  context 'Creation' do

    it 'knows its position when its created' do
      expect(ship.position).to eq 'C4'
    end

    it 'is in its position when created' do
      expect(ship.position).to_not eq 'C5'
    end

    it 'has a size' do
      expect(ship.size).to eq 2
    end

    it 'has an orientation' do
      expect(ship.orientation).to eq :vertical
    end

  end

  context 'Status' do

    it 'is floating when created' do
      expect(ship.status).to eq :floating
    end

    it 'can be sunk' do
        ship.hit
        ship.hit
        expect(ship.status).to eq :sunk
    end

    it 'can be hit and records the number of hits' do
      ship.hit
      expect(ship.hits).to eq 1
    end

  end


end
