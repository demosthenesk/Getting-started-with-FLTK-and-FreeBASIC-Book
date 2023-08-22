#include once "FLTK/Fl_Double_Window.bi"
#include once "FLTK/Fl_Button.bi"
#include once "FLTK/Fl_Input.bi"

sub rename_me(o as Fl_Widget ptr, s as any ptr)
	dim s0 as Fl_Input ptr = s
	o->label(s0->value)
	o->redraw()
end sub

'' main program
Dim w as Fl_Double_Window = Fl_Double_Window(300, 125, "Window")
	Dim sInput1 As Fl_Input = Fl_Input(70,50,160,35,"Input:")
	Dim b1 as Fl_button = Fl_button(70, 10, 160, 35, "Change text")
	Dim cb as Fl_Callback = @rename_me
	b1.callback(cb, @sInput1)

w.end_()
w.resizable(@b1)
w.resizable(@sInput1)
w.show()

fl.run_