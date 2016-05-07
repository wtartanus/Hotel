require( "minitest/autorun" )
require( "minitest/rg" )
require( "pry-byebug" )
require_relative( "../restaurant.rb" )
require_relative( "../guest.rb" )



class TestRestaurant < MiniTest::Test

  def setup
    
    tables = [
      { table_num: 1, lunch: [
                  { time: "12 - 1", guest: "" },
                  { time: "1 - 2", guest: "" },
                  { time: "2 - 3", guest: "" } ], 
         dinner: [
                  { time: "6 - 7", guest: "" },
                  { time: "7 - 8", guest: "" },                 
                  { time: "8 - 9", guest: "" } ]
      },  
      { table_num: 2, lunch: [
                  { time: "12 - 1", guest: "" },
                  { time: "1 - 2", guest: "" },
                  { time: "2 - 3", guest: "" } ], 
         dinner: [
                  { time: "6 - 7", guest: "" },
                  { time: "7 - 8", guest: "" },                 
                  { time: "8 - 9", guest: "" } ]
      },
      { table_num: 3, lunch: [
                  { time: "12 - 1", guest: "" },
                  { time: "1 - 2", guest: "" },
                  { time: "2 - 3", guest: "" } ], 
         dinner: [
                  { time: "6 - 7", guest: "" },
                  { time: "7 - 8", guest: "" },                 
                  { time: "8 - 9", guest: "" } ]
      },
      { table_num: 4, lunch: [
                  { time: "12 - 1", guest: "" },
                  { time: "1 - 2", guest: "" },
                  { time: "2 - 3", guest: "" } ], 
         dinner: [
                  { time: "6 - 7", guest: "" },
                  { time: "7 - 8", guest: "" },                 
                  { time: "8 - 9", guest: "" } ]
      }            
      ]

      @restaurant = Restaurant.new("Casablanca", tables)

  end
  
end