class Location

  include DataMapper::Resource
  
  # property :id
  # property :capacity

  attr_reader :bikes

  DEFAULT_CAPACITY = 30

  def initialize(options = {})
    @capacity = options.fetch(:capacity, DEFAULT_CAPACITY)
    @bikes = []    
  end

  def empty?
    @bikes.empty?
  end

  def << bike
    raise "Location full" unless @bikes.length < @capacity
    @bikes << bike
  end

  def release_bike(bike)
    raise "No such bike" unless include?(bike)
    @bikes.delete bike
  end

  def include?(bike)
    @bikes.include? bike
  end

  def take_bike_from(location)
    bike = location.bikes.first
    released_bike = location.release_bike bike
    self << released_bike
  end
end