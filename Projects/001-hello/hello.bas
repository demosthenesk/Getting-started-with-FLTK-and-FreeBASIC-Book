#include "FLTK/Fl_Window.bi"
#include "FLTK/Fl_Box.bi"

Dim fWindow As Fl_Window Ptr
Dim fBox As Fl_Box Ptr
Dim As ZString * 13 str1 => "hello, world"

fWindow  = New Fl_Window(0, 0, 340, 180, str1)
	fBox = New Fl_Box(20, 40, 300, 100, str1)
	fBox->box(FL_UP_BOX)
	fBox->labelfont(FL_BOLD + FL_ITALIC)
	fBox->labelsize(36)
	fBox->labeltype(FL_SHADOW_LABEL)
fWindow->end_()
fWindow->show()

Fl.run_()
