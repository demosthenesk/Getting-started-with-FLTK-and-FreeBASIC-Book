#include "FLTK/Fl.bi"
#include "FLTK/Fl_Window.bi"

Function main() As Long
	Dim result as long
	Dim As ZString * 13 str1 => "hello, world"
	Dim fWindow as Fl_Window = Fl_Window(0, 0, 340, 180, str1)
	'' add widgets here
	fWindow.end_()
	'' Create your windows and widgets here
	Fl.lock() '' "start" the FLTK lock mechanism
	'' show your window
	fWindow.show()
	'' start your worker threads
		''  start threads ...
	'' Run the FLTK main loop
	result = Fl.run_()
	'' terminate any pending worker threads
		'' stop threads ...
	return result
End Function
'' call main() and return the error code to the OS
End main()