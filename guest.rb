#Class Guest

class Guest

  #Should have:
   #name
   #money
   # ??? number of extra guests ???

  attr_accessor :name, :money

 def initialize(name, money)
  @name = name 
  @money = money
 end


 def loose_money( payment )
  @money -= payment
 end

 # room request - booking
    

end

