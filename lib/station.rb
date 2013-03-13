class Station < Location 

  include DataMapper::Resource
  
  def broken_bikes
    @bikes.select { |bike| bike if bike.broken? }
  end
end