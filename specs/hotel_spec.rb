require( "minitest/autorun" )
require( "minitest/rg" )
require( "pry-byebug" )
require_relative( "../hotel.rb" )
require_relative( "../room.rb" )
require_relative( "../guest.rb" )
require_relative( "../restaurant.rb" )

class TestHotel < MiniTest::Test

  def setup

    @guest1 = Guest.new("Wojtek", 1000)
    @guest2 = Guest.new("Basia", 1500)

    single_room = Room.new("normal", "single", 70, "sea" )
    double_single = Room.new("normal", "two single", 60, "normal" )
    double = Room.new("king", "double", 200, "sea")
    
    rooms = [ single_room, double_single, double ]

    @hotel = Hotel.new("Jurys", 10000, rooms)

  end

  def test_hotel_create_name
    assert_equal("Jurys", @hotel.name)
  end

  def test_hotel_create_bank
    assert_equal(10000, @hotel.bank)
  end

  # def test_hotel_create_rooms
  #   binding.pry
  #   @hotel.rooms
  #   pretty long array
  # end
  
  def test_room_is_empty?
    test = @hotel.is_empty?( "double" )
    assert_equal( true, test )
  end

  def test_add_money
    @hotel.add_money( @hotel.booking_fee )
    assert_equal(10050, @hotel.bank )
  end

  def test_book_room_name
    @hotel.book_room( @guest1, "single" )
    assert_equal("Wojtek", @hotel.rooms[0].booking_status[:guest_name])
  end

  def test_book_room_status
    @hotel.book_room( @guest1, "single" )
    assert_equal(true, @hotel.rooms[0].booking_status[:status])
  end

  def test_booking_guest_loose_money
    @hotel.booking( @guest1, "double" )
    assert_equal(950, @guest1.money)
  end

  def test_booking_hotel_add_money
    @hotel.booking( @guest1, "single" )
    assert_equal(10050, @hotel.bank)
  end

  def test_booking_hotel_room_status
    @hotel.booking( @guest1, "single" )
    assert_equal("Wojtek", @hotel.rooms[0].booking_status[:guest_name])
  end

  def test_booking_hotel_room_status
    @hotel.booking( @guest1, "single" )
    assert_equal( true, @hotel.rooms[0].booking_status[:status])
  end

  def test_hotel_check_in_guest_in
    @hotel.booking( @guest1, "single" )
    @hotel.check_in( @guest1 )
    assert_equal("Wojtek", @hotel.rooms[0].guest_in )
  end

  def test_hotel_check_in_booking_status
    @hotel.booking( @guest1, "single" )
    @hotel.check_in( @guest1 )
    assert_equal( false, @hotel.rooms[0].booking_status[:status] )
  end

  def test_hotel_check_in_booking_status_name
    @hotel.booking( @guest1, "single" )
    @hotel.check_in( @guest1 )
    assert_equal( "", @hotel.rooms[0].booking_status[:guest_name] )
  end

  def test_hotel_check_out_guest_in
    @hotel.booking( @guest1, "single" )
    @hotel.check_in( @guest1 )

    @hotel.check_out( @guest1 )
    assert_equal( "", @hotel.rooms[0].guest_in )
  end

  def test_hotel_check_out_guest_loose_money
    @hotel.booking( @guest1, "single" )
    @hotel.check_in( @guest1 )

    @hotel.check_out( @guest1 )
    assert_equal( 930, @guest1.money )
  end

  def test_hotel_check_out_hotel_add_money
    @hotel.booking( @guest1, "single" )
    @hotel.check_in( @guest1 )

    @hotel.check_out( @guest1 )
    assert_equal( 10070, @hotel.bank )
  end

  def test_hotel_check_out_change_clean_status
    @hotel.booking( @guest1, "single" )
    @hotel.check_in( @guest1 )

    @hotel.check_out( @guest1 )
    assert_equal( "dirty", @hotel.rooms[0].clean_status[0] )
  end

  def test_room_service
    @hotel.booking( @guest1, "single" )
    @hotel.check_in( @guest1 )
    @hotel.rooms[0].room_service( 10 )
    assert_equal(80, @hotel.rooms[0].price)
  end
  
end



























