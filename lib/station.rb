class Station < Location

  def broken_bikes
    @bikes.select { |bike| bike if bike.broken? }
  end
end