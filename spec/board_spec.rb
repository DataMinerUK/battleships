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
        subject.hit "C4"
        expect(ship).to have_received(:hit)
      end

      it 'does not hit a ship' do
        subject.place ship
        allow(ship).to receive(:hit)
        subject.hit "C5"
        expect(ship).not_to have_received(:hit)
      end

      it { is_expected.to respond_to :all_ships_sunk? }

      it 'can report that all ships are sunk' do
        allow(subject).to receive :hit
        subject.hit "C4"
        expect(subject.all_ships_sunk?).to eq true
      end

      # it 'can report that NOT all ships have been sunk' do
      #   allow(subject)
      # end


    end


end
