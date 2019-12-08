require 'test/unit'
require './lib/orbit_map'

class OrbitMapTest < Test::Unit::TestCase
  def test_count
    test_array = ['COM)B', 'B)C', 'C)D', 'D)E', 'E)F', 'B)G', 'G)H', 'D)I', 'E)J', 'J)K', 'K)L']
    assert_equal(42, check_count(test_array))
  end

  private

  def check_count(array)
    OrbitMap.new(array).count
  end
end