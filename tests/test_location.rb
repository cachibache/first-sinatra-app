require './lib/location'
require './lib/bike'
require './lib/station'
require './lib/van'
require './lib/garage' # the class under test
require 'minitest/autorun' # the minitest itself
require 'ansi' # makes it colored
require 'turn' # improves the default output

class TestLocation < MiniTest::Unit::TestCase

  def setup
    @location = Location.new
  end

  def test_location_empty?
    assert @location.empty?
  end

  def test_location_can_receive_a_bike
    assert @location.empty?
    @location << Bike.new
    refute @location.empty?
  end

  def test_location_can_release_a_bike
    10.times { @location << Bike.new }
    refute @location.empty?
    bike = @location.bikes[3]
    released_bike = @location.release_bike bike
    assert_equal released_bike, bike
    assert_equal 9, @location.bikes.count
  end

  def test_location_cannot_release_a_bike_it_does_not_have
    10.times { @location << Bike.new }
    refute @location.empty?
    bike = Bike.new
    assert_raises( RuntimeError ) { @location.release_bike bike }
  end

  def test_location_can_release_specific_bike
    assert @location.empty?
    bike1, bike2, bike3 = Bike.new, Bike.new, Bike.new
    @location << bike1
    @location << bike2
    @location << bike3
    refute @location.empty?
    @location.release_bike bike2
    refute @location.include? bike2
  end
end
