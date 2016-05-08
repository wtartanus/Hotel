require( "minitest/autorun" )
require( "minitest/rg" )
require( "pry-byebug" )
require_relative( "../room.rb" )

class TestRomm < MiniTest::Test

  def setup
    @single_room = Room.new( 1, "single", 70, "sea" )
    @double_single = Room.new( 2, "two single", 60, "normal" )
    @double = Room.new( 3, "double", 200, "sea")
  end

  def test_create_room_number
    assert_equal( 1, @single_room.room_number)
    assert_equal( 2, @double_single.room_number)
    assert_equal( 3, @double.room_number)
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
    assert_equal( "clean", @single_room.clean_status[0])
    assert_equal( "clean", @double_single.clean_status[0])
    assert_equal( "clean", @double.clean_status[0] )
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

  def test_change_clean_status
    @single_room.change_clean_status
    @double_single.change_clean_status
    @double.change_clean_status
    assert_equal("dirty", @single_room.clean_status[0])
    assert_equal("dirty", @double_single.clean_status[0])
    assert_equal("dirty", @double.clean_status[0])
  end

  def test_change_room_service_add_price
    @single_room.room_service_add_price( 10 )
    assert_equal( 80, @single_room.price)
  end

  def test_book_room
    @single_room.book_room( "Wojtek Tartanus" )
    @double_single.book_room( "Basia Nagy" )
    @double.book_room( "Piotr Siemczuk" )
    assert_equal( true, @single_room.booking_status[:status])
    assert_equal( "Basia Nagy", @double_single.booking_status[:guest_name])
    assert_equal( true, @double.booking_status[:status])
  end

  def test_outbook_room
    @single_room.book_room( "Wojtek Tartanus" )
    @double_single.book_room( "Basia Nagy" )
    @double.book_room( "Piotr Siemczuk" )

    @single_room.outbook_room
    @double_single.outbook_room
    @double.outbook_room
    assert_equal( false, @single_room.booking_status[:status])
    assert_equal( "", @double_single.booking_status[:guest_name])
    assert_equal( false, @double.booking_status[:status])
  end






end