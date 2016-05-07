
#Class Hotel
class Hotel
  #Should have:
  #name #bank #rooms = []  # ????restaurant
  
  attr_accessor :name, :bank, :rooms

  attr_reader :booking_fee

  def initialize(name,bank,rooms)
    @name = name
    @bank = bank
    @rooms = rooms
    @booking_fee = 50
  end
  


   #methods
    #add money

    def add_money(payment)
      @bank += payment
    end

    #check room avability
    def is_empty?( room_type )
      for room in @rooms
       if room.number_beds == room_type
        if room.guest_in == "" && room.booking_status[:status] == false
          return true
        end
       end
      end
    end

    
    #book choosen room
    def book_room( guest, room_type)

      guest_name = guest.name

      for room in @rooms
        if room.number_beds == room_type
          room.booking_status[:status] = true
          room.booking_status[:guest_name] = guest_name
        end
      end
     
    end



    
    #accept booking
    def booking(guest, room)

      #check room avability
      room_status = is_empty?( room )

      if room_status == true
          #charge customer booking fee
          guest.loose_money( @booking_fee)
          #add to bank booking fee
          add_money( @booking_fee )
          #book choosen room
          book_room(guest, room)

      else
        text = "Sorry this room is taken"
        return text
      end
    end
     


     #check in 
     def check_in( guest )

      guest_name = guest.name

      #alocate customer in choosen room
      #change room avability

      for room in rooms
        if room.booking_status[:guest_name] == guest_name
          room.booking_status[:guest_name] = ""
          room.booking_status[:status] = false
          room.guest_in = guest_name
        end
      end

     end
     

     #check out 
    def check_out( guest )

      guest_name = guest.name

      room_price = ""

      room_type = ""
      
      #romove customer from room
        for room in rooms
          if room.guest_in == guest_name
            room.guest_in = ""
            room_price = room.price - 50
            room_type = room.number_beds
          end
        end

      #charge customer ( customer loose money )
      guest.loose_money( room_price )

      #add to bank room price
      add_money( room_price )

      #change room cleaning status
      for room in rooms
        if room.number_beds == room_type
          room.change_clean_status
        end
      end

    end


    
end




























