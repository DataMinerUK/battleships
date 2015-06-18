require 'board'

describe Board do
let (:ship){double :ship, position: ["C4", "C5", "C6"], outside_board?: false}

  context 'upon creation' do

    it { is_expected.to respond_to :dimension }

    it 'in its default state (10x10), the bottom right coordinate is J9' do
      expect(subject.bottom_right).to eq "J9"
    end

    context 'when placing ships' do

      it 'should be able to place ships' do
        subject.place ship
        expect(subject).not_to be_empty
      end

      it 'should not allow ships to overlap' do
        subject.place ship
        expect{ subject.place ship }.to raise_error 'There is a ship already there!'
      end

      context 'when placing a ship outside the board' do

        let (:ship_not_on_board){double :ship, position: ["J8", "J9", "J10"]}

        it 'should know that ship is outside board' do
          expect(subject.outside_board? ship_not_on_board).to eq true
        end

        it 'should raise an error when placing ship outside board' do
          expect{subject.place ship_not_on_board}.to raise_error 'Ship is outside the board'
        end
      end

    end

  end

    context 'when shooting' do

      it 'hits a ship on location' do
        subject.place ship
        allow(ship).to receive(:hit)
        subject.strike "C4"
        expect(ship).to have_received(:hit)
      end

      it 'does not hit a ship' do
        subject.place ship
        allow(ship).to receive(:hit)
        subject.strike "D5"
        expect(ship).not_to have_received(:hit)
      end

      it { is_expected.to respond_to :all_ships_sunk? }

       context 'when testing sunken ships' do

         let (:ship){double :ship, position: ["C4"], status: :sunk, outside_board?: false}

        it 'can report that all ships are sunk' do
          subject.place ship
          expect(subject.all_ships_sunk?).to eq true
        end
      end

      context 'when testing floating ships' do

        let (:ship){double :ship, position: ["C4"], status: :floating, outside_board?: false}

        it 'can report that NOT all ships have been sunk' do
          subject.place ship
          expect(subject.all_ships_sunk?).to eq false
        end

      end


    end


end
