require 'player'

describe Player do

  subject { Player.new(double :board, all_ships_sunk?: true, place: :ship) }

  it { is_expected.to respond_to :lost? }

  it 'can lose and is notified' do
    expect(subject.lost?).to eq true
  end

  it 'calls on the board to place ships' do
    board2 = double :board
    expect(board2).to receive(:place)
    Player.new(board2).place :ship

  end

  context 'playing on a board with a ship at C4' do

    ## when testing the player, TEST THE PLAYER = stubbing the board with
    ## 'strike' is not a problem here, and you have to do it
    ## because receive_strike is calling the method "strike" on the board

    LOCATION = "C4"
    subject { Player.new(double :board, strike: 'HIT!', all_ships_sunk?: false) }

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

      let(:board) { double :board, strike: 'MISS!', all_ships_sunk?: false}
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

    context 'has all the ships on the board sunk'do

      let(:board) { double :board, strike: 'HIT!', all_ships_sunk?: true}
      subject { Player.new(board) }

      it 'announes "GAME OVER!"' do
        expect(subject.receive_strike LOCATION).to eq 'GAME OVER!'
      end

    end
  end

end
