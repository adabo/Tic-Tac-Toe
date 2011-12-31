CoordMode, Mouse, Relative

OnMessage(0x0201, "WM_LBUTTONDOWN")

Gui, 1: Font, s10, Lucida Console
Gui, 1: Add, Text, w350 h250, % gameTable(,)
Gui, 1: Show, w170 h170


WM_LBUTTONDOWN(){
	Global
	MouseGetPos, mposx, mposy,, guiCtrl
	ToolTip, %mposx% %mposy%
	xoGui(mposx, mposy)
}

xoGui(mx, my){
	If (mx > 55 or my > 75)
		Return
	Else
		
}

gameTable(t1, t2, t3, t4, t5, t6, t7, t8, t9){
	Global
	. "     |     |`n"
 	. " t1  | t2  | t3`n"
 	. "     |     |`n"
	. " ----------------`n"
 	. "     |     |`n"
 	. " t4  | t5  | t6`n"
 	. "     |     |`n"
	. " ----------------`n"
 	. "     |     |`n"
 	. " t7  | t8  | t9`n"
 	. "     |     |`n"
}
     |     |
 10  |  60 |  110
 35  |  35 |  35
 ----------------
     |     |
 10  |  60 |  110
 80  |  80 |  80
 ----------------
     |     |
 10  |  60 |  110
 130 |  130|  130