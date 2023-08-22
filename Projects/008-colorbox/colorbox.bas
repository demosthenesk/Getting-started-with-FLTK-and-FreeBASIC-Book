#include once "FLTK/Fl_Double_Window.bi"
#include once "FLTK/Fl_Scrollbar.bi"
#include once "FLTK/Fl_Box.bi"

declare sub setColor(as Fl_Widget ptr, as any ptr)

'' main program
Dim shared w as Fl_Double_Window = _
	Fl_Double_Window(600, 300, "Window")
	Dim shared box As Fl_Box =_
		Fl_Box(FL_BORDER_BOX,20,30,500,100,"Color")
	Dim shared hScrollBarRed As Fl_Scrollbar=_
		Fl_Scrollbar(20,135,300,24,"Red")
	Dim shared hScrollBarGreen As Fl_Scrollbar=_
		Fl_Scrollbar(20,185,300,24,"Green")
	Dim shared hScrollBarBlue As Fl_Scrollbar=_
		Fl_Scrollbar(20,235,300,24,"Blue")

	hScrollBarRed.type_(FL_HORIZONTAL)
	hScrollBarGreen.type_(FL_HORIZONTAL)
	hScrollBarBlue.type_(FL_HORIZONTAL)

	hScrollBarRed.minimum(0)
	hScrollBarRed.maximum(255)
	hScrollBarRed.value(0)
	
	hScrollBarGreen.minimum(0)
	hScrollBarGreen.maximum(255)
	hScrollBarGreen.value(128)
	
	hScrollBarBlue.minimum(0)
	hScrollBarBlue.maximum(255)
	hScrollBarBlue.value(0)

	Dim c as Fl_Color = fl_rgb_color(hScrollBarRed.value,_
									 hScrollBarGreen.value,_
									 hScrollBarBlue.value)
	box.Color(c)

	Dim cb as Fl_Callback = @setColor
	hScrollBarRed.callback(cb)
	hScrollBarGreen.callback(cb)
	hScrollBarBlue.callback(cb)

w.end_()
w.show()

fl.run_
'' end of main program

sub setColor(o as Fl_Widget ptr, p as any ptr)
	Dim c as Fl_Color = fl_rgb_color(hScrollBarRed.value,_
									 hScrollBarGreen.value,_
									 hScrollBarBlue.value)
	box.Color(c)
	box.redraw()
end sub
