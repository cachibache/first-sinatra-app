
class Person

  include DataMapper::Resource

  # property :id
  # property :bike

  def initialize
    @bike = nil
  end

  def has_bike?
    @bike
  end

  def << bike
    @bike = bike
  end

  def release_bike(bike)
    raise "No such bike" unless has_bike?
    @bike = nil
  end

  def take_bike_from(station)
    bike = station.bikes.first
    released_bike = station.release_bike bike
    self << released_bike
  end
end
