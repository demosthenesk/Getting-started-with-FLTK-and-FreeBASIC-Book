#include once "FLTK/Fl_Window.bi"
#include once "FLTK/Fl_Input.bi"

Dim w as Fl_Window = Fl_Window(400,200,"Window")
	Dim sInput As Fl_Input = Fl_Input(50, 50, 250, 20, "label")
	sInput.value("Now is the time for all good men...")
w.end_()

w.show
fl.run_