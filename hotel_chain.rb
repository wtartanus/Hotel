#class Hotel_chain
class Hotel_chain

  #shoudl have
   #name  #hotels
   
  attr_accessor :name, :hotels

  def initialize(name, hotels)
    @name = name
    @hotels = hotels
  end

  #methods
   #check another hotels for room avability

   def check_avabality

    hotel_avability = []
     
     for hotel in @hotels
       hotel_avability << hotel.name
       room_numbers = 0

       for room in hotel.rooms
         if room.booking_status[:status] == false && room.guest_in == ""
          room_numbers += 1
         end
       end

       hotel_avability << room_numbers
     
     end

     return hotel_avability

   end


end
 


  