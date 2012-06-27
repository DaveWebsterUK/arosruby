

class Gtk::Button<Gtk::Widget

  attr_accessor :muiObject

  def initialize(text=nil, use_underline=nil)

	  z = Zuby.new
	  tObject = z.buildMUIButton(text)
	  #tObject = z.buildMUIImageButton(text, "Development:tango-icon-theme-0.8.90/16x16/actions/bookmark-new.png")
	  
	  
	  @muiObject = tObject
  
    self
  end
  
  
  def signal_connect(name=nil, &signal)
  
    if (name == "clicked" )
          z = Zuby.new
      		z.setMUIButtonCallback(@muiObject, signal)
    end
  
  end
  

  
end
