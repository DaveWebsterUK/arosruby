require "rexml/document"
include REXML


#FIXME - need to return a ["window1"]

#FIXME - add all the created objects to a map

class Gtk::Builder


  def initialize(pCallee)#HACK
    #HACK
    @callee = pCallee

    @widgetMap = Hash.new
  end
  
  def add_from_file(filename=nil)
    gladeRootNode = (Document.new File.new filename).root

    if (gladeRootNode.name == "interface")
      return process_interface(gladeRootNode)
    end
    
    return nil
  end
  
  
  def process_interface(pElement)
  
    pElement.each_element do |child|
    
      if (child.name == "requires")
        process_requires(child)
      
      elsif (child.name == "object")
        return process_object(child, nil)
      
      end
    
    end
  
  end
  
  def process_requires(pElement)
  
  
  end

  def process_object(pElement, pParent)
  
    tObject = nil
  
    #get class and id
    tClassValue = pElement.attributes.get_attribute("class").value
    tIDValue = pElement.attributes.get_attribute("id").value
    
    #FIXME - set the (class instance) variable name in the root (callee) class
    
     if (tClassValue == "GtkWindow")
     
      
        tTitle = find_property_with_name(pElement, "title")
        if ( tTitle == nil )
          tTitle = "DEFAULT WINDOW"
        end
     
        tObject = Gtk::Window.new(tTitle) 
        @widgetMap[tIDValue] = tObject
        puts "Building a GtkWindow"
     elsif (tClassValue == "GtkHBox")
        tObject = Gtk::HBox.new()
        @widgetMap[tIDValue] = tObject
        pParent.add(tObject)
     elsif (tClassValue == "GtkVBox")
        tObject = Gtk::VBox.new()
        @widgetMap[tIDValue] = tObject
        pParent.add(tObject)  
     elsif (tClassValue == "GtkButton")
        tLabel = find_property_with_name(pElement, "label")
        tObject = Gtk::Button.new(tLabel)
        @widgetMap[tIDValue] = tObject
        pParent.add(tObject)
     elsif (tClassValue == "GtkLabel")
        tLabel = find_property_with_name(pElement, "label")
        tObject = Gtk::Label.new(tLabel)  
        @widgetMap[tIDValue] = tObject   
        pParent.add(tObject)
     elsif (tClassValue == "GtkEntry")
        #tLabel = find_property_with_name(pElement, "label")
        tObject = Gtk::Entry.new()   
        @widgetMap[tIDValue] = tObject  
        pParent.add(tObject)
     elsif (tClassValue == "GtkTextView")
        #tLabel = find_property_with_name(pElement, "label")
        tObject = Gtk::TextView.new() 
        @widgetMap[tIDValue] = tObject    
        pParent.add(tObject)   
     elsif (tClassValue == "GtkMenuBar")
     ##
        tObject = Gtk::MenuBar.new()   
        @widgetMap[tIDValue] = tObject  
        #pParent.append(tObject)           
     elsif (tClassValue == "GtkMenuItem")
     #append
        tLabel = find_property_with_name(pElement, "label")
        tObject = Gtk::MenuItem.new(tLabel)
        @widgetMap[tIDValue] = tObject     
        pParent.append(tObject)   
     elsif (tClassValue == "GtkSeparatorMenuItem")
     #append
        tObject = Gtk::SeparatorMenuItem.new() 
        @widgetMap[tIDValue] = tObject                  
        pParent.append(tObject)     
     elsif (tClassValue == "GtkMenu")
     #set_submenu
        tObject = Gtk::Menu.new()
        @widgetMap[tIDValue] = tObject               
        pParent.set_submenu(tObject)         
     elsif (tClassValue == "GtkImageMenuItem")#HACK, just create a 'GtkMenuItem'
     #append
        tLabel = find_property_with_name(pElement, "label")
        tObject = Gtk::MenuItem.new(tLabel)
        @widgetMap[tIDValue] = tObject     
        pParent.append(tObject)                   
     elsif (tClassValue == "GtkToolbar")
        tObject = Gtk::Toolbar.new()
        @widgetMap[tIDValue] = tObject
        pParent.add(tObject)   
        
     elsif (tClassValue == "GtkToolButton")
             pParent.append(find_property_with_name(pElement, "label"), "DEBUG", "DEBUG",
                            Gtk::Image.new( find_property_with_name(pElement, "stock_id"), 32 ) )            
     elsif (tClassValue == "GtkImage")
               
        tPixbuf = find_property_with_name(pElement, "pixbuf")
        tObject = Gtk::Image.new(tPixbuf)
        @widgetMap[tIDValue] = tObject
        pParent.add(tObject)   
     else
        abort("UNSUPPORTED WIDGET '#{tClassValue}'")
     end

                                    

  
    pElement.each_element do |child|
    
      if (child.name == "child")
        process_child(child, tObject)
      elsif (child.name == "signal")
        process_signal(child, tObject)
      end
      
    end
    
    return tObject  
    
  end  

  def process_child(pElement, pObject)
  
    pElement.each_element do |child|
    
      if (child.name == "object")
        process_object(child, pObject)
      end
    
    end 
     
  end
  

  def find_property_with_name(pElement, pName)
  
      pElement.each_element do |child|
      
          puts "CHILD=#{child}"
      
          if (child.name == "property")

            if (child.attributes.get_attribute("name").value == pName)
                tText = child.get_text.value
                puts "NAME TEXT=#{tText}"
                
                #HACK - remove the Mnemonic for the moment
                
                if( tText[0] == "_"[0] )
                  tText.slice!(0)
                  puts "FIXED TEXT=#{tText}"
                end
                
                return tText
              end
              
          end
      
      end

      return nil
  end


  def process_signal(pElement, pObject)
  
        puts "* process_signal"
        
  
       if(pElement.parent.attributes.get_attribute("class").value == "GtkButton")
        
          puts "* GtkButton"
        
          if (pElement.attributes.get_attribute("name").value == "clicked")
          
            puts "* clicked"
          
            tHandlerMethod = pElement.attributes.get_attribute("handler").value#pElement.get_text.value
              
              
              pObject.signal_connect('clicked') do
              
                puts "Processing CLICKED"
              
                #a.
                @callee.send(tHandlerMethod)#call the method
              end
          end


      end

  
  end
  

  def [](name)
    return get_object(name)
  end
  
  def get_object(name)
    return @widgetMap[name]
  end

end

