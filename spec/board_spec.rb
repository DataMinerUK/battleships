require 'board'

describe Board do
let (:ship){double :ship, position: "C4"}


  it 'should be able to place ships' do
    subject.place ship
    expect(subject).not_to be_empty
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
        subject.strike "C5"
        expect(ship).not_to have_received(:hit)
      end

      it { is_expected.to respond_to :all_ships_sunk? }

       context 'when testing sunk ships' do

         let (:ship){double :ship, position: "C4", status: :sunk}

        it 'can report that all ships are sunk' do
          subject.place ship
          expect(subject.all_ships_sunk?).to eq true
        end
      end

      context 'when testing floating ships' do

        let (:ship){double :ship, position: "C4", status: :floating}

        it 'can report that NOT all ships have been sunk' do
          subject.place ship
          expect(subject.all_ships_sunk?).to eq false
        end

      end


    end


end
