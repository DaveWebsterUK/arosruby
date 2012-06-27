
class Gtk::Widget

  def reparent(new_parent)

    puts "reparent"
    puts new_parent
    puts self
	  z = Zuby.new
	  puts new_parent.muiObject
	  puts @muiObject
	  
	  z.moveMUIObject(new_parent.muiObject, @muiObject)

  end

  def show()
  
  end

end


