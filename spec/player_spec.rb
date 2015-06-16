require 'player'
require 'board'


describe Player do

  subject { Player.new(double :board, all_ships_sunk?: true) }

  it { is_expected.to respond_to :lost? }

  it 'can lose and is notified' do
    expect(subject.lost?).to eq true
  end


  context 'playing on a board with a ship at C4' do
    let(:ship) {double :ship, position: 'C4', status: :floating}
    let(:board) {[:ship]}
    subject { Player.new(:board) }

    it 'can tell us when a ship is hit' do
      expect(subject.receive_strike 'C4').to eq 'HIT!'
    end

  end

  # it 'can place ships' do
  #   subject.place ship

  # end

end
