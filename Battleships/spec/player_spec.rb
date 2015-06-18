require 'player'

describe Player do

  subject { Player.new(double :board, all_ships_sunk?: true, place: :ship) }

  it { is_expected.to respond_to :lost? }

  it 'can lose and is notified' do
    expect(subject.lost?).to eq true
  end

  it 'can place ships' do
    expect(subject.place :ship).to eq :ship

  end

  context 'playing on a board with a ship at C4' do

    ## when testing the player, TEST THE PLAYER = stubbing the board with
    ## 'strike' is not a problem here, and you have to do it
    ## because receive_strike is calling the method "strike" on the board
    
    LOCATION = "C4"
    subject { Player.new(double :board, strike: 'HIT!') }

    it 'can tell us when a ship is hit' do
      expect(subject.receive_strike LOCATION).to eq 'HIT!'
    end

    it 'raises an error when hitting the same place twice' do
      subject.receive_strike LOCATION
      expect {subject.receive_strike LOCATION}.to raise_error "You have already shot here"
    end

    context 'when player hits a ship' do

      it 'can report hit positions' do
        subject.receive_strike LOCATION
        expect(subject.hits).to eq [LOCATION]
      end

    end

    context 'when player misses a ship' do

      let(:board) { double :board, strike: 'MISS!'}
      subject { Player.new(board) }

      it 'can report miss positions' do
        subject.receive_strike "C5"
        expect(subject.misses).to eq ["C5"]
      end

      it 'raises an error when missing the same place twice' do
        subject.receive_strike LOCATION
        expect{subject.receive_strike LOCATION}.to raise_error "You have already shot here"
      end

    end
    
  end

end
