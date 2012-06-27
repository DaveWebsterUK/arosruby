

class Gtk::Entry<Gtk::Widget

  attr_accessor :muiObject
  attr_accessor :text  

  def initialize(text=nil, use_underline=nil)

    if (text == nil)
      text = ""
    end

	  z = Zuby.new
	  tObject = z.buildMUIStringEntry(text)
	  @muiObject = tObject
  
    self
  end
  
  
  
end
