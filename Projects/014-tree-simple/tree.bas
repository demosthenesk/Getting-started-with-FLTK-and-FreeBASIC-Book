#include once "FLTK/Fl_Double_Window.bi"
#include once "FLTK/Fl_Menu_Bar.bi"
#include once "FLTK/Fl_Tree.bi"

'Tree's callback
'Invoked whenever an item's state changes.
'This callback is invoked whenever the user clicks an item in the menu bar
Sub TreeCallback(w as Fl_Widget ptr, p as any ptr)
	var tree = cptr(Fl_Tree ptr, w)
	dim item as const Fl_Tree_Item ptr = cptr(Fl_Tree_Item ptr, tree->callback_item())
	if (item <> 1) then 
		exit sub
	end if
	
	select case (tree->callback_reason())
	case FL_TREE_REASON_SELECTED
		dim pathname as string*256
		tree->item_pathname(pathname, sizeof(pathname), item)
		print "TreeCallback: Item selected=" & item->label() & " Full pathname= " & pathname
	case FL_TREE_REASON_DESELECTED
		print "TreeCallback: Item " & item->label() & " deselected"
	case FL_TREE_REASON_OPENED
		print "TreeCallback: Item " & item->label() & " opened"
	case FL_TREE_REASON_CLOSED
		print "TreeCallback: Item " & item->label() & " closed"
	end select
end sub

'main program
Fl.scheme("gtk+")
dim win as Fl_Double_Window = Fl_Double_Window(250, 400, "Simple Tree")
win.begin()
'Create the tree
dim tree as Fl_Tree= Fl_Tree(10, 10, win.w()-20, win.h()-20)
tree.showroot(0)	'don't show root of tree
dim cb as Fl_Callback = @TreeCallback
tree.callback(cb)	'setup a callback for the tree

'Add some items
tree.add("Flintstones/Fred")
tree.add("Flintstones/Wilma")
tree.add("Flintstones/Pebbles")
tree.add("Simpsons/Homer")
tree.add("Simpsons/Marge")
tree.add("Simpsons/Bart")
tree.add("Simpsons/Lisa")
tree.add(!"Pathnames/\\/bin")	'front slashes
tree.add(!"Pathnames/\\/usr\\/sbin")
tree.add(!"Pathnames/C:\\\\Program Files")	'backslashes
tree.add(!"Pathnames/C:\\\\Documents and Settings")

tree.close_("Simpsons")
tree.close_("Pathnames")

win.end_()
win.resizable(win)
win.show()
Fl.run_()
