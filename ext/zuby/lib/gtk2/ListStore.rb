
#FIXME - should data only be stored in the iter?  or it iter just referencing this?

#TODO - figure out when the list should sync with the MUI list?

class Gtk::ListStore

  #attr_accessor :iter  - should iter be a TreeIter?
  attr_accessor :treeView#HACK

  def initialize(type1, *rest)#, ...)#FIXME

      #build a list
      @data_list = Array.new # FIXME - add a type?

  end
  
  
#  def iter=(iter)
#  
#    #sync to view
#
#  end
  
  def append()
  
    tRow = Array.new#new row
  
    @data_list.push(tRow)
    #tRow = @data_list.at(-1)#last item
     
    tRowIndex =  @data_list.size - 1
      
    #Iter should be a reference to the row  
    tIter = Gtk::TreeIter.new
    
    #HACK - attach model to iter
    tIter.sourceModel = self
    
    #tRowData = @data_list[tRowIndex] # Redundant?
    tIter.row = tRow# - set the row HACK?
    #tRowData.each_with_index {|val, i| tIter.set_value(i, val) } # WRONG - will be empty at this point!
 
    
    
    #Sync
    #FIXME - the row will be empty at this point!
    #syncWithMUI()
    
      
    #return the iter
    return tIter
    
    ##
  end
  
  def set_value(iter, column, value)
    
    #iter[column] = value
  
    self
  end
  
  def insert(position)
  
  end
  
  def clear()
  
  end
  

  def syncWithMUI()
  
    puts "<-SYNC->"
  
      #wipe mui list
      z = Zuby.new
      tObject = z.clearListView(@treeView.muiObject)
      #@muiObject = tObject                

      if( @data_list.size == 0)
        puts "EMPTY LIST"
        return
      else
        puts "NON-EMPTY LIST #{@data_list.size}"
      end

      #copy Ruby list to MUI List
      #-should be a row (a string array)
      @data_list.each do |tRow|
        z.addToList(@treeView.muiObject, tRow)
      end
      #LOOP and add      
      #@treeView.

      
    
  end  
  
end
