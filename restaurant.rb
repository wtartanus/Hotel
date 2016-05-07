require_relative( "../hotel.rb" )


#Class Restaurant
class Restaurant < Hotel
  #Should have
   #name #number of tables #number of chairs #sitting time????

   attr_accessor :name, :tables
   
  
  def initialize(name, tables)
    @name = name
    @tables = tables
  end


end

 



  #methods
#INHERIT from hotel
 #check in 
 #check out
 #avability