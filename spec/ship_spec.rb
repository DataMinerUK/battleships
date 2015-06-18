require 'ship'

describe 'Ship' do
let (:ship){Ship.new 'C4', 2, :horizontal}

  context 'Creation' do

    it 'knows its starting position when its created' do
      expect(ship.starting_point).to eq 'C4'
    end

    it 'is in its position when created' do
      expect(ship.position).to_not eq ['C5']
    end

    it 'has a size' do
      expect(ship.size).to eq 2
    end

    it 'has an orientation' do
      expect(ship.orientation).to eq :horizontal
    end

    context 'larger ships vertical creation' do

      it 'occupies a number of positions when placed horizontally' do
        expect(ship.position).to eq ['C4', 'D4']
      end

      context 'larger ships horizontal creation' do
        let (:ship) {Ship.new 'C4', 3, :vertical}

        it 'occupies a number of positions when placed vertically' do
          expect(ship.position).to eq ['C4', 'C5', 'C6']
        end

        

      end

    end

  end

  context 'Status' do

    it 'is floating when created' do
      expect(ship.status).to eq :floating
    end

    it 'can be sunk' do
        ship.size.times {ship.hit}
        expect(ship.status).to eq :sunk
    end

    it 'can be hit and records the number of hits' do
      ship.hit
      expect(ship.hits).to eq 1
    end

  end


end
