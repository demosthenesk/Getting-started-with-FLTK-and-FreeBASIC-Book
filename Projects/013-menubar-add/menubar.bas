#include once "FLTK/Fl_Window.bi"
#include once "FLTK/Fl_Menu_Bar.bi"
#include once "FLTK/filename.bi"

' This callback is invoked whenever the user clicks an item in the menu bar
Sub MyMenuCallback(w as Fl_Widget ptr, p as any ptr)
	dim bar as Fl_Menu_Bar ptr = cptr(Fl_Menu_Bar ptr, w)
	dim item as const Fl_Menu_Item ptr = cptr(Fl_Menu_Item ptr, bar->mvalue())
	
	dim ipath as string*256
	bar->item_pathname(ipath, sizeof(ipath))	' Get full pathname of picked item
	
	print "callback: You picked " & *item->label()	'Print item picked
	print "item_pathname() is: " & ipath	'and full pathname

	if ( item->flags and (FL_MENU_RADIO or FL_MENU_TOGGLE) ) then 	'Toggle or radio item?
		print "value is " & iif(item->value(), "on", "off")	'Print item's value
	end if
	
	if (*item->label() = "Google" ) then
		'fl_open_uri("http://google.com/")
	end if
	
	if (*item->label()="&Quit") then
		end
	end if
end sub

'main program
Fl.scheme("gtk+")
dim win as Fl_Window = Fl_Window(400,200, "menubar-simple") ' Create window
dim menu as Fl_Menu_Bar = Fl_Menu_Bar(0,0,400,25)	' Create menubar, items..
Dim cb as Fl_Callback = @MyMenuCallback
menu.add("&File/&Open", "^o", cb)
menu.add("&File/&Save", "^s", cb, 0, FL_MENU_DIVIDER)
menu.add("&File/&Quit", "^q", cb)
menu.add("&Edit/&Copy", "^c", cb)
menu.add("&Edit/&Paste", "^v", cb, 0, FL_MENU_DIVIDER)
menu.add("&Edit/Radio 1", 0, cb, 0, FL_MENU_RADIO)
menu.add("&Edit/Radio 2", 0, cb, 0, FL_MENU_RADIO or FL_MENU_DIVIDER)
menu.add("&Edit/Toggle 1", 0, cb, 0, FL_MENU_TOGGLE)			' Default: off 
menu.add("&Edit/Toggle 2", 0, cb, 0, FL_MENU_TOGGLE)			' Default: off
menu.add("&Edit/Toggle 3", 0, cb, 0, FL_MENU_TOGGLE or FL_MENU_VALUE)	' Default: on
menu.add("&Help/Google", 0, cb)

win.end_()
win.show()
Fl.run_()
