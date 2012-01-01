CoordMode, Mouse, Relative

null := ""

array := Object("t1", ""
			   ,"t2", ""
			   ,"t3", ""
			   ,"t4", ""
			   ,"t5", ""
			   ,"t6", ""
			   ,"t7", ""
			   ,"t8", "")

;msgbox, % (array["t1"] == null) ? "++++" : "+++" . array["t1"]

OnMessage(0x0201, "WM_LBUTTONDOWN")
OnMessage(0x0204, "WM_RBUTTONDOWN")

Gui, 1: Font, s10, Lucida Console
Gui, 1: Add, Text, w350 h250 vedGmTbl, % gameTable("", "z")
Gui, 1: Show, w170 h170


WM_LBUTTONDOWN(){
	Global
	MouseGetPos, mposx, mposy,, guiCtrl
	xoGui(mposx, mposy, "lBt")
}

WM_RBUTTONDOWN(){
	Global
	MouseGetPos, mposx, mposy,, guiCtrl
	xoGui(mposx, mposy, "rBt")
}

xoGui(mx, my, mbt){
	;We store "x" or "y" in var "mbt" depending if the user
	;clicks left or right respectively.
	mbt := mbt == "lBt" ? "x" : "o"
	If (mx < 50 && my < 75)
		GuiControl,, edGmTbl, % gameTable( "t1", mbt)
	If (mx > 50 && mx < 105 && my < 75)
		GuiControl,, edGmTbl, % gameTable( "t2", mbt)
	If (mx > 110 && my < 75)
		GuiControl,, edGmTbl, % gameTable( "t3", mbt)
	If (mx < 50 && my > 80 && my < 120)
		GuiControl,, edGmTbl, % gameTable( "t4", mbt)
	If ()
		GuiControl,, edGmTbl, % gameTable( "t5", mbt)
	If ()
		GuiControl,, edGmTbl, % gameTable( "t6", mbt)
	If ()
		GuiControl,, edGmTbl, % gameTable( "t7", mbt)
	If ()
		GuiControl,, edGmTbl, % gameTable( "t8", mbt)
	If ()
		GuiControl,, edGmTbl, % gameTable( "t9", mbt)
}

gameTable(k, v){
	Global
	array[k] := v
	sp1 := array["t1"] == null ? "    " : "   "
	sp2 := array["t2"] == null ? "   | " : "  |  "
	sp4 := array["t4"] == null ? "    " : "   "
	sp5 := array["t5"] == null ? "   | " : "  |  "
	sp7 := array["t7"] == null ? "    " : "   "
	sp8 := array["t8"] == null ? "   | " : "  |  "
	Return, ""
 	. "     |     |`n"
 	. sp1 . array["t1"] . " |  " . array["t2"] . sp2 . array["t3"] . "`n"
 	. "     |     |`n"
	. " ----------------`n"
 	. "     |     |`n"
 	. sp4 . array["t4"] . " |  " . array["t5"] . sp5 . array["t6"] . "`n"
 	. "     |     |`n"
	. " ----------------`n"
 	. "     |     |`n"
 	. sp7 . array["t7"] . " |  " . array["t8"] . sp8 . array["t9"] . "`n"
 	. "     |     |`n"
}

/* Coordinates (x over y)
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


 	. "     |     |`n"
 	. v == null ? "++++" : "+++" . array["t1"] . " | " . array["t2"] . "    | " . array["t3"] . "`n"
 	. "     |     |`n"
	. " ----------------`n"
 	. "     |     |`n"
 	. v == null ? "++++" : "+++" . array["t4"] . " | " . array["t5"] . "    | " . array["t6"] . "`n"
 	. "     |     |`n"
	. " ----------------`n"
 	. "     |     |`n"
 	. v == null ? "++++" : "+++" . array["t7"] . " | " . array["t8"] . "    | " . array["t9"] . "`n"
 	. "     |     |`n"

 */