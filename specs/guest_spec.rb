require( "minitest/autorun" )
require( "minitest/rg" )
require( "pry-byebug" )
require_relative( "../guest.rb" )

class TestGuest < MiniTest::Test

  def setup
    @guest1 = Guest.new("Wojtek", 1000)
    @guest2 = Guest.new("Basia", 1500)
  end

  def test_create_guest_name
    assert_equal("Wojtek", @guest1.name )
    assert_equal("Basia", @guest2.name)
  end

  def test_create_guest_money
    assert_equal(1000, @guest1.money)
    assert_equal(1500, @guest2.money)
  end

  def test_loose_money
    test1 = @guest1.loose_money( 50 )
    test2 = @guest2.loose_money( 50 )
    assert_equal(950, test1 )
    assert_equal(1450, test2)
  end
  
end