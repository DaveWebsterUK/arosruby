
#TODO - add a proper mapping to the Tango icon library

class Gtk::Image

  attr_accessor :muiObject
  attr_accessor :file

  #def initialize(value = nil)
  #
  #  @file = value
  #
  #  self
  #end
  
  def initialize(stock_id, size=nil)

    #if( stock_id == nil)
    #  @file = "Development:tango-icon-theme-0.8.90/32x32/emblems/emblem-unreadable.png"
    #end


    if (stock_id == "gtk-about")
      @file = "Development:tango-icon-theme-0.8.90/32x32/apps/help-browser.png"
    elsif (stock_id == "gtk-add")
      @file = "Development:tango-icon-theme-0.8.90/32x32/actions/list-add.png"
    elsif (stock_id == "gtk-apply")
      @file = "Development:tango-icon-theme-0.8.90/32x32/status/dialog-information.png"
      
            
    elsif (stock_id == "gtk-ok")
      @file = "Development:tango-icon-theme-0.8.90/32x32/actions/go-next.png"
    else
    
      #Check if file exists - Hack for specified file
      if( stock_id != nil and File.exists?(stock_id) )
        @file = stock_id
        #@file = "Development:tango-icon-theme-0.8.90/32x32/actions/list-add.png"
        
        z = Zuby.new
	      tObject = z.buildMUIImage(@file)
	      @muiObject = tObject
      else 
        @file = "Development:tango-icon-theme-0.8.90/32x32/emblems/emblem-unreadable.png"
      end
      
    end

  end
  
end
