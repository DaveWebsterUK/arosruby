
#Should be a reference to a model row

class Gtk::TreeIter

  #HACK
  attr_accessor :sourceModel
  #HACK  
  attr_accessor :row

  def initialize()

    #@row = Array.new # NO - Reference this to the source model row!
  end

  def [](column)  
    return get_value(column)
  end
  
  def get_value(column)
    return @row[column]
  end
  
  #def [column]= value
  def []= column, value
    set_value(column, value)
  end
  
  def set_value(column, value)
    @row[column] = value
    
    #FIXME - set the model row to be this!  SHOULDN'T THIS JUST BE A REFERENCE?
    
    puts "TreeIter - rowSize=#{@row.size}, column=#{column}, value=#{value}"
    
    #HACK - tell the source model to sync with the MUI list
    @sourceModel.syncWithMUI()    
  end
  
  

  
end

