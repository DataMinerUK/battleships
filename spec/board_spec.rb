require './lib/board'

describe Board do

  subject { Board.new dim}
  let( :dim ) { [1, 1] }
  let( :point ) { [0, 0] }
  let( :ship) do
    double 'ship', size: 1
  end

  it 'has a dimension' do
    expect( subject.dimension).to eq dim
  end

  it 'creates a blank board filled with water' do
    expect(subject.playing_on).to eq({[0,0] => :water})

  end

  describe '#place' do

    subject { Board.new dim}
    let( :dim ) { [5, 5] }
    let( :orientation ) { 'horizontal' }
    let( :ship) do
      double 'ship', size: 3
    end
    before(:each) do
      subject.place ship, point, orientation
    end

    it 'responds to place with 3 arguments' do
      expect( subject ).to respond_to( :place ).with( 3 ).arguments
    end

    it 'adds a ship to the board at the given coordinate' do
      # p subject.playing_on
      expect(subject.playing_on[[0,0]]).to eq ship
      expect(subject.playing_on[[0,1]]).to eq ship
      expect(subject.playing_on[[0,2]]).to eq ship
      # expect(subject.playing_on[[point[0],point[1]+1]]).to eq ship
      # expect(subject.playing_on[[point[0],point[1]+2]]).to eq ship

    end

    describe '#where_ship' do
      it 'gives the coordinates of a ship' do
        expect(subject.where_ship ship).to eq [[0,0],[0,1],[0,2]]
      end
    end

  end


  describe '#ship_at?' do
    it 'responds to ship?' do
      expect( subject).to respond_to :ship_at?
    end

    xit 'checks wether there is not water at a given coordinate' do
      subject.place ship, point
      expect(subject.ship_at? point).to be true
    end
  end

end
