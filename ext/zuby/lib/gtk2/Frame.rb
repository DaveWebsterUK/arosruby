

class Gtk::Frame

  attr_accessor :muiObject
  attr_accessor :border_width  

  def initialize(label = nil)

	  z = Zuby.new
	  tObject = z.buildMUIFrame(label)
	  @muiObject = tObject
  
    self
  end
  
  def add(pWidget=nil)
  
  	  z = Zuby.new
	    tWidget = pWidget.muiObject
	    z.addMUIObject(@muiObject, tWidget)
	    
	    self
  end  

  
end
