null := ""

ar_Coords := Object("crd1", "(mx < 50 && my < 75)"
			  , "crd2", "(mx > 60 && mx < 105 && my < 75)"
			  , "crd3", "(mx > 110 && my < 75)"
			  , "crd4", "(mx < 50 && my > 80 && my < 120)"
			  , "crd5", "(mx > 60 && mx < 100 && my > 80 && my < 120)"
			  , "crd6", "(mx > 110 && my > 80 && my < 120)"
			  , "crd7", "(mx < 50 && my > 130)"
			  , "crd8", "(mx > 60 && mx < 100 && my > 130)"
			  , "crd9", "(mx > 110 && my > 130)"

getCoord(mx, my, mbt){
	If (mx < 50 && my < 75)
	   ;CoordChecker("t[row].[col]", [Mouse button])
		CoordChecker("t1.1", mbt)
	Else If (mx > 60 && mx < 105 && my < 75)
		CoordChecker("t1.2", mbt)
	Else If (mx > 110 && my < 75)
		CoordChecker("t1.3", mbt)
	Else If (mx < 50 && my > 80 && my < 120)
		CoordChecker("t2.1", mbt)
	Else If (mx > 60 && mx < 100 && my > 80 && my < 120)
		CoordChecker("t2.2", mbt)
	Else If (mx > 110 && my > 80 && my < 120)
		CoordChecker("t2.3", mbt)
	Else If (mx < 50 && my > 130)
		CoordChecker("t3.1", mbt)
	Else If (mx > 60 && mx < 100 && my > 130)
		CoordChecker("t3.2", mbt)
	Else If (mx > 110 && my > 130)
		CoordChecker("t3.3", mbt)
	Return
}

CoordChecker(corKey, mbt){
	GuiControl,, edGmTbl, % gameTable(corKey, mbt)
	array["t1"] := mbt
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

