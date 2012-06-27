

class Gtk::TextBuffer

  attr_accessor :muiObject
  attr_accessor :_view

  def initialize()

#	  z = Zuby.new
#	  tObject = z.buildMUIFrame(label)
#	  @muiObject = tObject

    @text = ""
  
    self
  end
  
  def text=(text)
    @text = text
    
    z = Zuby.new    
    z.setMUITextAreaText( @_view.muiObject, @text) 
  end
  
  def set_text(text)
    @text = text
  end
  
  def get_iter_at_offset(char_offset)
  
    tIter = Gtk::TextIter.new
    tIter.offset = char_offset 
  
    return tIter
  end
  
  def selection_bound()
  #HACK
    return Gtk::TextMark.new()
  end
  
  def get_iter_at_mark(mark)
  
    #HACK - just get an iter for the currently selected position (left)
    z = Zuby.new         
    tIter = Gtk::TextIter.new
    tIter.offset = z.getMUITextAreaCursorPosition(@_view.muiObject)     
  end
  
  def insert(iter=nil, text=nil)
  
    @text.insert(iter.offset, text)
    
    #fix - sync this with the GUI
    z = Zuby.new     
    z.setMUITextAreaText( @_view.muiObject, @text) 
  
    #z = Zuby.new
    #z.insertMUITextAreaText(text, iter)
  end
  
end




