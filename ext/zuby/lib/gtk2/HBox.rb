

class Gtk::HBox<Gtk::Widget

  attr_accessor :muiObject
  attr_accessor :border_width    

  def initialize(homogeneous = false, spacing = nil)

	  z = Zuby.new
	  tObject = z.buildMUIHGroup()
	  @muiObject = tObject
  
    self
  end
  
  #FIXME - move to a generic super Box (and container) class
  def add(widget, child_properties = nil)
  
      if ( widget.class == Gtk::MenuBar) # Don't add a MenuBar
        return self
      end
  
  	  z = Zuby.new
	    tWidget = widget.muiObject
	    z.addMUIObject(@muiObject, tWidget)
	    
	    self
  end  

  #FIXME - should inherit from Box
  def pack_start(child, expand = true, fill = true, padding = 0)
 
      if ( child.class == Gtk::MenuBar) # Don't add a MenuBar
        return
      end
  
    #Hack
        self.add(child)
  end
  
end
