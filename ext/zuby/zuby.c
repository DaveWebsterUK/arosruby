// Include the Ruby headers and goodies
#include "ruby.h"

#include <exec/types.h>
#include <graphics/rastport.h>
#include <graphics/gfxmacros.h>
#include <intuition/intuition.h>
#include <proto/dos.h>
#include <proto/exec.h>
#include <proto/graphics.h>
#include <proto/intuition.h>

#include <proto/muimaster.h>
#include <libraries/mui.h>

#include <mui/TextEditor_mcc.h>
#include <mui/Mailtext_mcc.h>
#include <mui/NListview_mcc.h>

#include <SDI/SDI_compiler.h>
#include <SDI/SDI_hook.h>
#include <SDI/SDI_stdarg.h>


VALUE MyMUIClass = Qnil;

Object *mui_wnd = NULL;
Object *mui_app = NULL;

Object *debug_rootgroup = NULL;

Object *mui_wnd_menu = NULL;//Assumption that there is only one menu for the whole application!

static struct Hook  test_displayHook;

/*Function to hook*/
HOOKPROTONO(myCallback, void, APTR *data)
{
	VALUE ruby_callback;

	ruby_callback=(VALUE) *data;

	rb_funcall(ruby_callback, rb_intern("call"), 0);
}
/*Hook to be used*/
MakeHook(myCallbackHook, myCallback);
//


static VALUE zuby_init_object(VALUE self)
{
    printf("%s\n","ZUBY init object()");
  return self;
}




LONG test_DisplayFunc(struct Hook *hook, char **array, VALUE *pRow)
{

	int stringArraySize = RARRAY(pRow)->len;
	
	if( stringArraySize < 1)
	{
				printf(" -- [FAIL] - empty row\n");
				return 0;
	}

	int i;
	for (i = 0; i < RARRAY(pRow)->len; i++)
	{
		if (TYPE( RARRAY(pRow)->ptr[i] ) == T_STRING )
		{
			*array++ = RSTRING( RARRAY(pRow)->ptr[i] )->ptr;
		}
		else
		{
				//FIXME - IMPLEMENT FAIL
				printf(" -- [FAIL] - not a string\n");
		}

	} 
    //Get the item and then create a MUI list entry -         

    return 0;
}


void setup_gui()
{
	//Amiga stuff
	printf("GUI Creation\n");
 
    // GUI creation
    mui_app = ApplicationObject,
    
        SubWindow, mui_wnd = WindowObject,
            MUIA_Window_Title, (char *)"DEBUG",
            
            MUIA_Window_Menustrip, mui_wnd_menu = MenuitemObject,
                                   End,
            
            WindowContents, debug_rootgroup = VGroup,
                //Child, TextObject,
                //    MUIA_Text_Contents, "\33cHello world!\nHow are you?",
                //    End,
                End,
            End,
        End;
}

void zuby_mainloop()
{
  printf("%s\n","Starting Main Zuby loop");
  
  //Collect the root object or build one if not already defined
  
  		if (mui_app)
		{
	 
			// Click Close gadget or hit Escape to quit
			DoMethod(mui_wnd, MUIM_Notify, MUIA_Window_CloseRequest, TRUE,
					 (IPTR)mui_app, 2,
					 MUIM_Application_ReturnID, MUIV_Application_ReturnID_Quit);
	 
			 // Open the window
			set(mui_wnd, MUIA_Window_Open, TRUE);
	 
			printf("Create application\n");
		}
		else
		{
			printf("Failed to create application\n");
		}	
		
		
		
    printf("Main Loop\n");
    
    ULONG sigs = 0;   
	// Check that the window opened
	if (XGET(mui_wnd, MUIA_Window_Open))
	{
		printf("Window Open Check = Okay\n");
		
		// Main loop
		while((LONG)DoMethod(mui_app, MUIM_Application_NewInput, (IPTR)&sigs)
			  != MUIV_Application_ReturnID_Quit)
		{
			if (sigs)
			{
				sigs = Wait(sigs | SIGBREAKF_CTRL_C);
				if (sigs & SIGBREAKF_CTRL_C)
					break;
			}
		}
	}
	else
	{
		printf("Window Open Check = FAIL\n");
	}
	
	printf("Disposing\n");
	// Destroy our application and all its objects
	MUI_DisposeObject(mui_app);		
}


//

static VALUE zuby_buildMUIButton(VALUE self, VALUE pText)
{
    const char *tButtonText = STR2CSTR(pText);
    Object *tButton = SimpleButton(tButtonText);
									
    VALUE tdata = Data_Wrap_Struct(MyMUIClass, 0, NULL, tButton);
    return tdata;
}

static VALUE zuby_setMUIButtonCallback(VALUE self, VALUE pParent, VALUE pCallback)
{
    Object *tButton;
    Data_Get_Struct(pParent, Object, tButton);/*FIXME - add null check*/

    DoMethod(tButton, MUIM_Notify, MUIA_Pressed, FALSE, mui_app,
							3,
							MUIM_CallHook,&myCallbackHook, pCallback);

    return Qnil;
}


static VALUE zuby_buildMUIImageButton(VALUE self, VALUE pText, VALUE pIconFile)
{
    const char *tButtonText = STR2CSTR(pText);
    const char *tButtonIcon = STR2CSTR(pIconFile);    
    Object *tButton = ImageButton(tButtonText, tButtonIcon);

    VALUE tdata = Data_Wrap_Struct(MyMUIClass, 0, NULL, tButton);
    return tdata;
}

static VALUE zuby_buildMUIImage(VALUE self, VALUE pIconFile)
{
    

    VALUE tImageSpecRuby = rb_str_new("3:", strlen("3:"));

    rb_str_concat(tImageSpecRuby, pIconFile);
    

    const char *tImageSpec = STR2CSTR(tImageSpecRuby);

        
    Object *tImage = ImageObject,
                        MUIA_Image_Spec, (IPTR)tImageSpec,     
                        End;

    VALUE tdata = Data_Wrap_Struct(MyMUIClass, 0, NULL, tImage);
    return tdata;
}


//

static VALUE zuby_buildMUILabel(VALUE self, VALUE pText)
{
    const char *tLabelText = STR2CSTR(pText);
    Object *tLabel = TextObject,
						MUIA_Text_Contents, tLabelText,
                     End;

											
    VALUE tdata = Data_Wrap_Struct(MyMUIClass, 0, NULL, tLabel);
    return tdata;
}

static VALUE zuby_buildMUIStringEntry(VALUE self, VALUE pText)
{
    const char *tStringEntryText = STR2CSTR(pText);
    Object *tStringEntry = MUI_NewObject(MUIC_String, 
                                    MUIA_Frame, MUIV_Frame_String, 
                                    MUIA_String_Contents, (IPTR) tStringEntryText, 
                                TAG_DONE);

											
    VALUE tdata = Data_Wrap_Struct(MyMUIClass, 0, NULL, tStringEntry);
    return tdata;
}

static VALUE zuby_buildMUITextArea(VALUE self)
{

    Object *tTextArea = MUI_NewObject(MUIC_TextEditor,
								MUIA_Background, MUII_SHINE,
								MUIA_TextEditor_ReadOnly, FALSE,
								TAG_DONE);				
											
    VALUE tdata = Data_Wrap_Struct(MyMUIClass, 0, NULL, tTextArea);
    return tdata;
}

static VALUE zuby_setMUITextAreaText(VALUE self, VALUE pObject, VALUE pText)
{
    Object *tTextArea;
    Data_Get_Struct(pObject, Object, tTextArea);/*FIXME - add null check*/
    
    STRPTR stringText = RSTRING(pText)->ptr;/*FIXME - add null check*/
    
	//printf("SETTING TEXT %s\n", stringText);
	DoMethod(tTextArea, MUIM_TextEditor_ClearText);
	DoMethod(tTextArea, MUIM_TextEditor_InsertText, stringText, MUIV_TextEditor_InsertText_Top);

	return Qnil;    
}

static VALUE zuby_insertMUITextAreaText(VALUE self, VALUE pObject, VALUE pText, VALUE pPosition)
{
    Object *tTextArea;
    Data_Get_Struct(pObject, Object, tTextArea);/*FIXME - add null check*/
    
    long tPosition = NUM2LONG(pPosition);
    
    STRPTR stringText = RSTRING(pText)->ptr;/*FIXME - add null check*/
    
	DoMethod(tTextArea, MUIM_TextEditor_InsertText, stringText, tPosition);

	return Qnil;    
}

static VALUE zuby_buildMUICheck(VALUE self)
{

    Object *tCheck = MUI_MakeObject(MUIO_Checkmark, "DEBUG");

											
    VALUE tdata = Data_Wrap_Struct(MyMUIClass, 0, NULL, tCheck);
    return tdata;
}



static VALUE zuby_buildMUIRadio(VALUE self, VALUE pStringArray)
{
	int stringArraySize = RARRAY(pStringArray)->len;
	printf("List size = %d\n", stringArraySize);
	
	// One additional element for the closing NULL
	STRPTR *str = AllocVec(sizeof(STRPTR) * (stringArraySize + 1), MEMF_ANY | MEMF_CLEAR);

	int i;
	for (i = 0; i < RARRAY(pStringArray)->len; i++)
	{
		if (TYPE( RARRAY(pStringArray)->ptr[i] ) == T_STRING )
		{
			str[i] = RSTRING( RARRAY(pStringArray)->ptr[i] )->ptr;
		}
		else
		{
				//FIXME - IMPLEMENT FAIL
				printf(" -- [FAIL]\n");
		}

	}

    Object *radio= MUI_MakeObject(MUIO_Radio, NULL, str);

    VALUE tdata = Data_Wrap_Struct(MyMUIClass, 0, NULL, radio);

    return tdata;
}

static VALUE zuby_buildMUIBalance(VALUE self)
{
    Object *tBalance = BalanceObject,
                        End;

    VALUE tdata = Data_Wrap_Struct(MyMUIClass, 0, NULL, tBalance);
    return tdata;
}

static VALUE zuby_buildMUIMenuBar(VALUE self)
{
    //Recover prebuilt the root menu
    Object *tRootMenu = mui_wnd_menu; 

    VALUE tdata = Data_Wrap_Struct(MyMUIClass, 0, NULL, tRootMenu);
    return tdata;
}

static VALUE zuby_buildMUIMenuItem(VALUE self, VALUE pTitle)
{
    const char *tTitle = STR2CSTR(pTitle);
    Object *tMenuItem = MenuitemObject, MUIA_Menuitem_Title, tTitle, End;

    printf("BUILDING MENU ITEM\n");

    VALUE tdata = Data_Wrap_Struct(MyMUIClass, 0, NULL, tMenuItem);
    return tdata;
}

static VALUE zuby_buildMUIMenuSeparatorItem(VALUE self)
{
    printf("BUILDING MENU ITEM\n");
    Object *tMenuItem = MenuitemObject, MUIA_Menuitem_Title, NM_BARLABEL, End;

    VALUE tdata = Data_Wrap_Struct(MyMUIClass, 0, NULL, tMenuItem);
    return tdata;
}	 

static VALUE zuby_buildMUIVGroup(VALUE self)
{
    Object *tVGroup = VGroup,
							End;

    VALUE tdata = Data_Wrap_Struct(MyMUIClass, 0, NULL, tVGroup);
    return tdata;
}

static VALUE zuby_buildMUIHGroup(VALUE self)
{
    Object *tHGroup = HGroup,
							End;
									
    VALUE tdata = Data_Wrap_Struct(MyMUIClass, 0, NULL, tHGroup);
    return tdata;
}

static VALUE zuby_buildMUIFrame(VALUE self, VALUE pTitle)
{
    const char *tTitle = STR2CSTR(pTitle);
    
    Object *tMUIWidget =  HGroup,
	                    MUIA_Frame, MUIV_Frame_Group, 
	                    MUIA_FrameTitle, tTitle, 
	                    MUIA_Background, MUII_GroupBack,
	                  End;
	                  
											
    VALUE tdata = Data_Wrap_Struct(MyMUIClass, 0, NULL, tMUIWidget);
    return tdata;
}

static VALUE zuby_buildListView(VALUE self)
{
	
	//FIXME - this is getting recalled every time a new list is made!
	test_displayHook.h_Entry = HookEntry;
	test_displayHook.h_SubEntry = (HOOKFUNC)test_DisplayFunc;

  	static char *tItems[] = {NULL};
	
    Object *tList = ListObject,
			MUIA_Frame, MUIV_Frame_InputList,
			MUIA_Background, MUII_ListBack,
			MUIA_List_AutoVisible, TRUE,

		  MUIA_List_DisplayHook, (IPTR)&test_displayHook,
		End;

	Object tListview = ListviewObject,
			MUIA_Listview_List, tList,
		    End;

	VALUE tdata = Data_Wrap_Struct(MyMUIClass, 0, NULL, tListview);
	
	return tdata;
}

static VALUE zuby_clearListView(VALUE self, VALUE pListView)
{
    Object *tListview;
    Data_Get_Struct(pListView, Object, tListview);/*FIXME - add null check*/	
    
    DoMethod(tListview, MUIM_List_Clear);

	return Qnil;
}



static VALUE zuby_addToList(VALUE self, VALUE pListView, VALUE pRow)
{
	//pRow is an array of cells
	Object *tListview;
    Data_Get_Struct(pListView, Object, tListview);/*FIXME - add null check*/
    
	int stringArraySize = RARRAY(pRow)->len;
	//printf("ROW size = %d\n", stringArraySize);
	

	DoMethod(tListview, MUIM_List_InsertSingle, pRow, MUIV_List_Insert_Bottom);

	return Qnil;
}

static VALUE zuby_setListViewColumnFormat(VALUE self, VALUE pListView, VALUE pFormat)
{
    Object *tListview;
    Data_Get_Struct(pListView, Object, tListview);/*FIXME - add null check*/
    
    const char *tFormat = STR2CSTR(pFormat);
    
    printf("SETTING ZUNE COLUMN STRING = %s\n", tFormat);
    
    SET(tListview, MUIA_List_Format, tFormat);
			
		char *tFormatDEBUG = XGET(tListview, MUIA_List_Format);	
		printf("GETTING ZUNE COLUMN STRING = %s\n", tFormatDEBUG);	

  return Qnil;
}
//

static VALUE zuby_addMUIObject(VALUE self, VALUE pParent, VALUE pObject)
{
    Object *tParent;
    Data_Get_Struct(pParent, Object, tParent);/*FIXME - add null check*/	
	
    Object *tObject;
    Data_Get_Struct(pObject, Object, tObject);/*FIXME - add null check*/	
	
	  //FIXME - this will fail for some reason if the object is a menu, therefore, we assume that the result is always true
	  DoMethod(tParent,MUIM_Group_InitChange);

		DoMethod(tParent, OM_ADDMEMBER, tObject);
		printf("DoMethod(tParent, OM_ADDMEMBER, tObject);\n");

	   DoMethod(tParent,MUIM_Group_ExitChange);

	
    return Qnil;
}



static VALUE zuby_moveMUIObject(VALUE self, VALUE pNewParent, VALUE pObject)
{
    Object *tNewParent;
    Data_Get_Struct(pNewParent, Object, tNewParent);//FIXME - add null check

    Object *tObject;
    Data_Get_Struct(pObject, Object, tObject);//FIXME - add null check
       
    Object *tCurrentParent = (Object*)XGET(tObject, MUIA_Parent);
   
   
	//This should allow for run-time changes
	if (DoMethod(tCurrentParent,MUIM_Group_InitChange))
	{
	    printf("REMOVING\n");
	    DoMethod(tCurrentParent,OM_REMMEMBER,tObject);
	
	    DoMethod(tCurrentParent,MUIM_Group_ExitChange);
	    	    
    	if (DoMethod(tNewParent,MUIM_Group_InitChange))
      {
          printf("ADDING\n");
          DoMethod(tNewParent, OM_ADDMEMBER, tObject);

          DoMethod(tNewParent,MUIM_Group_ExitChange);
      }
		        
	}
	
	MUI_Redraw(tObject, MADF_DRAWOBJECT); 

    return Qnil;
}

static VALUE zuby_getMUIRoot(VALUE self)
{
	//recover the root MUI object
    VALUE tdata = Data_Wrap_Struct(MyMUIClass, 0, NULL, debug_rootgroup);
    return tdata;
}

static VALUE zuby_getMUIWindow(VALUE self)
{
	//recover the root MUI object
    VALUE tdata = Data_Wrap_Struct(MyMUIClass, 0, NULL, mui_wnd);
    return tdata;
}

static VALUE zuby_setMUIWindowTitle(VALUE self, VALUE pTitle)
{
    const char *tTitle = STR2CSTR(pTitle);
	
    set(mui_wnd, MUIA_Window_Title, tTitle);
    
    return Qnil;
}

static VALUE zuby_setMUIWindowSize(VALUE self, VALUE pWidth, VALUE pHeight)
{
    int tWidth = NUM2INT(pWidth);
    int tHeight = NUM2INT(pHeight);    
	
    set(mui_wnd, MUIA_Window_Width, tWidth);
    set(mui_wnd, MUIA_Window_Width, tHeight);    
    
    return Qnil;
}



static VALUE zuby_getMUIApplication(VALUE self)
{
	//recover the root MUI object
    VALUE tdata = Data_Wrap_Struct(MyMUIClass, 0, NULL, mui_app);
    return tdata;
}

static VALUE zuby_setMUIApplicationQuit(VALUE self)
{
    DoMethod(mui_app, MUIM_Application_ReturnID, MUIV_Application_ReturnID_Quit);
    return Qnil;
}


// The initialization method for this module
void Init_zuby()
{
  printf("%s\n","Init_zuby()");

  //ZUBY
  MyMUIClass = rb_define_class("Zuby", rb_cObject);
  rb_define_method(MyMUIClass, "initialize", zuby_init_object, 0);
  
  rb_define_method(MyMUIClass, "getMUIRoot", zuby_getMUIRoot, 0);
  rb_define_method(MyMUIClass, "getMUIWindow", zuby_getMUIWindow, 0);  
  rb_define_method(MyMUIClass, "setMUIWindowTitle", zuby_setMUIWindowTitle, 1);    
  rb_define_method(MyMUIClass, "setMUIWindowSize", zuby_setMUIWindowSize, 2);      
  
  
  rb_define_method(MyMUIClass, "getMUIApplication", zuby_getMUIApplication, 0);
  rb_define_method(MyMUIClass, "setMUIApplicationQuit", zuby_setMUIApplicationQuit, 0);  
      
  
  rb_define_method(MyMUIClass, "buildMUIButton", zuby_buildMUIButton, 1);
  rb_define_method(MyMUIClass, "setMUIButtonCallback", zuby_setMUIButtonCallback, 2); 
  rb_define_method(MyMUIClass, "buildMUIImageButton", zuby_buildMUIImageButton, 2);  
  
  rb_define_method(MyMUIClass, "buildMUIImage", zuby_buildMUIImage, 1);    
  
  rb_define_method(MyMUIClass, "buildMUILabel", zuby_buildMUILabel, 1);
  rb_define_method(MyMUIClass, "buildMUIStringEntry", zuby_buildMUIStringEntry, 1);
  rb_define_method(MyMUIClass, "buildMUITextArea", zuby_buildMUITextArea, 0);
  rb_define_method(MyMUIClass, "setMUITextAreaText", zuby_setMUITextAreaText, 2); 
  rb_define_method(MyMUIClass, "insertMUITextAreaText", zuby_insertMUITextAreaText, 3);   
   
  //rb_define_method(MyMUIClass, "getMUITextAreaCursorPosition", zuby_getMUITextAreaCursorPosition, 1);  
  
  
  rb_define_method(MyMUIClass, "buildMUICheck", zuby_buildMUICheck, 0);
  rb_define_method(MyMUIClass, "buildMUIRadio", zuby_buildMUIRadio, 1);


  rb_define_method(MyMUIClass, "buildMUIBalance", zuby_buildMUIBalance, 0);  
  
  rb_define_method(MyMUIClass, "buildMUIMenuBar", zuby_buildMUIMenuBar, 0);   
  rb_define_method(MyMUIClass, "buildMUIMenuItem", zuby_buildMUIMenuItem, 1);
  rb_define_method(MyMUIClass, "buildMUIMenuSeparatorItem", zuby_buildMUIMenuSeparatorItem, 0);

 
  //rb_define_method(MyMUIClass, "buildMUIMenu", zuby_buildMUIMenu, 0); 
      
  
  rb_define_method(MyMUIClass, "buildMUIVGroup", zuby_buildMUIVGroup, 0);
  rb_define_method(MyMUIClass, "buildMUIHGroup", zuby_buildMUIHGroup, 0);  
  rb_define_method(MyMUIClass, "buildMUIFrame", zuby_buildMUIFrame, 1);    
    
  rb_define_method(MyMUIClass, "buildListView", zuby_buildListView, 0); 
  rb_define_method(MyMUIClass, "clearListView", zuby_clearListView, 1);   
  rb_define_method(MyMUIClass, "setListViewColumnFormat", zuby_setListViewColumnFormat, 2);        
  rb_define_method(MyMUIClass, "addToList", zuby_addToList, 2);   
  
  rb_define_method(MyMUIClass, "addMUIObject", zuby_addMUIObject, 2);  
  rb_define_method(MyMUIClass, "moveMUIObject", zuby_moveMUIObject, 2);    

  rb_define_method(MyMUIClass, "mainloop", zuby_mainloop, -1);
  
  setup_gui();
}


