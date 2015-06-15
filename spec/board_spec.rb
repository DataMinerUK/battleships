require './lib/board'

describe Board do

  subject { Board.new dim}
  let( :dim ) { [1, 1] }
  let( :point ) { [0, 0] }
  let( :orientation ) { :horizontal }
  let( :ship) do
    double 'ship', size: 1
  end

  it 'has a dimension' do
    expect( subject.dimension).to eq dim
  end

  it 'creates a blank board filled with water' do
    expect(subject.blank).to eq({[0,0] => 'water'})

  end

  describe '#place' do

    it 'responds to place with 3 arguments' do
      expect( subject ).to respond_to( :place ).with( 3 ).arguments
    end

    it 'adds a ship to the board at the given coordinate' do
      subject.place ship, point, orientation
      expect(subject.playing_on[point]).to eq ship
    end

  end

  describe '#ship?' do
    it 'responds to ship?' do
      expect( subject).to respond_to :ship?
    end

    it 'checks wether there is not water at a given coordinate' do
      subject.place ship, point, orientation
      expect(subject.ship? point).to be true
    end
  end

end
