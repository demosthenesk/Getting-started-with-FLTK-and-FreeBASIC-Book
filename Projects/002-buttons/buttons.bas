#include once "FLTK/Fl_Window.bi"
#include once "FLTK/Fl_Button.bi"
#include once "FLTK/Fl_Light_Button.bi"
#include once "FLTK/Fl_Round_Button.bi"

Dim w as Fl_Window = Fl_Window(200,200,"Window")
	Dim button as Fl_button = Fl_button(10, 10, 100, 20, "FL_Button")
	Dim lbutton as Fl_Light_Button = Fl_Light_Button(10, 50, 130, 20, "FL_Light_Button")
	Dim rbutton as Fl_Round_Button = Fl_Round_Button(10, 90, 100, 20, "FL_Round_Button")

	button.type_(FL_NORMAL_BUTTON)
	lbutton.type_(FL_TOGGLE_BUTTON)
	rbutton.type_(FL_RADIO_BUTTON)

w.end_()

w.show
fl.run_