#Class Room


  #Should have 
   #type: #normal  #king
   #number of beds: #one single bed  #two single #one double
   #price
   #view: #sea view #normal view
  #clean status ( each room is clean from start( u can read and cahnge status), every room status change to dirty when check out)
   #clean
   #dirty

   #Guest in( u can fully access it but dont set with initialize)
    #when is no one in just empty variable
    #when is taken name of guest 

    #Status
     #hash with keys:
      #booked
       #from start set to false
       #when is booked change value to true
      #guest name
       #from begining set to empty string
       #when is booked change to guest name

class Room

   attr_accessor :clean_status, :guest_in, :booking_status

   attr_reader :type, :number_beds, :price, :view
   
   def initialize(type,number_beds, price, view)
    @type = type
    @number_beds = number_beds
    @price = price
    @view = view
    @clean_status = ["clean","dirty"]
    @guest_in = ""
    @booking_status = { status: false, guest_name: ""}
   end
   
 #Methods
   #change clean status

   def change_clean_status
    @clean_status.rotate!
   end
   #book room for customer

   def book_room(name)
      @booking_status[:status] = true
      @booking_status[:guest_name] = name
   end

   def outbook_room
    @booking_status[:status] = false
    @booking_status[:guest_name] = ""
   end

   def room_service_add_price( price )
     @price += price
   end

end
