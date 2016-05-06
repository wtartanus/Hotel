require( "minitest/autorun" )
require( "minitest/rg" )
require( "pry-byebug" )
require_relative( "../room.rb" )

class TestRomm < MiniTest::Test

  def setup
    @single_room = Room.new("normal", "single", 70, "sea" )
    @double_single = Room.new("normal", "two single", 60, "normal" )
    @double = Room.new("king", "double", 200, "sea")
  end

  def test_create_room_type
    assert_equal("normal", @single_room.type)
    assert_equal("normal", @double_single.type)
    assert_equal("king", @double.type)
  end

  def test_create_room_number_beds
    assert_equal("single", @single_room.number_beds)
    assert_equal("two single", @double_single.number_beds)
    assert_equal("double", @double.number_beds)
  end

  def test_create_room_price
    assert_equal( 70, @single_room.price)
    assert_equal( 60, @double_single.price)
    assert_equal( 200, @double.price)
  end

  def test_create_room_view
    assert_equal( "sea", @single_room.view)
    assert_equal( "normal", @double_single.view)
    assert_equal( "sea", @double.view )
  end

  def test_room_clean_status
    assert_equal( "clean", @single_room.clean_status)
    assert_equal( "clean", @double_single.clean_status)
    assert_equal( "clean", @double.clean_status )
  end

  def test_room_guest_in
    assert_equal( "", @single_room.guest_in)
    assert_equal( "", @double_single.guest_in)
    assert_equal( "", @double.guest_in)
  end

  def test_room_booking_status
    assert_equal( false, @single_room.booking_status[:status])
    assert_equal( "", @double_single.booking_status[:guest_name])
    assert_equal( false, @double.booking_status[:status])
  end






end