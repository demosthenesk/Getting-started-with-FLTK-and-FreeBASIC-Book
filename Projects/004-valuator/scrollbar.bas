#include once "FLTK/Fl_Window.bi"
#include once "FLTK/Fl_Scrollbar.bi"

Dim w as Fl_Window = Fl_Window(400,200,"Window")
	Dim vScrollBar As Fl_Scrollbar=Fl_Scrollbar(10,50,300,24,"Scrollbar")

	vScrollBar.type_(FL_HORIZONTAL)
	vScrollBar.minimum(0.00)
	vScrollBar.maximum(100.00)
	vScrollBar.value(50.00)
w.end_()

w.show
fl.run_