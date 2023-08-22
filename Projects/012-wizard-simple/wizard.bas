#include once "FLTK/Fl_Window.bi"
#include once "FLTK/Fl_Group.bi"
#include once "FLTK/Fl_Wizard.bi"
#include once "FLTK/Fl_Button.bi"
#include once "FLTK/Fl_Multiline_Output.bi"

Dim shared G_Win as Fl_Window = Fl_Window(400,300,"Example Wizard")
Dim shared G_Wiz as Fl_Wizard = Fl_Wizard(0,0,400,300)

public sub back_cb cdecl(o as Fl_Widget ptr, p as any ptr)
	G_Wiz.prev()
end sub

public sub next_cb cdecl(o as Fl_Widget ptr, p as any ptr)
	G_Wiz.next_()
end sub

public sub done_cb cdecl(o as Fl_Widget ptr, p as any ptr)
	end
end sub

' Wizard: page 1
Dim g1 as Fl_Group = Fl_Group(0,0,400,300)
Dim next1 as Fl_Button = Fl_Button(290,265,100,25,"Next @->")
Dim cb1 as Fl_Callback = @next_cb
next1.callback(cb1)
Dim out1 as Fl_Multiline_Output = Fl_Multiline_Output(10,30,400-20,300-80,"Welcome")
out1.labelsize(20)
out1.align(FL_ALIGN_TOP or FL_ALIGN_LEFT)
out1.value("This is First page")
g1.end_()

' Wizard: page 2
Dim g2 as Fl_Group = Fl_Group(0,0,400,300)
Dim next2 as Fl_Button = Fl_Button(290,265,100,25,"Next @->")
next2.callback(cb1)
Dim back1 as Fl_Button = Fl_Button(180,265,100,25,"@<- Back")
Dim cb2 as Fl_Callback = @back_cb
back1.callback(cb2)
Dim out2 as Fl_Multiline_Output = Fl_Multiline_Output(10,30,400-20,300-80,"Terms And Conditions")
out2.labelsize(20)
out2.align(FL_ALIGN_TOP or FL_ALIGN_LEFT)
out2.value("This is the Second page")
g2.end_()

' Wizard: page 3
Dim g3 as Fl_Group = Fl_Group(0,0,400,300)
Dim  done as Fl_Button = Fl_Button(290,265,100,25,"Finish")
Dim cb3 as Fl_Callback = @done_cb
done.callback(cb3)
Dim back as Fl_Button = Fl_Button(180,265,100,25,"@<- Back")
back.callback(cb2)
Dim out3 as Fl_Multiline_Output = Fl_Multiline_Output(10,30,400-20,300-80,"Finish")
out3.labelsize(20)
out3.align(FL_ALIGN_TOP or FL_ALIGN_LEFT)
out3.value("This is the Last page")
g3.end_()

G_Wiz.end_()
G_Win.end_()
G_Win.show()
Fl.run_()