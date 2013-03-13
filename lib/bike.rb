class Bike

  include DataMapper::Resource

  property :id,     Serial
  property :broken, Boolean, :default => false

  def initialize
    broken = false
  end

  def broken?
    broken
  end

  def break!
    broken = true
  end

  def fix!
    broken = false
  end
end