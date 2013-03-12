require './lib/bike' # the class under test
require 'minitest/autorun' # the minitest itself
require 'ansi' # makes it colored
require 'turn' # improves the default output

class TestBike < MiniTest::Unit::TestCase

  def setup
    @bike = Bike.new
  end

  def test_bike_is_not_broken_by_default
    refute @bike.broken?
  end

  def test_bike_can_be_broken
    refute @bike.broken?
    @bike.break!
    assert @bike.broken?
  end

  def test_bike_can_be_fixed
    refute @bike.broken?
    @bike.break!
    assert @bike.broken?
    @bike.fix!
    refute @bike.broken?
  end
end
