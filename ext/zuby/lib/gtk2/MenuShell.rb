

class Gtk::MenuShell


  def append(child=nil)
  
  	  z = Zuby.new
	    tWidget = child.muiObject
	    z.addMUIObject(@muiObject, tWidget)
	    
	    puts "appending #{@muiObject}"
	    
	    self
  end  

  
end
