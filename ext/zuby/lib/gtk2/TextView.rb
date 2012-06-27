

class Gtk::TextView<Gtk::Widget

  attr_accessor :muiObject
  attr_accessor :buffer
  attr_accessor :set_editable  

  def initialize(buffer = nil)

    if( buffer == nil)
      @buffer = Gtk::TextBuffer.new
    else
      @buffer = buffer
    end
    
    #HACK - only associate one textview with a buffer - to allow for auto sync
    @buffer._view = self

	  z = Zuby.new
	  tObject = z.buildMUITextArea()
	  @muiObject = tObject
  
    if(buffer != nil)
      z.setMUITextAreaText(tObject, @buffer.text)
    end
  
    @set_editable = true
    self
  end
  
  
  def signal_connect(name=nil, &signal)
  
  
  end
  
  def show()
  
  end
  
end
