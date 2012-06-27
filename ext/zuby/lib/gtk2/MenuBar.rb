
# Limitation - there can only be one Menubar in MUI (I think!) - check this

class Gtk::MenuBar<Gtk::MenuShell

  attr_accessor :muiObject

  def initialize(label = nil)


#TODO - grab/recover the MUI menu
	  z = Zuby.new
	  tObject = z.buildMUIMenuBar()
	  @muiObject = tObject
  
    self
  end
  


  
end
