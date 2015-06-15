require './lib/board'

describe Board do

  subject { Board.new point}
  let( :point ) { [1, 2] }
  let( :ship) do
    double 'ship', size: 1
  end

  it 'has a dimension' do
    expect( subject.dimension).to eq [1,2]
  end

  it 'responds to place with to arguments' do
    expect( subject ).to respond_to( :place ).with( 2 ).arguments
  end

end
