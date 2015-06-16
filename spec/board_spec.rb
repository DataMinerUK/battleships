require 'board'

describe Board do 
let (:ship){double :ship, position: "C4"}


it 'should be able to place ships' do
  subject.place ship
  expect(subject).not_to be_empty
end

  context 'when shooting'
  
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

    it 

    it 'can report that all ships are sunk' do
      expect(subject).to respond_to :all_ships_sunk
    end

  end


end