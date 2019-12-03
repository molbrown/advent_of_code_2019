require 'test/unit'
require './lib/intcode_computer'

class IntcodeComputerTest < Test::Unit::TestCase
  def test_compute
    assert_equal([2,0,0,0,99], check_compute([1,0,0,0,99]))
    assert_equal([2,3,0,6,99], check_compute([2,3,0,3,99]))
    assert_equal([2,4,4,5,99,9801], check_compute([2,4,4,5,99,0]))
    assert_equal([30,1,1,4,2,5,6,0,99], check_compute([1,1,1,4,99,5,6,0,99]))
  end

  private

  def check_compute(input)
    IntcodeComputer.new(input).compute(0, input)
  end
end