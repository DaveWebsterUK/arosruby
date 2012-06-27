

class Gtk::SeparatorMenuItem

  attr_accessor :muiObject

  def initialize()

	  z = Zuby.new
	  tObject = z.buildMUIMenuSeparatorItem()
	  @muiObject = tObject
  
    self
  end
  
end
