

class Gtk::Window

  attr_accessor :muiObject
  attr_accessor :border_width

  def initialize(name=nil)

		z = Zuby.new
		#Reclaim the MUI Root
		@muiObject = z.getMUIRoot()
		
		if( name != nil )
		  z.setMUIWindowTitle(name)
		end
  
    self
  end
  
  def add(pWidget=nil)
  
  	  z = Zuby.new
	    tWidget = pWidget.muiObject
	    z.addMUIObject(@muiObject, tWidget)
	    
	    self
  end
  
  def signal_connect(name=nil, &signal)
  
  end
  
  def show()
  
  end

  def show_all()
  
  end
  
  def set_default_size(width=nil,height=nil)
  
    z = Zuby.new
		#Reclaim the MUI Root
		@muiObject = z.getMUIRoot()
		
		if( width != nil and width > 0 and height != nil and height > 0 )
		    
		  z.setMUIWindowSize(width, height)
		end
    
  
    self
  end
  
  
end
