;###
;# Tic Tac Toe
;# Version: 0.0.1
;# Author: adabo
;# Date: 12-30-11
;###

;Directives {
	#SingleInstance Force
	#Persistent
;}

;Initialize {
	array := Object("t1", ""
			       ,"t2", ""
			       ,"t3", ""
			       ,"t4", ""
			       ,"t5", ""
			       ,"t6", ""
			       ,"t7", ""
			       ,"t8", "")    

	OnMessage(0x0201, "WM_LBUTTONDOWN")
	OnMessage(0x0204, "WM_RBUTTONDOWN")
;}

;Main GUI {
	mGui()
;}

;Main Code {
;}

;Functions {
	mGui(){
		Global
		Gui, 1: Font, s10, Lucida Console
		Gui, 1: Add, Text, w350 h250 vedGmTbl, % gameTable("", "")
		Gui, 1: Show, w170 h170
		Return
	}

	WM_LBUTTONDOWN(){
		Global
		MouseGetPos, mposx, mposy
		xoGui(mposx, mposy, "lBt")
		checkWinner()
		Return
	}

	WM_RBUTTONDOWN(){
		Global
		MouseGetPos, mposx, mposy
		xoGui(mposx, mposy, "rBt")
		checkWinner()
		Return
	}

	xoGui(mx, my, mbt){
		;We store "x" or "o" in var "mbt" depending if the user
		;clicks left or right respectively.
		Global
		mbt := mbt == "lBt" ? "x" : "o"
		If (mx < 50 && my < 75)
		{
			GuiControl,, edGmTbl, % gameTable("t1", mbt)
			array["t1"] := mbt
		}
		Else If (mx > 60 && mx < 105 && my < 75)
		{
			GuiControl,, edGmTbl, % gameTable("t2", mbt)
			array["t2"] := mbt
		}
		Else If (mx > 110 && my < 75)
		{
			GuiControl,, edGmTbl, % gameTable("t3", mbt)
			array["t3"] := mbt
		}
		Else If (mx < 50 && my > 80 && my < 120)
		{
			GuiControl,, edGmTbl, % gameTable("t4", mbt)
			array["t4"] := mbt
		}
		Else If (mx > 60 && mx < 100 && my > 80 && my < 120)
		{
			GuiControl,, edGmTbl, % gameTable("t5", mbt)
			array["t5"] := mbt
		}
		Else If (mx > 110 && my > 80 && my < 120)
		{
			GuiControl,, edGmTbl, % gameTable("t6", mbt)
			array["t6"] := mbt
		}
		Else If (mx < 50 && my > 130)
		{
			GuiControl,, edGmTbl, % gameTable("t7", mbt)
			array["t7"] := mbt
		}
		Else If (mx > 60 && mx < 100 && my > 130)
		{
			GuiControl,, edGmTbl, % gameTable("t8", mbt)
			array["t8"] := mbt
		}
		Else If (mx > 110 && my > 130)
		{
			GuiControl,, edGmTbl, % gameTable("t9", mbt)
			array["t9"] := mbt
		}
		Return
	}

	gameTable(k, v){
		Global
		;We need to compensate for when the script adds the
		;x or o character to the grid. Otherwise the grid
		;would become unaligned.
		array[k] := v
		sp1 := array["t1"] == null ? "    " : "   "
		sp2 := array["t2"] == null ? "   |  " : "  |  "
		sp4 := array["t4"] == null ? "    " : "   "
		sp5 := array["t5"] == null ? "   |  " : "  |  "
		sp7 := array["t7"] == null ? "    " : "   "
		sp8 := array["t8"] == null ? "   |  " : "  |  "
		sp9 := array["t9"] == null ? "    " : "   "
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
	 	Return
	}

	checkWinner(){
		Global
		For key, value in array
		{
			tblVal := value == "" ? 0 : 1
			i += tblVal
		}
		If (!i)
			Return
		If (array["t1"] == array["t2"] && array["t1"] == array["t3"]) && (array["t1"] != null)
		{
			ToolTip, Winner! (Top Across)
			clearGui()
		}
		If (array["t4"] == array["t5"] && array["t4"] == array["t6"]) && (array["t4"] != null)
		{
			ToolTip, Winner! (Middle Across)
			clearGui()
		}
		If (array["t7"] == array["t8"] && array["t7"] == array["t9"]) && (array["t7"] != null)
		{
			ToolTip, Winner! (Bottom Across)
			clearGui()
		}
		If (array["t1"] == array["t4"] && array["t1"] == array["t7"]) && (array ["t1"] != null)
		{
			ToolTip, Winner! (Left Down
			clearGui()
		}
		If (array["t1"] == array["t5"] && array["t1"] == array["t9"]) && (array ["t1"] != null)
		{
			ToolTip, Winner! (Diagonal Top Left)
			clearGui()
		}
		i := null
	}

	clearGui(){
		Global
		For key, value in array
			GuiControl,, edGmTbl, % gameTable(key, "")
	}
;}
