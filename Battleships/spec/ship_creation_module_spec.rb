describe Module do

  context 'initializing various ship types' do

    it 'creates an aircraft carrier' do
      aircraft_carrier = Ship.aircraft_carrier('C4', :vertical)
      expect(aircraft_carrier.size).to eq 5
    end

    it 'creates an battleship' do
      aircraft_carrier = Ship.battleship('C4', :vertical)
      expect(aircraft_carrier.size).to eq 4
    end

    it 'creates an submarine' do
      aircraft_carrier = Ship.submarine('C4', :vertical)
      expect(aircraft_carrier.size).to eq 3
    end

    it 'creates a destroyer' do
      aircraft_carrier = Ship.destroyer('C4', :vertical)
      expect(aircraft_carrier.size).to eq 3
    end

    it 'creates an boat' do
      aircraft_carrier = Ship.boat('C4', :vertical)
      expect(aircraft_carrier.size).to eq 2
    end
  end
end
