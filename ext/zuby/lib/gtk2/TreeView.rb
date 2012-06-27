


class Gtk::TreeView<Gtk::Widget

  attr_accessor :muiObject
  attr_accessor :selection    #Gets the Gtk::TreeSelection associated with the TreeView.
  #attr_accessor :model
  #FIXME add an = method and do the sync

  def initialize(model = nil)

    if( model != nil )
      @model = model
      #HACK - ADD TREEVIEW TO MODEL - limitation is that only one treeview can be associated with a model
      @model.treeView = self
    end
    
    @columns = Array.new # TreeViewColumn

	  z = Zuby.new
	  tObject = z.buildListView()
	  @muiObject = tObject    
    
  end
  
  #Appends column to the list of columns.
    #column : The Gtk::TreeViewColumn to add.
    #Returns : The number of columns in the Gtk::TreeView after appending.
  def append_column(column) 
    @columns.push(column)
    
    
    # Reapply the MUIA_List_Format: "COL=2,COL=1,COL=0"
    #
    tFormatString = ""
    @columns.each do |i|
      tFormatString = tFormatString + "BAR" + ","
    end
    tFormatString = tFormatString.chop # trailing ','
    tFormatString = tFormatString.chop # trailing 'R'
    tFormatString = tFormatString.chop # trailing 'A'
    tFormatString = tFormatString.chop # trailing 'B'
    
    z = Zuby.new
	  tObject = z.setListViewColumnFormat(@muiObject, tFormatString)
    
  end

#NOTE - need to do something after all colums have been pushed
  
end

