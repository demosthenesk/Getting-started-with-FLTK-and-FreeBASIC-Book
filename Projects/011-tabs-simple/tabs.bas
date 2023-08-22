#include once "FLTK/Fl_Window.bi"
#include once "FLTK/Fl_Tabs.bi"
#include once "FLTK/Fl_Group.bi"
#include once "FLTK/Fl_Button.bi"

' Simple tabs example
'      _____  _____
'   __/ Aaa \/ Bbb \______________________
'  |    _______                           |
'  |   |_______|                          |
'  |    _______                           |
'  |   |_______|                          |
'  |    _______                           |
'  |   |_______|                          |
'  |______________________________________|
'
Fl.scheme("gtk+")
Dim win as Fl_Window = Fl_Window(0,0,500,200,"Tabs example")
	Dim tabs as Fl_Tabs = Fl_Tabs(10,10,500-20,200-20)
		Dim aaa as Fl_Group = Fl_Group(10,35,500-20,200-45,"Aaa")
			Dim b1 as Fl_Button = Fl_Button(50, 60,90,25,"Button A1")
			b1.color(88+1)
			Dim b2 as Fl_Button = Fl_Button(50, 90,90,25,"Button A2")
			b2.color(88+2)
			Dim b3 as Fl_Button = Fl_Button(50,120,90,25,"Button A3")
			b3.color(88+3)
		aaa.end_()
		
		 Dim bbb as Fl_Group = Fl_Group(10,35,500-10,200-35,"Bbb")
			Dim b4 as Fl_Button = Fl_Button( 50,60,90,25,"Button B1")
			b4.color(88+1)
			Dim b5 as Fl_Button = Fl_Button(150,60,90,25,"Button B2")
			b5.color(88+3)
			Dim b6 as Fl_Button = Fl_Button(250,60,90,25,"Button B3")
			b6.color(88+5)
			Dim b7 as Fl_Button = Fl_Button( 50,90,90,25,"Button B4")
			b7.color(88+2)
			Dim b8 as Fl_Button = Fl_Button(150,90,90,25,"Button B5")
			b8.color(88+4)
			Dim b9 as Fl_Button = Fl_Button(250,90,90,25,"Button B6")
			b9.color(88+6)
		bbb.end_()
	tabs.end_()
win.end_()
win.show()
Fl.run_()
