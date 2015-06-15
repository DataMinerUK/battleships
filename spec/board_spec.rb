require './lib/board'

describe Board do

  let( :point ) { [1, 2] }
  subject { Board.new point}

  it 'has a dimension' do
    expect( subject.dimension).to eq [1,2]
  end

end
