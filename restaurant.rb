require_relative( "hotel.rb" )


#Class Restaurant
class Restaurant 
  #Should have
   #name #number of tables #number of chairs #sitting time????

   attr_accessor :name, :tables
   
  
  def initialize(name, tables)
    @name = name
    @tables = tables
  end


  def is_empty_table?( time )
    empty_tables = []
    index = 0
    while index < @tables.size
      for table_time in @tables[index]
        if table_time[:time] == time && table_time[:guest_in] == ""
          empty_tables << index + 1
        end
      end
      index += 1
    end
    return empty_tables
  end

  def book_table( guest, table_number, time )

    table_num = table_number - 1
    
    if time == 12 
      time = 0
    end
    
    @tables[table_num][time][:guest_in] = guest

  end


  def out_book( name )

    index = 0
    while index < @tables.size
      for table_time in @tables[index]
        if table_time[:guest_in] == name
          table_time[:guest_in] = ""
        end
      end
      index += 1
    end


  end



end

 



 















