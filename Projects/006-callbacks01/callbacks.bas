#include once "FLTK/Fl_Double_Window.bi"
#include once "FLTK/Fl_Button.bi"

sub rename_me cdecl(o as Fl_Widget ptr, p as any ptr)
	o->label("Renamed")
	o->redraw()
end sub

'' main program
Dim w as Fl_Double_Window = Fl_Double_Window(200, 105, "Window")
	Dim b1 as Fl_button = Fl_button(20, 10, 160, 35, "Test text")
	Dim cb as Fl_Callback = @rename_me
	b1.callback(cb)
w.end_()
w.resizable(@b1)
w.show()

fl.run_