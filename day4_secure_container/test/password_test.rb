require 'test/unit'
require './lib/password'

class PasswordTest < Test::Unit::TestCase
  def test_find
    assert(check_find.include?('112233'))
    assert(check_find.none? { |n| '123444' == n } )
    assert(check_find.include?('111122'))
  end

  private

  def check_find
    Password.new(100000, 250000).find
  end
end