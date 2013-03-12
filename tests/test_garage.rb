require './lib/location'
require './lib/bike'
require './lib/garage' # the class under test
require 'minitest/autorun' # the minitest itself
require 'ansi' # makes it colored
require 'turn' # improves the default output

class TestGarage < MiniTest::Unit::TestCase

def test_garage_cannot_exceed_max_capacity
    garage = Garage.new({:capacity => 5})
    assert_raises ( RuntimeError ) { 31.times do
                                       garage << Bike.new
                                     end
                                     }
  end
end