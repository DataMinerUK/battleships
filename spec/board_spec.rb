require 'board'

describe Board do 
let (:ship){double :ship, position: "C4"}


it 'should be able to place ships' do
  subject.place ship
  expect(subject).not_to be_empty
end

  it 'knows when a ship has been hit' do
    subject.place ship
    expect(subject.hit("C4")).to eq 'HIT!'
  end

  it 'signals a miss' do
    subject.place ship
    expect(subject.hit("C5")).to eq 'MISS!'
  end

  it 'can report that all ships are sunk' do
    expect(subject).to respond_to :all_ships_sunk
  end




end