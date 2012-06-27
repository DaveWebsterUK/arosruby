

class Gtk::MenuItem

  attr_accessor :muiObject

  def initialize(label = nil, use_underline = true)

	  z = Zuby.new
	  tObject = z.buildMUIMenuItem(label)
	  @muiObject = tObject
  
    self
  end
  
  def set_submenu(submenu)
      @submenu = submenu # is a 'Gtk::Menu'
    
      submenu.muiObject = @muiObject # Just pass it on
  	  #z = Zuby.new
	    #tWidget = submenu.muiObject
	    #z.addMUIObject(@muiObject, tWidget)    
	    
	    
	    #set_submenu    
    
  end
end
