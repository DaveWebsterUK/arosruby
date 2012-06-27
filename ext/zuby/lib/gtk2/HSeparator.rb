

class Gtk::HSeparator<Gtk::Widget

  attr_accessor :muiObject

  def initialize(text=nil, use_underline=nil)

	  z = Zuby.new
	  tObject = z.buildMUIBalance()
	  @muiObject = tObject
  
    self
  end
  

  
end
