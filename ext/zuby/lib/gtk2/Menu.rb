

  #IGNORE - # We don't need this extra menu widget in MUI, so just pass through the parent

  #IGNORE - # just change append to attach to parent.  DANGER - what if there is no parent defined yet!

class Gtk::Menu<Gtk::MenuShell

  attr_accessor :muiObject

  def initialize()

    self
  end
  
  
end
