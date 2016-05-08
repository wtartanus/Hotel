require( "minitest/autorun" )
require( "minitest/rg" )
require( "pry-byebug" )
require_relative( "../hotel_chain.rb")
require_relative( "../hotel.rb" )
require_relative( "../room.rb" )
require_relative( "../guest.rb" )


class TestHotel_chain < MiniTest::Test

  def setup

    @guest1 = Guest.new("Wojtek", 1000)
    @guest2 = Guest.new("Basia", 1500)

    single_room = Room.new("normal", "single", 70, "sea" )
    double_single = Room.new("normal", "two single", 60, "normal" )
    double = Room.new("king", "double", 200, "sea")

    single_room1 = Room.new("normal", "single", 70, "sea" )
    double_single1 = Room.new("normal", "two single", 60, "normal" )
    double1 = Room.new("king", "double", 200, "sea")
    
    rooms = [ single_room, double_single, double ]
    roms1 = [ single_room1, double_single1, double1 ]

    hotel = Hotel.new("Jurys", 10000, rooms, "Casablanca" )
    hotel2 = Hotel.new("Mariot", 5000, roms1, "Valentinos" )

    hotels = [ hotel, hotel2 ]

    @hilton = Hotel_chain.new("Hilton", hotels )

  end


  def test_hotel_create_name
    assert_equal("Hilton", @hilton.name)
  end

  # def test_hotel_create_hotels
  #   binding.pry
  #   @hilton.hotels
  #   Long array
  # end

  def test_hotels_avability
    test = @hilton.check_avabality
    assert_equal( ["Jurys", 3, "Mariot", 3], test)
  end
  




end























