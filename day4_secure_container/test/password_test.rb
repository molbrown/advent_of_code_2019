require 'test/unit'
require './lib/password'

class PasswordTest < Test::Unit::TestCase
  def test_find
    assert(check_find.include?('111111'))
    assert(check_find.none? { |n| '223450' == n } )
    assert(check_find.none? { |n| '123789' == n } )
  end

  private

  def check_find
    Password.new(100000, 250000).find
  end
end