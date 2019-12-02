require 'test/unit'
require './lib/fuel_counter'

class FuelCounterTest < Test::Unit::TestCase
  def test_fuel_calculate
    assert_equal(2, check_calculate(12))
    assert_equal(2, check_calculate(14))
    assert_equal(966, check_calculate(1969))
    assert_equal(50346, check_calculate(100756))
  end

  def test_total
    assert_equal(51316, check_total([12, 14, 1969, 100756]))
  end

  private

  def check_calculate(mass)
    FuelCounter.new([]).fuel_calculate(mass)
  end

  def check_total(array)
    FuelCounter.new(array).fuel_total
  end
end