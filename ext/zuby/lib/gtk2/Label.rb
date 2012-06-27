

class Gtk::Label<Gtk::Widget

  attr_accessor :muiObject
  attr_accessor :selectable  

  def initialize(str = nil, mnemonic = false)

    if (str == nil)
      str = "UNDEFINED"
    end

	  z = Zuby.new
	  tObject = z.buildMUILabel(str)
	  @muiObject = tObject
	  
	  self
  
  end
  
  def set_markup(str, mnemonic = false)
  
    self
  end
  
  def select_region(start_offset, end_offset)
  
  end
  
end
