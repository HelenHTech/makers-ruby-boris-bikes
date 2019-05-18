class DockingStation
  attr_reader :docked_bikes, :capacity
  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @docked_bikes = []
  end

  def release_bike
    raise "No bikes" if empty?
    return @docked_bikes.pop if @broken_bike
  end

  # it 'Docking stations to not release broken bikes' do
  #   bike.not_working?
  #   docking_station.dock_bike(bike)
  #   docking_station.release_bike
  #   expect(docking_station.docked_bikes.length).to eq(1)

  def dock_bike(bike)
    raise "Dock contains bike" if full?
    @docked_bikes << bike
  end

  private
  def full?
    @docked_bikes.length >= DEFAULT_CAPACITY 
  end
  
  def empty?
    @docked_bikes.empty?
  end
end

class Bike
  attr_accessor :broken_bike

  def initialize
    @broken_bike = false
  end

  def not_working?
    !@broken_bike
  end
end