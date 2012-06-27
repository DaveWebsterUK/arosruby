

class Gtk::Toolbar

  attr_accessor :muiObject
  attr_accessor :orientation    

  def initialize(homogeneous = false, spacing = nil)

	  z = Zuby.new
	  tObject = z.buildMUIHGroup()
	  @muiObject = tObject
  
    self
  end
  
  #FIXME - move to a generic super Box (and container) class
  def append(text, tooltip_text = nil, tooltip_private_text = nil, icon = nil, &action) #{ ... }

#toolbar.append("Horizontal", "Horizontal toolbar layout", "Toolbar/Horizontal",
#  Gtk::Image.new("test.xpm")) do
#  toolbar.orientation = Gtk::ORIENTATION_HORIZONTAL
#end

	    z = Zuby.new
      if( icon == nil )

	      tObject = z.buildMUIButton(text)
	      z.addMUIObject(@muiObject, tObject)	 
	               
      else
      
          tFileString = icon.file
      
          tObject = z.buildMUIImageButton(text, tFileString)
	  	    z.addMUIObject(@muiObject, tObject)	        
      end

	    self
  end  

  
end
