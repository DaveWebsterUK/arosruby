
module Gtk

  autoload :Widget,           'gtk2/Widget.rb'  
  autoload :Stock,            'gtk2/Stock.rb'   
  autoload :Button,           'gtk2/Button.rb'
  autoload :Window,           'gtk2/Window.rb' 
  autoload :VBox,             'gtk2/VBox.rb'    
  autoload :HBox,             'gtk2/HBox.rb' 
  autoload :Entry,            'gtk2/Entry.rb'  
  autoload :HSeparator,       'gtk2/HSeparator.rb'      
  autoload :Label,            'gtk2/Label.rb'  
  
  
  autoload :TextMark,         'gtk2/TextMark.rb'   
  autoload :TextIter,         'gtk2/TextIter.rb'   
  autoload :TextBuffer,       'gtk2/TextBuffer.rb'    
  autoload :TextView,         'gtk2/TextView.rb'
  

  autoload :ListStore,         'gtk2/ListStore.rb'  
  autoload :TreeView,          'gtk2/TreeView.rb'    
  autoload :TreeSelection,     'gtk2/TreeSelection.rb'  
  autoload :TreeViewColumn,    'gtk2/TreeViewColumn.rb'  
  autoload :CellRendererText,  'gtk2/CellRendererText.rb'  
  autoload :TreeIter,          'gtk2/TreeIter.rb'          
    
  autoload :Frame,             'gtk2/Frame.rb'
  
  autoload :MenuShell,         'gtk2/MenuShell.rb'   
  autoload :MenuBar,           'gtk2/MenuBar.rb' 
  autoload :Menu,              'gtk2/Menu.rb'   
  autoload :MenuItem,          'gtk2/MenuItem.rb'  
  autoload :SeparatorMenuItem, 'gtk2/SeparatorMenuItem.rb'    

  autoload :Toolbar,           'gtk2/Toolbar.rb'  
  autoload :Image,             'gtk2/Image.rb'         
  
  autoload :Builder,           'gtk2/Builder.rb'         
    
  Gtk::SELECTION_SINGLE = "SELECTION_SINGLE"
  
  def Gtk.main()
    z = Zuby.new
    z.mainloop()
  end
  
  def Gtk.main_quit()
    z = Zuby.new
    z.setMUIApplicationQuit
  end

  def Gtk.init(argv = ARGV)
  
  end

end

