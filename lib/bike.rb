class Bike

  include DataMapper::Resource

  property :id,     Serial
  property :broken, Boolean, :default => false

  def initialize
    self.broken = false
  end

  def broken?
    self.broken
  end

  def break!
    self.broken = true
  end

  def fix!
    self.broken = false
  end
end