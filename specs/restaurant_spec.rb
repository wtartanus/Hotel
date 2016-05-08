require( "minitest/autorun" )
require( "minitest/rg" )
require( "pry-byebug" )
require_relative( "../restaurant.rb" )




class TestRestaurant < MiniTest::Test

  def setup
    
    table1 = [
        {time: "12",guest_in: ""},
        {time: "1",guest_in: ""},
        {time: "2",guest_in: ""},
        {time: "3",guest_in: ""},
        {time: "4",guest_in: ""},
        {time: "5",guest_in: ""},
        {time: "6",guest_in: ""},
        {time: "7",guest_in: ""},
        {time: "8",guest_in: ""},
        {time: "9",guest_in: ""}
    ]

    table2 = [
        {time: "12",guest_in: ""},
        {time: "1",guest_in: ""},
        {time: "2",guest_in: ""},
        {time: "3",guest_in: ""},
        {time: "4",guest_in: ""},
        {time: "5",guest_in: ""},
        {time: "6",guest_in: ""},
        {time: "7",guest_in: ""},
        {time: "8",guest_in: ""},
        {time: "9",guest_in: ""}
    ]

    table3 = [
        {time: "12",guest_in: ""},
        {time: "1",guest_in: ""},
        {time: "2",guest_in: ""},
        {time: "3",guest_in: ""},
        {time: "4",guest_in: ""},
        {time: "5",guest_in: ""},
        {time: "6",guest_in: ""},
        {time: "7",guest_in: ""},
        {time: "8",guest_in: ""},
        {time: "9",guest_in: ""}
    ]

    table4 = [
        {time: "12",guest_in: ""},
        {time: "1",guest_in: ""},
        {time: "2",guest_in: ""},
        {time: "3",guest_in: ""},
        {time: "4",guest_in: ""},
        {time: "5",guest_in: ""},
        {time: "6",guest_in: ""},
        {time: "7",guest_in: ""},
        {time: "8",guest_in: ""},
        {time: "9",guest_in: ""}
    ]

      tables = [ table1, table2, table3, table4 ]

      @restaurant = Restaurant.new("Casablanca", tables)

  end

  def test_restauran_create_name
    assert_equal("Casablanca", @restaurant.name)
  end

  # def test_retaurant_create_tables
  #   binding.pry
  #   @restaurant.tables
  #   long array
  # end

  def test_is_empty_table?
    test = @restaurant.is_empty_table?("1")
    assert_equal( [1,2,3,4], test )
  end

  def test_book_table
    @restaurant.book_table("Wojtek", 1, 1)
    assert_equal( "Wojtek", @restaurant.tables[0][1][:guest_in])
  end

  def test_book_out_table
    @restaurant.book_table("Wojtek", 1, 1)
    @restaurant.out_book("Wojtek")
    assert_equal( "", @restaurant.tables[0][1][:guest_in])
  end
  
end









































