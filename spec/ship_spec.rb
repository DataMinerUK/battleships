require './lib/ship'

describe Ship do
  let(:size) {1}
  subject {Ship.new size}

  it 'has a size' do
    expect(subject.size).to eq 1
  end

end
