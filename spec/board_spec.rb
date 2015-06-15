require './lib/board'

describe Board do

  subject { Board.new point}
  let( :point ) { [0, 0] }
  let( :ship) do
    double 'ship', size: 1
  end

  it 'has a dimension' do
    expect( subject.dimension).to eq point
  end

  describe '#place' do

    it 'responds to place with to arguments' do
      expect( subject ).to respond_to( :place ).with( 2 ).arguments
    end

    it 'adds a ship to the board' do
      expect(subject.place ship, point).to eq ship
    end

  end

end
