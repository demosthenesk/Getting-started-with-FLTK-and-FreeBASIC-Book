#include once "FLTK/Fl_Double_Window.bi"
#include once "FLTK/Fl_Box.bi"

'' main program
Dim z as zstring*128
Dim s as string
Dim w as Fl_Double_Window = _
	Fl_Double_Window(600, 300, "Window")
	Dim box As Fl_Box =_
		Fl_Box(FL_BORDER_BOX,20,30,500,200,"Press any key...")

	while(true) 'catch events
		s=str(fl.event_key)
		z=!"Press ENTER to exit loop.\n"+_
			!"Press any key to see its keycode\n"+_
			"Key code = "+s
		box.label(z)
		box.redraw()
		w.show()
		'if user press ENTER exit loop
		if fl.event_key = 65293 then exit while end if
		fl.check()
	wend

	box.label(!"You pressed ENTER\nExit while..."+_
				"now you can close the window!")
	w.end_
	fl.run_