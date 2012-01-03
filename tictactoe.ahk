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
	table := Object("t11", ""
			       ,"t12", ""
			       ,"t13", ""
			       ,"t21", ""
			       ,"t22", ""
			       ,"t23", ""
			       ,"t31", ""
			       ,"t32", "")    

	OnMessage(0x0201, "WM_LBUTTONDOWN")
	OnMessage(0x0204, "WM_RBUTTONDOWN")
;}

;Main GUI {
	mainGui()
;}

;Main Code {
;}

;Functions {
	mainGui(){
		Global
		Gui, 1: Font, s10, Lucida Console
		Gui, 1: Add, Text, w350 h250 vedGmTbl, % drawTable("", "")
		Gui, 1: Show, w170 h170
		Return
	}

	WM_LBUTTONDOWN(){
		sendCoord("X")
		Return
	}

	WM_RBUTTONDOWN(){
		sendCoord("O")
		Return
	}

	sendCoord(mbt){
		MouseGetPos, mposx, mposy
		getCoord(mposx, mposy, mbt)
		checkWinner()
	}

	getCoord(mx, my, mbt){
	   if (mx < 50)
	      x := 1
	   else if (mx > 60 && mx < 100)
	      x := 2
	   else if (mx > 110)
	      x := 3
	   if (my < 75)
	      y := 1
	   else if (my > 80 && my < 120)
	      y := 2
	   else if (my > 130)
	      y := 3
	   coord := "t" . x . y
	   CoordChecker(coord, mbt)
	   Return
	}
	CoordChecker(corKey, mbt){
		GuiControl,, edGmTbl, % drawTable(corKey, mbt)
		table[corKey] := mbt
	}

	drawTable(k, v){
		Global
		;We need to compensate for when the script adds the
		;X or O character to the grid. Otherwise the grid
		;would become unaligned.
		table[k] := v
		sp1 := table["t11"] == null ? "    " : "   "
		sp2 := table["t12"] == null ? "   |  " : "  |  "
		sp4 := table["t21"] == null ? "    " : "   "
		sp5 := table["t22"] == null ? "   |  " : "  |  "
		sp7 := table["t31"] == null ? "    " : "   "
		sp8 := table["t32"] == null ? "   |  " : "  |  "
		sp9 := table["t33"] == null ? "    " : "   "
		Return, ""
	 	. "     |     |`n"
	 	. sp1 . table["t11"] . " |  " . table["t12"] . sp2 . table["t13"] . "`n"
	 	. "     |     |`n"
		. " ----------------`n"
	 	. "     |     |`n"
	 	. sp4 . table["t21"] . " |  " . table["t22"] . sp5 . table["t23"] . "`n"
	 	. "     |     |`n"
		. " ----------------`n"
	 	. "     |     |`n"
	 	. sp7 . table["t31"] . " |  " . table["t32"] . sp8 . table["t33"] . "`n"
	 	. "     |     |`n"
	 	Return
	}

	checkWinner(){
		Global
		For key, value in table
		{
			tblVal := value == "" ? 0 : 1
			i += tblVal
		}
		If (!i)
			Return
		If (table["t11"] == table["t12"] && table["t11"] == table["t13"]) && (table["t11"] != null)
			clearGui("Top Across")
		If (table["t21"] == table["t22"] && table["t21"] == table["t23"]) && (table["t21"] != null)
			clearGui("Middle Across")
		If (table["t31"] == table["t32"] && table["t31"] == table["t33"]) && (table["t31"] != null)
			clearGui("Bottom Across")
		If (table["t11"] == table["t21"] && table["t11"] == table["t31"]) && (table ["t11"] != null)
			clearGui("Left Down")
		If (table["t11"] == table["t22"] && table["t11"] == table["t33"]) && (table ["t11"] != null)
			clearGui("Top Left to Bottom Right")
		i := null
	}

	clearGui(wintype){
		Global
		ToolTip, Winner! (%wintype%)
		For key, value in table
			GuiControl,, edGmTbl, % drawTable(key, "")
	}
;}
