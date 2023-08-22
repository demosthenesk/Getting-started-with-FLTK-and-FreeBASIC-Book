#include once "FLTK/Fl_Window.bi"
#include once "FLTK/Fl_Box.bi"

'SIMPLE SENDER UDT
Type sender extends Fl_Box
	declare constructor()
	declare constructor (byref w as const sender)
	declare operator let (byref w as const sender)
	declare function handle(as long) as long
End Type

constructor sender()
	base(FL_FLAT_BOX, 0,0,100,100,"Sender")
end constructor

function sender.handle(event as long) as long
	dim ret as long = base.handle(event)
	select case event
		case FL_PUSH
			dim msg as string = "It works!"
			Fl.copy(msg, len(msg),0)
			Fl.dnd()
			ret=1
	end select
	return(ret)
end function

'SIMPLE RECIEVER UDT
Type reciever extends Fl_Box
	declare constructor()
	declare constructor (byref w as const reciever)
	declare operator let (byref w as const reciever)
	declare function handle(as long) as long
End Type

constructor reciever()
	base(FL_FLAT_BOX, 100,0,100,100,"Reciever")
end constructor

function reciever.handle(event as long) as long
	dim ret as long = base.handle(event)
	select case event
		case FL_DND_ENTER	'return(1) for these events to 'accept' dnd
			ret=1
		case FL_DND_DRAG
			ret=1
		case FL_DND_RELEASE
			ret=1
		case FL_PASTE	'handle actual drop (paste) operation
			this.label(Fl.event_text())
			ret=1
	end select
	return(ret)
end function

''main program
'Create sender window and widget
Dim win_a as Fl_Window = Fl_Window(0,0,200,100,"Sender")
	Dim a as sender = sender()
	a.Color(9)
	a.label(!"Drag \nfrom here...")
win_a.end_()
win_a.show()

'Create receiver window and widget
Dim win_b as Fl_Window = Fl_Window(400,0,200,100,"Receiver")
	Dim b as reciever= reciever()
	b.Color(10)
	b.label(!"...to\nhere!")
win_b.end_()
win_b.show()

Fl.run_()